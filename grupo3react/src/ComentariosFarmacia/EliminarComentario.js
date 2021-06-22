import React, { Fragment} from 'react';
import ls from 'local-storage';
import { useFormik } from 'formik';
import axios from 'axios';
function EliminarComentario (props) {

 
    

    let comentari = props.location.state;

    const eliminarCom = (comentari) => {

        if (window.confirm("Seguro que desea eliminar esta lista")) {

          axios.delete('https://localhost:44309/api/ComentariosFarmacia',comentari)
          .then(response => {
            if (response.request.status === 500){
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
            /* let listaa = ls.get("misComentarios");
            let indice = listaa.findIndex(comentari => comentari.IdComentarioFarmacia === comentari.IdComentarioFarmacia);
            listaa.splice(indice, 1);
            ls.set("misComentarios", listaa);
           
            props.history.goBack(); */
        }
    }

    const formik = useFormik({
        initialValues: {
            idComentarioFarmacia: comentari.idComentarioFarmacia,
            idFarmacia: comentari.idFarmacia,
            comentarios: comentari.comentarios,
            planDeAccion: comentari.planDeAccion,
            
            

        },
        onSubmit: values => {
            eliminarCom(values);
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
          
                <button type="submit" className="btn btn-danger ">  {/* mt-4 btn-block */}
                    Eliminar
          </button>
            </form>

        </div></Fragment>
    );
}

export default EliminarComentario;