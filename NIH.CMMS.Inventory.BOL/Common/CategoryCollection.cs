using System;
using System.Collections;
using System.Linq;
using System.Text;

namespace NIH.CMMS.Inventory.BOL.Common
{
    public class CategoryCollection : CollectionBase
    {
        public CategoryCollection()
        {
        }

        public Category Item(int index)
        {
            return (Category)List[index];
        }

        public int Add(Category details)
        {
            return List.Add(details);
        }

    }

    public class Category : NameValue
    {
        ArrayList _subCategory;

        public Category(int key, string description)
            : base(key, description)
        {
        }

        public ArrayList SubCategory
        {
            get { return _subCategory; }
            set
            {
                _subCategory = value;
            }
        }

        public bool hasSubCategories()
        {
            return ((_subCategory != null) || (_subCategory.Count == 0)) ? false : true;
        }
    }

    public class NameValue
    {

        int _key;
        string _description;

        public NameValue()
        {
        }

        public NameValue(int key, string description)
        {
            _key = key;
            _description = description;
        }

        public int Key
        {
            get { return _key; }
            set
            {
                _key = value;
            }
        }

        public string Description
        {
            get { return _description; }
            set
            {
                _description = value;
            }
        }
    }
}
