using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NIH.CMMS.Inventory.BOL.People
{
    public class GeneralUser
    {
         #region "Private properties"
        private string _userFirstName = "";
        private string _userMiddleName = "";
        private string _userLastName = "";
       
        private string _property = "";
        private string _building = "";
        private string _city = "";
        private string _room = "";
        private string _phone = "";
        private bool _active;
        //private string _takenBy = "";
        //private int _ysnBethesda = 0;
        //private int _ysnPoolesville = 0;
        //private int _ysnBaltimore = 0;
        //private int _ysnNorthCarolina = 0;
        //private int _ysnRML = 0;
        //private int _ysnLeased = 0;
        #endregion

      #region " Business Properties "
        public bool Active
        {
            get { return _active; }
            set
            {
                _active = value;
            }
        }

        public string Building
        {
            get { return _building; }
            set
            {
                _building = value;
            }
        }

        public string City
        {
            get { return _city; }
            set
            {
                _city = value;
            }
        }

        public string Phone
        {
            get { return _phone; }
            set
            {
                _phone = value;                
            }
        }

        public string Room
        {
            get { return _room; }
            set
            {
                _room = value;
            }
        }

        //public string Role
        //{
        //    get { return _role; }
        //    set
        //    {
        //        _role = value;
        //    }
        //}

        public string Property
        {
            get { return _property; }
            set
            {
                _property = value;                
            }
        }

        //public string TakenBy
        //{
        //    get { return _takenBy; }
        //    set
        //    {
        //        _takenBy = value;
        //    }
        //}
       
        public string UserFirstName
        {
            get { return _userFirstName; }
            set
            {
                _userFirstName = value;
            }
        }

        public string UserMiddleName
        {
            get { return _userMiddleName; }
            set
            {
                _userMiddleName = value;
            }
        }

        public string UserLastName
        {
            get { return _userLastName; }
            set
            {
                _userLastName = value;
            }
        }

        public string UserFullName
        {
            get { return _userFirstName + " " + _userLastName; }
          
        }
       

        #endregion

        public GeneralUser()
        {
            //populate the properties with default values
        }
    }
}
