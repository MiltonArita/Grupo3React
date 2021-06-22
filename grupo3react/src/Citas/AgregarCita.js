import React, { Fragment} from 'react';
import {useFormik} from 'formik';
/* import ls from 'local-storage'; */
import axios from 'axios';


function AgregarCita(props){

  function guardar (cita){
    if (
      cita.idCita >= 0 &&
      cita.idCliente >= 0 &&
      cita.idDoctor >= 0 &&
      cita.comentarioAdicional !== "" &&
      cita.fechaCita !== null 
      ) {
        
        axios.post('https://localhost:44309/api/Citas',cita)
        .then(response => {
          if (response.request.status === 201){
            window.alert("Agregado exitosamente");
            props.history.goBack(); //Regresa al main
          }
          else{
            window.alert("Error al agregar la cita");
          }
        })
        .catch(error => {
          console.log(error);
          window.alert("Error al agregar el cita");  });  


         /* let listaGuardar = [];
        let lista = ls.get("misCita");
        if (lista && lista.length > 0) listaGuardar = lista;
        listaGuardar = listaGuardar.concat(cita);
        ls.set("misCita", listaGuardar);   */


        props.history.goBack(); //Regresa al main
      } else {
        window.alert("Favor ingresar correctamente los datos");
      }
    }

  const formik = useFormik({
    initialValues: {
      idCita: '',
        idCliente: '',
        idDoctor: '',
        comentarioAdicional: '',
        fechaCita: ''
        
    },
    onSubmit: values => {
        console.log('Guardar');
        console.log(values);
        guardar(values);
    },
})
return ( 
  <Fragment>
      <div>--</div>
      <div>--</div>
      <div>--</div>
      <div>--</div><div>--</div> <div>--</div> 
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
        
        
        <button type="submit" className="btn btn-primary">Guardar
        </button>
      </form>
    </div>  </Fragment>
  ); 

}

export default AgregarCita;