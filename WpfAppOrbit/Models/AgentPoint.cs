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
    
    public partial class AgentPoint
    {
        public int PointId { get; set; }
        public string PointName { get; set; }
        public string Address { get; set; }
        public int AgentId { get; set; }
    
        public virtual Agent Agent { get; set; }
    }
}
