import React, { } from 'react';
import ls from 'local-storage';
import DatosComentario from './DatosComentario';
import axios from 'axios';
class ComentarioFarmacia extends React.Component {

    constructor(props) {
      super(props);
      const listaComentarios = [
        {
          idComentarioFarmacia: 1,
          idFarmacia: 1,
          comentarios: "Cliente comento efecto adversos graves",
          planDeAccion: "hacer estudio en cuanto a medicamento",
         
        },
        {
          idComentarioFarmacia: 2,
          idFarmacia: 2,
          comentarios: "Medicina demasiado cara",
          planDeAccion: "Buscar consultar otro proveedor",
         
        },
        {
          idComentarioFarmacia: 3,
          idFarmacia: 4,
          comentarios: "Cliente le dieron dosis incorrecta ",
          planDeAccion: "mejorar procedimiento",
         
        },
        {
          idComentarioFarmacia: 5,
          idFarmacia: 6,
          comentarios: "Agregar mas Medicamentos" ,
          planDeAccion: "Aumento de Productos",
         
        },
        
      
      ];
      this.state = { comentarios: listaComentarios };
      this.AgregarComentario = this.AgregarComentario.bind(this);
      this.eliminarCom = this.eliminarCom.bind(this);  
    }
    componentDidMount() {
      console.log("componentDidMount");
       //Del WEB API
    axios.get('https://localhost:44309/api/ComentariosFarmacia')   //estp es una promesa       funciones que no se ejecutan en ese momento hasta despues
    .then(response => {
      console.log('response');
      this.setState({comentarios: response.data});
      //console.log(response);
    })
    .catch(eror => {
      console.log('error');
      console.log(eror);
    }); 

     /*  const listaa = ls.get('misComentarios');
      if (listaa && listaa.length > 0 ){
        this.setState ({comentarios: listaa})
      }  */
    }
  
  /*   componentDidUpdate() {
      console.log("componentDidUpdate");
    }
   */
    AgregarComentario(){
      this.props.history.push('/AgregarComentario')
    }
  
    eliminarCom(idComentarioFarmacia){
      
      let indice = this.state.comentarios.findIndex(comentari => comentari.idComentarioFarmacia === idComentarioFarmacia);
      this.props.history.push('/EliminarComentario', this.state.comentarios[indice]);
  
    }

   
  
    
    render() {
      return (
        <div >
         
        
          <DatosComentario comentarios={this.state.comentarios}  AgregarComentario={this.AgregarComentario}eliminarCom={this.eliminarCom} />   
        </div>
      );
    }
  }
export default ComentarioFarmacia;