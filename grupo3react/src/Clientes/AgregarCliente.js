import React, { Fragment} from 'react';
import {useFormik} from 'formik';
/* import ls from 'local-storage'; */
import axios from 'axios';


function AgregarCliente(props){

  function guardar (cliente){
    if (
        cliente.idCliente >= 0 &&
        cliente.cliente !== "" &&
        cliente.fechaNacimiento !== null,
        cliente.procedencia !== "" &&
        cliente.identidad !== ""  
      ) {
        
        axios.post('https://localhost:44309/api/Clientes',cliente)
        .then(response => {
          if (response.request.status === 201){
            window.alert("Agregado exitosamente");
            props.history.goBack(); //Regresa al main
          }
          else{
            window.alert("Error al agregar la cliente");
          }
        })
        .catch(error => {
          console.log(error);
          window.alert("Error al agregar el cliente");  });  



        props.history.goBack(); //Regresa al main
      } else {
        window.alert("Favor ingresar correctamente los datos");
      }
    }

  const formik = useFormik({
    initialValues: {
        idCliente: '',
        cliente: '',
        fechaNacimiento: '',
        procedencia: '',
        identidad: ''
        
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
        
        
        <button type="submit" className="btn btn-primary">Guardar
        </button>
      </form>
    </div>  </Fragment>
  ); 

}

export default AgregarCliente;