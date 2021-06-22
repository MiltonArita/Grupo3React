import React, { Fragment} from 'react';
import ls from 'local-storage';
import { useFormik } from 'formik';
import axios from 'axios';
function EliminarCliente (props) {


    let cliente = props.location.state;

    const eliminar = (cliente) => {

        if (window.confirm("Seguro que desea eliminar esta lista")) {
          axios.delete('https://localhost:44309/api/Clientes',cliente)
        .then(response => {
          if (response.request.status === 500){
            window.alert("Eliminado exitosamente");
            props.history.goBack(); //Regresa al main
          }
          else{
            window.alert("Error al eliminar la cliente");
          }
        })
        .catch(error => {
          console.log(error);
          window.alert("Error al eliminar el cliente");  });  


            /* let lista = ls.get("misCita");
            let indice = lista.findIndex(book => book.IdCliente === cliente.IdCliente);
            lista.splice(indice, 1);
            ls.set("misCita", lista);
           
            props.history.goBack(); */
        }
    }

    const formik = useFormik({
        initialValues: {
          idCliente: cliente.idCliente,
          cliente: cliente.cliente,
          fechaNacimiento: cliente.fechaNacimiento,
          procedencia: cliente.procedencia,
          identidad: cliente.identidad,
            

        },
        onSubmit: values => {
            eliminar(values);
        },
    });


    return (
      <Fragment>
      <div>-</div>
      <div>-</div> <div>-</div> <div>-</div> <div>-</div> <div></div>
      <div className="col-sm-12 col-lg-6 offset-lg-3">
      <br />
      <br />
      
      <form onSubmit={formik.handleSubmit}>
        <div className="form-group">
          <label htmlFor="idCliente">IdCliente</label>
          <input
            type="number"
            className="form-control"
            id="idCliente"
            onChange={formik.handleChange}
            value={formik.values.idCliente}
          />
        </div>
        <div className="form-group">
          <label htmlFor="cliente">Cliente</label>
          <input
            type="text"
            className="form-control"
            id="cliente"
            onChange={formik.handleChange}
            value={formik.values.cliente}
          />
        </div>

       

        <div className="form-group">
          <label htmlFor="fechaNacimiento">FechaNacimiento</label>
          <input
            type="date"
            className="form-control"
            id="fechaNacimiento"
            onChange={formik.handleChange}
            value={formik.values.fechaNacimiento}
          />
        </div>
        <div className="form-group">
          <label htmlFor="procedencia">Procedencia</label>
          <input
            type="text"
            className="form-control"
            id="procedencia"
            onChange={formik.handleChange}
            value={formik.values.procedencia}
          />
        </div>
        <div className="form-group">
          <label htmlFor="identidad">Identidad</label>
          <input
            type="text"
            className="form-control"
            id="identidad"
            onChange={formik.handleChange}
            value={formik.values.identidad}
          />
        </div>
        
                <button type="submit" className="mt-4 btn-danger">  
                    Eliminar
          </button>
            </form>

        </div>   </Fragment>
    );
}

export default EliminarCliente;