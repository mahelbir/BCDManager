using System;
using System.Collections;

namespace BCDManager
{
    public static class ArrayFunctions
    {

        public static int FindIndex(ArrayList arrayList, string[] check)
        {
            int index = -1;
            for (int i = 0; i < arrayList.Count; i++)
            {
                string[] item = arrayList[i] as string[];
                if (item[0] == check[0])
                {
                    index = i;
                }
            }
            return index;
        }

        public static ArrayList MoveItem(ArrayList arrayList, int oldIndex, int newIndex)
        {
            if (oldIndex >= 0 && oldIndex < arrayList.Count && newIndex >= 0 && newIndex < arrayList.Count)
            {
                object itemToMove = arrayList[oldIndex];
                arrayList.RemoveAt(oldIndex);
                arrayList.Insert(newIndex, itemToMove);
            }
            return arrayList;
        }
    }
}