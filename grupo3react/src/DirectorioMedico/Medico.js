import React from 'react'


const Medico =(props) => {
    const dato = props.dato;

    const retorno = (
        <tr>
        <th scope="row">{props.indice}</th>
        <td>{dato.idDoctor}</td>
        <td>{dato.nombreDoctor}</td>
        <td>{dato.especialidad}</td>
        <td>{dato.clinicaAsignada}</td>
       

            </tr>
    );
    return retorno;
}
export default Medico;