using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace UnitTests
{
    public class CtpsDataContext: DbContext
    {
        public DbSet<tblProduct> tblProduct { get; set; }
       // public DbSet<Author> Authors { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.\;Database=Testdb01;Trusted_Connection=True;MultipleActiveResultSets=true");
        }
    }
}
