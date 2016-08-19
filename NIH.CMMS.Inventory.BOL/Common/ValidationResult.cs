using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NIH.CMMS.Inventory.BOL.Common
{
    public class ValidationResult
    {

        public ValidationResult(bool success, string reason)
        {
            this.success = success;
            this.reason = reason;
        }

        private bool success;
        public bool Success
        {
            get
            {
                return success;
            }

        }

        private string reason;
        public string Reason
        {
            get
            {
                return reason;
            }

        }


    }
}
