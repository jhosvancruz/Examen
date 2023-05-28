using ModelExamen;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
[ServiceContract]
public interface IService
{
	[OperationContract]
    ResultRequest AgregarExamen(int id, string nombre, string descripcion);
    [OperationContract]
    ResultRequest ActualizarExamen(int id, string nombre, string descripcion);
    [OperationContract]
    ResultRequest EliminarExamen(int id);
    [OperationContract]
    List<tblExamen> ConsultarExamen(int id, string nombre, string descripcion);
   

	// TODO: agregue aquí sus operaciones de servicio
}
public class ResultRequest
{
    [DataMember]
    public bool Success { get; set; }

    [DataMember]
    public string Message { get; set; }
}
