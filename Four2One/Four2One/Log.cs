/*using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Four2One
{
    public class Log : INotifyPropertyChanged
    {
        
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }


        private int _logID;
        private string _logType;
        private string _logMessage;

        
        public int LogID
        {
            get { return _logID; }
            set
            {
                if (_logID != value)
                {
                    _logID = value;
                    OnPropertyChanged();
                }
            }
        }
        public string LogType
        {
            get { return _logType; }
            set
            {
                if (_logType != value)
                {
                    _logType = value;
                    OnPropertyChanged();
                }
            }
        }
        public string LogMessage
        {
            get { return _logMessage; }
            set
            {
                if (_logMessage != value)
                {
                    _logMessage = value;
                    OnPropertyChanged();
                }
            }
        }
    
    }
}
*/