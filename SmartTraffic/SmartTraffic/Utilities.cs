using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SmartTraffic {
    public static class Utilities {
        // Takes TexBoxes and checks if they're empty
        public static bool isTextBoxEmpty(List<TextBox> textBoxes) {
            foreach (TextBox txt in textBoxes) {
                if (string.IsNullOrEmpty(txt.Text)) {
                    return true;
                }
            }
            return false;
        }

        // Checks if any textBox in the view is empty
        public static bool isTextBoxEmpty(View view) {
            foreach (TextBox txt in view.Controls.OfType<TextBox>()) {
                if (string.IsNullOrEmpty(txt.Text)) {
                    return true;
                }
            }

            return false;
        }

        // Clears both TextBoxes and Placeholders
        public static void clearAll(View view) {
            foreach (TextBox txt in view.Controls.OfType<TextBox>()) {
                txt.Text = null;
            }

            foreach (PlaceHolder placeHolder in view.Controls.OfType<PlaceHolder>()) {
                placeHolder.Visible = false;
            }

            foreach (FileUpload fileUpload in view.Controls.OfType<FileUpload>()) {
                fileUpload.PostedFile.InputStream.Dispose();
            }
        }
        
        // Clears only the Textboxes
        public static void clearAllTextBoxes(View view) {
            foreach (TextBox txt in view.Controls.OfType<TextBox>()) {
                txt.Text = null;
            }
        }

        // Clears only the Placeholders
        public static void clearAllPlaceHolders(View view) {
            foreach (PlaceHolder placeHolder in view.Controls.OfType<PlaceHolder>()) {
                placeHolder.Visible = false;
            }
        }

        public static bool isImage(string fileExtension) {
            // Allow only files with .png, .jpeg or .jpg extensions to be uploaded.
            if ((fileExtension == ".png") || (fileExtension == ".jpeg") || (fileExtension == ".jpg")) {
                return true;
            } else {
                return false;
            }
        }

        public static string isSeen(bool isSeen)
        {
            if (isSeen)
            {
                return "read";
            }
            else
            {
                return "unread";
            }
        }

        public static string shortenDescription(string description)
        {
            if(description.Length > 30)
            {
                return description.Substring(0, 30) + "...";
            }
            else
            {
                return description;
            }
        }

        static Random r = new Random();

        public static string getRandomClass()
        {
            
            int num = r.Next(5);

            if (num <= 1)
            {
                return "success";
            }
            else if(num > 1 && num <= 2)
            {
                return "danger";
            }
            else if(num > 2 && num <= 3)
            {
                return "warning";
            }
            else
            {
                return "brown";
            }
        }
    }
}