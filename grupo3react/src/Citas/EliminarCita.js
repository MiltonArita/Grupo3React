
import React, { Fragment} from 'react';
import ls from 'local-storage';
import { useFormik } from 'formik';
import axios from 'axios';
function EliminarCita (props) {


    let cita = props.location.state;

    const eliminar = (cita) => {

      if (window.confirm("Seguro que desea eliminar esta lista")) {
        axios.delete('https://localhost:44309/api/Citas',cita)
      .then(response => {
        if (response.request.status === 201){
          window.alert("Eliminado exitosamente");
          props.history.goBack(); //Regresa al main
        }
        else{
          window.alert("Error al eliminar la cita");
        }
      })
      .catch(error => {
        console.log(error);
        window.alert("Error al eliminar el cita");  });  
            
      /*   
        let lista = ls.get("misCita");
            let indice = lista.findIndex(book => book.IdCita === cita.id);
            lista.splice(indice, 1);
            ls.set("misCita", lista);
           
            prop s.history.goBack();*/
        }
    }

    const formik = useFormik({
        initialValues: {
          idCita: cita.idCita,
          idCliente: cita.idCliente,
          idDoctor: cita.idDoctor,
          comentarioAdicional: cita.comentarioAdicional,
          fechaCita: cita.fechaCita,
            

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
          <label htmlFor="idCita">IdCita</label>
          <input
            type="number"
            className="form-control"
            id="idCita"
            onChange={formik.handleChange}
            value={formik.values.idCita}
          />
        </div>
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
          <label htmlFor="idDoctor">IdDoctor</label>
          <input
            type="number"
            className="form-control"
            id="idDoctor"
            onChange={formik.handleChange}
            value={formik.values.idDoctor}
          />
        </div>
        <div className="form-group">
          <label htmlFor="comentarioAdicional">Comentario Adicional</label>
          <input
            type="text"
            className="form-control"
            id="comentarioAdicional"
            onChange={formik.handleChange}
            value={formik.values.comentarioAdicional}
          />
        </div>
        <div className="form-group">
          <label htmlFor="fechaCita">Fecha Cita</label>
          <input
            type="date"
            className="form-control"
            id="fechaCita"
            onChange={formik.handleChange}
            value={formik.values.fechaCita}
          />
        </div>
        
                <button type="submit" className="mt-4 btn-danger">  
                    Eliminar
          </button>
            </form>

        </div> </Fragment>
    );
}

export default EliminarCita;