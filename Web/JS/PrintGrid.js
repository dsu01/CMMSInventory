// JScript File

   
   function CallPrint( strid, displayText )
   {
    var displayTextDiv = document.getElementById( displayText );

    var prtContent = document.getElementById( strid );
    var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=800,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.write('<html><head></head><body><style type="text/css">a,th{color:#069 !important;text-decoration:underline;font-weight:bold;}.hideLink{text-decoration:none;color:black !important;font-weight:normal !important;cursor:none;}</style>');
    WinPrint.document.write(displayTextDiv.innerHTML + prtContent.innerHTML);
    WinPrint.document.write('</body></html>');
    WinPrint.document.close();
    //while (WinPrint.document.getElementsByTagName('A').length > 0) 
    clearCurrentLink(WinPrint, 'A');
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
   }

   function clearCurrentLink(win, s) {
       var a = win.document.getElementsByTagName(s);
       for (var i = 0; i < a.length; i++) {
           if (a[i].href.startsWith('javascript:__doPostBack')) {
               a[i].href = '#'; a[i].setAttribute('class', 'hideLink');
            
               //var parent = a[i].parentNode;
               //var textNode = win.document.createTextNode(a[i].innerHTML);
               //parent.removeChild(a[i]);
               //parent.appendChild(textNode);
           }
       }
   }