using apiexamen.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using apiexamen.ServiceReference1;

namespace apiexamen
{
    public class clsExamen
    {
        public bool useWS { get; set; }

        public void AgregarExamen(int id, string nombre, string descripcion)
        {
            if (useWS)
            {
                ServiceReference1.ServiceClient service = new ServiceClient();
                service.AgregarExamen(id, nombre, descripcion);
            }
            else
            {
                using (BdiexamenEntities1 entities = new BdiexamenEntities1())
                {

                    entities.spAgregar(id, nombre, descripcion);
                    entities.SaveChanges();

                }
            }
        }
        public void ActualizarExamen(int id, string nombre, string descripcion)
        {
            if (useWS)
            {
                ServiceReference1.ServiceClient service = new ServiceClient();
                service.ActualizarExamen(id, nombre, descripcion);
            }
            else
            {
                using (BdiexamenEntities1 entities = new BdiexamenEntities1())
                {

                    entities.spActualizar(id, nombre, descripcion);
                    entities.SaveChanges();

                }
            }
        }
    }
    public class ResultAPI
    {
        public bool Success { get; set; }
        public string Message { get; set; }
    }
}
