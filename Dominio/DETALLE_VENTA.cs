﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Dominio
{
    public partial class DETALLE_VENTA
    {
        public int IdDetalleVenta { get; set; }
        public int? IdVenta { get; set; }
        public int? IdProducto { get; set; }
        public decimal? PrecioVenta { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Total { get; set; }

        public virtual PRODUCTO IdProductoNavigation { get; set; }
        public virtual VENTA IdVentaNavigation { get; set; }
    }
}