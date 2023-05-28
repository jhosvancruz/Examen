using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ModelExamen
{
    public partial class Model : DbContext
    {
        public Model()
            : base("name=ModelExamen")
        {
        }

        public virtual DbSet<tblExamen> tblExamen { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tblExamen>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<tblExamen>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);
        }
    }
}
