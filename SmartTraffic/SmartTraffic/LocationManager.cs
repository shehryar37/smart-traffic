using SmartTraffic.Forms;
using System;
using System.Device.Location;
using System.Linq;

namespace SmartTraffic
{
    [System.Security.SecurityCritical]
    public static class LocationManager
    {
        public static void getLocation(int sessionID)
        {

            CLocation myLocation = new CLocation();
            myLocation.GetLocationEvent(sessionID);

        }

        public static double getLongitude(int EmergencyID)
        {
            using(DatabaseDataContext db = new DatabaseDataContext())
            {
                tblEmergency emergency = db.tblEmergencies.Where(x => x.EmergencyID == EmergencyID).FirstOrDefault();

                return emergency.EmergencyLongitude;
            }
        }

        public static double getLatitude(int EmergencyID)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                tblEmergency emergency = db.tblEmergencies.Where(x => x.EmergencyID == EmergencyID).FirstOrDefault();

                return emergency.EmergencyLatitude;
            }
        }

        private class CLocation
        {
            private GeoCoordinateWatcher watcher;
            private int SessionID;

            public void GetLocationEvent(int sessionID)
            {
                watcher = new GeoCoordinateWatcher();
                watcher.PositionChanged += new EventHandler<GeoPositionChangedEventArgs<GeoCoordinate>>(watcher_PositionChanged);

                SessionID = sessionID;

                watcher.TryStart(false, TimeSpan.FromMilliseconds(5000));
            }

            private void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
            {
                saveLocation(e.Position.Location.Latitude, e.Position.Location.Longitude);
            }

            private void saveLocation(double Latitude, double Longitude)
            {
                using(DatabaseDataContext db = new DatabaseDataContext())
                {
                    tblSession session = db.tblSessions.Where(x => x.SessionID == SessionID).FirstOrDefault();

                    if(session.SessionLongitude == 0)
                    {
                        session.SessionLongitude = Longitude;
                    }

                    if (session.SessionLatitude == 0)
                    {
                        session.SessionLatitude = Latitude;
                    }

                    db.SubmitChanges();
                }
            }
        }
    }
}