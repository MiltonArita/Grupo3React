
import './Complementos/CSS/estilos.css';
import './Complementos/iconsFonts/icofont.min.css'; 


const Contacto = () => {
    return (  
    <div className="jumbotron">

      
        <>
        
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
    </div>


  </div>
        {/*Contacto*/}
<section id="contacto" className="contacto">
<div className="container">
  <div className="section-title">
    
    <div> <img src=""></img></div>
    <div> <img src=""></img></div>
    <img src="https://cotizaseguros.online/storage/seguros/December2020/efarsytCAC78qCmxVVNX.gif"></img>
    <h2>Contacto</h2>
  </div>
</div>
<div>
</div>
<div className="container">
  <div className="row mt-5">
    <div className="col-lg-4">
      <div className="info">
        <div className="address">
          <i className="icofont-google-map" />
          <h4>Direccion:</h4>
          <p>Honduras</p>
        </div>
        <div className="email">
          <i className="icofont-envelope" />
          <h4>Correo:</h4>
          <p>Healthy@gmail.com</p>
        </div>
        <div className="phone">
          <i className="icofont-phone" />
          <h4>Telefono:</h4>
          <p>504-99999999</p>
        </div>
      </div>
    </div>
    <div className="col-lg-8 mt-5 mt-lg-0">
      <form method="post" role="form" className="php-email-form">
        <div className="form-row">
          <div className="col-md-6 form-group">
            <input type="text" name="name" className="form-control" id="name" placeholder="Nombre" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
            <div className="validate" />
          </div>
          <div className="col-md-6 form-group">
            <input type="email" className="form-control" name="email" id="email" placeholder="Correo" data-rule="email" data-msg="Please enter a valid email" />
            <div className="validate" />
          </div>
        </div>
        <div className="form-group">
          <input type="text" className="form-control" name="Tema" id="Tema" placeholder="Tema" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
          <div className="validate" />
        </div>
        <div className="form-group">
          <textarea className="form-control" name="message" rows={5} data-rule="required" data-msg="Please write something for us" placeholder="Mensaje" defaultValue={""} />
          <div className="validate" />
        </div>
        <div className="text-center"><button type="submit">Enviar</button></div>
      </form>
    </div>
  </div>
</div>
</section>
<footer id="footer">
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
  </footer>
</>
    </div> );}
        
export default Contacto;