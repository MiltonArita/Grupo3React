import React from 'react'


const Cita =(props) => {
    const cita = props.cita;

    const retorno = (
        <tr>
        <th scope="row">{props.indice}</th>
        <td>{cita.idCita}</td>
        <td>{cita.idCliente}</td>
        <td>{cita.idDoctor}</td>
        <td>{cita.comentarioAdicional}</td>
        <td>{cita.fechaCita}</td>
  {     <td><button type="button" className="btn btn-primary" onClick={(e)=>props.AgregarCita(cita.idCita)}><i className="fa"></i>Agregar Nuevo</button></td> }
           <td><button type="button" className="btn btn-danger" onClick={(e)=>props.eliminar(cita.idCita)}><i className="fa fa-trash"></i></button></td>  
               
            </tr>
    );
    return retorno;
}
export default Cita;