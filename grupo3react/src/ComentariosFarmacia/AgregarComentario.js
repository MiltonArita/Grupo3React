import React, { Fragment} from 'react';
import {useFormik} from 'formik';
/* import ls from 'local-storage'; */
import axios from 'axios';


function AgregarComentario(props){

  function guardar (comentari){
    if (
        comentari.idComentarioFarmacia >= 0 &&
        comentari.idFarmacia >= 0 &&
        comentari.comentarios !== "" &&
        comentari.planDeAccion !== "" 
       
      ) {

         axios.post('https://localhost:44309/api/ComentariosFarmacia',comentari)
        .then(response => {
          if (response.request.status === 200){
            window.alert("Agregado exitosamente");
            props.history.goBack(); //Regresa al main
          }
          else{
            window.alert("Error al agregar el Comentario");
          }
        })
        .catch(error => {
          console.log(error);
          window.alert("Error al agregar el Comentario");
        }); 

         /*  let listaGuardarr = [];
        let listaa = ls.get("misComentarios");
        if (listaa && listaa.length > 0) listaGuardarr = listaa;
        listaGuardarr = listaGuardarr.concat(comentari);
        ls.set("misComentarios", listaGuardarr);  */

        props.history.goBack(); //Regresa al main
      } else {
        window.alert("Favor ingresar correctamente los datos");
      }
    }

  const formik = useFormik({
    initialValues: {
        idComentarioFarmacia: '',
        idFarmacia: '',
        comentarios: '',
        planDeAccion: '',
      
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
          <label htmlFor="idComentarioFarmacia">IdComentarioFarmacia</label>
          <input
            type="number"
            className="form-control"
            id="idComentarioFarmacia"
            onChange={formik.handleChange}
            value={formik.values.idComentarioFarmacia}
          />
        </div>
        <div className="form-group">
          <label htmlFor="idFarmacia">IdFarmacia</label>
          <input
            type="number"
            className="form-control"
            id="idFarmacia"
            onChange={formik.handleChange}
            value={formik.values.idFarmacia}
          />
        </div>

       

        <div className="form-group">
          <label htmlFor="comentarios">Comentarios</label>
          <input
            type="text"
            className="form-control"
            id="comentarios"
            onChange={formik.handleChange}
            value={formik.values.comentarios}
          />
        </div>
        <div className="form-group">
          <label htmlFor="planDeAccion">PlanDeAccion</label>
          <input
            type="text"
            className="form-control"
            id="planDeAccion"
            onChange={formik.handleChange}
            value={formik.values.planDeAccion}
          />
        </div>
        
        
        <button type="submit" className="btn btn-primary">Guardar
        </button>
      </form>
    </div>  </Fragment>
  ); 

}

export default AgregarComentario;