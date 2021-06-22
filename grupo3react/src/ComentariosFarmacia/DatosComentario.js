import React from 'react';
import Comentario from './Comentario';


function DatosComentario (props) {
    const comentarios = props.comentarios;
    return(
    
    <div className="jumbotron">

           
      <div>-</div>
      <div>-</div><div>-</div><div>-</div><div>-</div>
      <center><img src="https://coobis.com/wp-content/uploads/2018/09/comentarios-en-instagram-destacada.jpg" width="300" height="300"></img></center>
      <div>-</div>
    
     

  <div className="section-title">
    

    <h2>ComentariosFarmacia</h2></div>
    <div className="container">
             <table className="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">IdComentarioFarmacia</th>
              <th scope="col">IdFarmacia</th>
              <th scope="col">Comentarios</th>
              <th scope="col">PlanDeAccion</th>
              <th scope="col"></th>
              
            </tr>
          </thead>
          <tbody>
            { comentarios.map((comentari,index)=> <Comentario key={comentari.idComentarioFarmacia}indice ={index+1}comentari={comentari}  AgregarComentario={props.AgregarComentario}   eliminarCom={props.eliminarCom} /> )}
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

export default DatosComentario; 