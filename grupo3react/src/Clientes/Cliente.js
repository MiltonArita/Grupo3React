import React from 'react'


const Cliente =(props) => {
    const cliente = props.cliente;

    const retorno = (
        <tr>
        <th scope="row">{props.indice}</th>
        <td>{cliente.idCliente}</td>
        <td>{cliente.cliente}</td>
        <td>{cliente.fechaNacimiento}</td>
        <td>{cliente.procedencia}</td>
        <td>{cliente.identidad}</td>
{            <td><button type="button" className="btn btn-primary" onClick={(e)=>props.AgregarCliente(cliente.idCliente)}><i className="fa"></i>Agregar Nuevo</button></td> }
           <td><button type="button" className="btn btn-danger" onClick={(e)=>props.eliminar(cliente.idCliente)}><i className="fa fa-trash"></i></button></td>  
               
            </tr>
    );
    return retorno;
}
export default Cliente;