import React from 'react';
import Medico from './Medico';

function DatosMedico (props) {
    
    const datos = props.datos;
    return(  
      

        <div className="jumbotron">

           
            <div>-</div>
            <div>-</div><div>-</div><div>-</div><div>-</div>
            <center><img src="https://images.squarespace-cdn.com/content/v1/5e44e323b2ae1c33567266d2/1595188758911-L3C7AOHG3YNA4WWDHMZ2/ke17ZwdGBToddI8pDm48kDAv91l_EVpAtt3T82Wm1m9Zw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVEcs4OJ1MUiSygP0U4z2bUeJj0Nr1n48rGt1cKo_lK-mJuG45vQwBxdpDrCGUSSl5w/lsh-wales-hospital.gif"></img></center>
            <div>-</div>
            <div className="section-title">
    
    
    <h2>Medicos Disponibles</h2></div>
    <div className="container">
             <table className="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">IdDoctor</th>
              <th scope="col">NombreDoctor</th>
              <th scope="col">Especialidad</th>
              <th scope="col">ClinicaAsignada</th>
              
             
              
            </tr>
          </thead>
          <tbody>
         
            { datos.map((dato,index)=> <Medico key={dato.IdDoctor}indice ={index+1}dato={dato}/> )}
          </tbody>
        </table></div>
        <div className="jumbotron"> <footer id="footer">
        <div className="container">
          <div className="row">
            <div className="col-lg-3 col-md-6 footer-contact">
              <h3>Honduras Healthy</h3>
              <p>
                Honduras <br />
                San Pedro Sula<br />
                {/*  <br><br> */}
                <strong>Telefono:</strong>504-99999999<br />
                <strong>Correo:</strong> Healthy@gmail.com<br />
              </p>
            </div>
          </div>
        </div>
      </footer></div>
        </div>
     
    );

}

export default DatosMedico; 