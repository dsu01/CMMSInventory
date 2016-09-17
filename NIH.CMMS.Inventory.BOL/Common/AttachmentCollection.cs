using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace NIH.CMMS.Inventory.BOL.Common
{
    public class AttachmentCollection : CollectionBase
    {
        public AttachmentCollection()
        {
        }

        public Attachment Item(int index)
        {
            return (Attachment)List[index];
        }

        public int Add(Attachment details)
        {
            return List.Add(details);
        }


    }
}