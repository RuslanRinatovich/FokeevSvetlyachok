//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfAppOrbit.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class MaterialWriteOff
    {
        public int MaterialWriteOffId { get; set; }
        public int MaterialId { get; set; }
        public string Reason { get; set; }
        public System.DateTime OperationDate { get; set; }
        public int Count { get; set; }
    
        public virtual Material Material { get; set; }
    }
}