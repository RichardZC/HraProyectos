﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Dominio
{
    public partial class CATEGORIA
    {
        public CATEGORIA()
        {
            PRODUCTO = new HashSet<PRODUCTO>();
        }

        public int IdCategoria { get; set; }
        public string Descripcion { get; set; }
        public DateTime? FechaRegistro { get; set; }

        public virtual ICollection<PRODUCTO> PRODUCTO { get; set; }
    }
}