using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using ModelExamen;

[Serializable]
public class Service : IService
{
    
    public ResultRequest ActualizarExamen(int id, string nombre, string descripcion)
    {
        try
        {
            using (Model model = new Model())
            {
                tblExamen examen = new tblExamen() { idExamen = id, Nombre = nombre, Descripcion = descripcion };
                model.tblExamen.AddOrUpdate(examen);
                model.SaveChanges();
                return new ResultRequest { Success = true, Message = "Done" };
            }
        }
        catch(Exception ex)
        {
            return new ResultRequest { Success = false, Message = ex.Message };
        }
    }

    public ResultRequest AgregarExamen(int id, string nombre, string descripcion)
    {
        try
        {
            using (Model model = new Model())
            {
                tblExamen examen = new tblExamen() { idExamen = id, Nombre = nombre, Descripcion = descripcion };
                model.tblExamen.Add(examen);
                model.SaveChanges();
                return new ResultRequest { Success = true, Message = "Done" };
            }
        }
        catch (Exception ex)
        {
            return new ResultRequest { Success = false, Message = ex.Message };
        }
    }

    public List<tblExamen> ConsultarExamen(int id, string nombre, string descripcion)
    {
        try
        {
            using (Model model = new Model())
            {
                return model.tblExamen.Where(x=> x.idExamen == id || x.Nombre == nombre || x.Descripcion == descripcion).ToList();
            }
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public ResultRequest EliminarExamen(int id)
    {
        try
        {
            using (Model model = new Model())
            {
                tblExamen finded = model.tblExamen.FirstOrDefault(x=> x.idExamen == id);
                model.tblExamen.Remove(finded);
                model.SaveChanges();
                return new ResultRequest { Success = true, Message = "Done" };
            }
        }
        catch (Exception ex)
        {
            return new ResultRequest { Success = false, Message = ex.Message };
        }
    }
}
