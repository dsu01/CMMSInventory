using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace NIH.CMMS.Inventory.BOL.People
{
    public class LoginUser : GeneralUser
    {
        private string _userLoginName;
        private string _takenBy;
        private string _role;

        private int _ysnBethesda = 0;
        private int _ysnPoolesville = 0;
        private int _ysnBaltimore = 0;
        private int _ysnNorthCarolina = 0;
        private int _ysnRML = 0;
        private int _ysnLeased = 0;
        private int _ysnInventory = 0;

        //different than cmms
        private string _labor; //labor is the full name
        private int _ysnFrederick = 0;
        private int _refreshInterval;
        private int _daysLimit;
        private int _audioWarning;


        public string LaborName
        {
            get { return _labor; }
            set
            {
                _labor = value;
            }
        }
        public string UserLoginName
        {
            get { return _userLoginName; }
            set
            {
                _userLoginName = value;
            }
        }
        public string TakenBy
        {
            get { return _takenBy; }
            set
            {
                _takenBy = value;
            }
        }
        public string Role
        {
            get { return _role; }
            set
            {
                _role = value;
            }
        }

        public int YsnBethesda
        {
            get { return _ysnBethesda; }
            set
            {
                _ysnBethesda = value;
            }
        }
        public int YsnPoolesville
        {
            get { return _ysnPoolesville; }
            set
            {
                _ysnPoolesville = value;
            }
        }
        public int YsnBaltimore
        {
            get { return _ysnBaltimore; }
            set
            {
                _ysnBaltimore = value;
            }
        }
        public int YsnNorthCarolina
        {
            get { return _ysnNorthCarolina; }
            set
            {
                _ysnNorthCarolina = value;
            }
        }
        public int YsnRML
        {
            get { return _ysnRML; }
            set
            {
                _ysnRML = value;
            }
        }
        public int YsnLeased
        {
            get { return _ysnLeased; }
            set
            {
                _ysnLeased = value;
            }
        }
        public int YsnFrederick
        {
            get { return _ysnFrederick; }
            set
            {
                _ysnFrederick = value;
            }
        }
        public int YsnInventory
        {
            get { return _ysnInventory; }
            set
            {
                _ysnInventory = value;
            }
        }
        public int RefreshInterval
        {
            get { return _refreshInterval; }
            set
            {
                _refreshInterval = value;
            }
        }
        public int DaysLimit
        {
            get { return _daysLimit; }
            set
            {
                _daysLimit = value;
            }
        }
        public int AudioWarning
        {
            get { return _audioWarning; }
            set
            {
                _audioWarning = value;
            }
        }
    }
}
