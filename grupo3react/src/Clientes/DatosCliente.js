import React from 'react';
import Cliente from './Cliente';


function DatosCliente (props) {
    
    const clientes = props.clientes;
    return(  
    <div className="jumbotron">

      
<meta charSet="UTF-8" />
<meta httpEquiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Honduras Healty</title>
<link rel="stylesheet" href="Complementos/iconsFonts/icofont.min.css" />
<link rel="stylesheet" href="Complementos/CSS/estilos.css" />
{/*Bootstrap*/}
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossOrigin="anonymous" />
 {/*Barra contacto*/}
<div id="topbar" className="d-none d-lg-flex align-items-center fixed-top">
<div className="container d-flex">
<div className="contact-info mr-auto">
<i className="icofont-envelope" /> <a href="mailto:contact@example.com">Healthy@gmail.com</a>
<i className="icofont-phone" /> 504-99999999
<i className="icofont-google-map" /> Honduras, San Pedro Sula
</div>
<div className="social-links">


<a href="#" className="twitter"><i className="icofont-twitter" /></a>
<a href="#" className="facebook"><i className="icofont-facebook" /></a>
<a href="#" className="instagram"><i className="icofont-instagram" /></a> 
</div>
</div></div>



            <div>-</div>
            <div>-</div><div>-</div><div>-</div><div>-</div>
            <center><img src="https://www.sneakerlost.es/hubfs/Como-usar-el-marketing-local-para-ganar-clientes-01-1.png" width="950" height="500" ></img>
            
            </center>
            <div className="container">
            
             <table className="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">IdCliente</th>
              <th scope="col">Cliente</th>
              <th scope="col">Fecha Nacimiento</th>
              <th scope="col">Procedencia</th>
              <th scope="col">Identidad</th>
              <th scope="col"></th>
              <th scope="col"></th>
              
            </tr>
          </thead>
          <tbody>
         
            { clientes.map((cliente,index)=> <Cliente key={cliente.idCliente}indice ={index+1}cliente={cliente}  AgregarCliente={props.AgregarCliente} eliminar={props.eliminar} /> )}
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

export default DatosCliente; 