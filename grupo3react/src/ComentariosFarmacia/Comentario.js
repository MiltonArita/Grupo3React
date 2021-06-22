import React from 'react'


const Comentario =(props) => {
  
    const comentari = props.comentari;
    const retorno = (
        <tr>
              <th scope="row">{props.indice}</th>
              <td>{comentari.idComentarioFarmacia}</td>
              <td>{comentari.idFarmacia}</td>
              <td>{comentari.comentarios}</td>
              <td>{comentari.planDeAccion}</td>
             
               <td><button type="button" className="btn btn-primary" onClick={(e)=>props.AgregarComentario(comentari.idComentarioFarmacia)} ><i className="fa"></i>Agregar Nuevo</button></td>
             <td><button type="button" className="btn btn-danger" onClick={(e)=>props.eliminarCom(comentari.idComentarioFarmacia)}><i className="fa fa-trash"></i></button></td> 
          </tr>
    );
    return retorno;
  }

export default Comentario;