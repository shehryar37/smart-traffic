using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartTraffic {
    public static class SessionManager {
        private static long userID = 0;
        private static int sessionID = 0;

        public static long UserID { get => userID; set => userID = value; }
        public static int SessionID { get => sessionID; set => sessionID = value; }
    }
}