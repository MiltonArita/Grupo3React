import React, { Component } from 'react';
import './Complementos/CSS/estilos.css';
/* import './Complementos/CSS/fondo.css'; */
import './Complementos/iconsFonts/icofont.min.css'; 

import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

import Inicio from './Inicio.js';
import Contacto from './Contacto';
import Farmaciag from './Farmaciag';
import Citas from './Citas/Citas';
import ComentariosFarmacia from './ComentariosFarmacia/ComentariosFarmacia';
import AgregarCita from './Citas/AgregarCita';
import EliminarCita from './Citas/EliminarCita';
import AgregarComentario from './ComentariosFarmacia/AgregarComentario';
import EliminarComentario from './ComentariosFarmacia/EliminarComentario';
import DirectorioMedico from './DirectorioMedico/DirectorioMedico';
import Clientes from './Clientes/Clientes';
import AgregarCliente from './Clientes/AgregarCliente';
import EliminarCliente from './Clientes/EliminarCliente';
class App extends Component {

  render (){  
  return (
    <div className="App">
      

    <Router>
    <header id="header" className="fixed-top">
    <nav className="navbar navbar-expand-lg navbar-light bg-light">
      <button
        className="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNavAltMarkup"
        aria-controls="navbarNavAltMarkup"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span className="navbar-toggler-icon"></span>
      </button>
      <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div className="collapse navbar-collapse navbar-ex1-collapse">
          <Link className="nav-link" to="/">Inicio</Link>
           <Link className="nav-link" to="/Clientes">Cliente</Link> 
          <Link className="nav-link" to="/Citas">Citas</Link>
          <Link className="nav-link" to="/ComentariosFarmacia">Comentarios Farmacia</Link>
          <Link className="nav-link" to="/DirectorioMedico">Directorio Medico</Link>
          <Link className="nav-link" to="/Contacto">Contacto</Link>
        </div>
      </div>
    </nav>
    </header>
    <Switch>
          <Route exact path="/" component={Inicio}/>
        
          <Route path="/Contacto" component={Contacto}/>
          <Route path="/Clientes" component={Clientes}/>
          <Route path="/AgregarCliente" component={AgregarCliente}/>
          <Route path="/EliminarCliente" component={EliminarCliente}/>
          <Route path="/Citas" component={Citas}/>
          <Route path="/AgregarCita" component={AgregarCita}/>
          <Route path="/EliminarCita" component={EliminarCita}/>
          <Route path="/ComentariosFarmacia" component={ComentariosFarmacia}/>
          <Route path="/AgregarComentario" component={AgregarComentario}/>
          <Route path="/EliminarComentario" component={EliminarComentario}/>
          <Route path="/DirectorioMedico" component={DirectorioMedico}/>

        
        </Switch>
  </Router>
  </div>
  );

}}
export default App;


