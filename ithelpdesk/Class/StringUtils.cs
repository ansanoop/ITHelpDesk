using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ithelpdesk
{
    public class StringUtils
    {
        public static string emptyOrString(object str)
        {
            if (str == null)
                return "";
            return str.ToString();
        }

        /* This function is to format an unformated number xxxxxxxxxx
        to (xxx)xxx-xxxx
        */
        public static string formatPhoneNumber(string number)
        {
            //   return String.Format("{0:(###)###-####}", double.Parse(number));
            return number;
        }
    }
}