import React, { } from 'react';
/* import ls from 'local-storage'; */
import DatosCita from './DatosCita';
import axios from 'axios';
class Citas extends React.Component {

    constructor(props) {
      super(props);
      const listaCitas = [
        {
          idCita: 1,
          idCliente: 1,
          idDoctor: 1,
          comentarioAdicional: "Agendar Cita",
          fechaCita: 2021
         
        },
        {
          idCita: 2,
          idCliente: 2,
          idDoctor: 2,
          comentarioAdicional: "Reprogramado",
          fechaCita: 2021,
        },
        {
          idCita: 3,
          idCliente: 3,
          idDoctor: 3,
          comentarioAdicional: "Se reprogramo para 201-02-05",
          fechaCita: 2021,
        },
        {
          idCita: 4,
          idCliente: 4,
          idDoctor: 3,
          comentarioAdicional: "Paciente alergica a Lidocaina",
          fechaCita: 2021,
        },
        {
          idCita: 6,
          idCliente: 5,
          idDoctor: 6,
          comentarioAdicional: "Paciente solicito cambio fecha cita",
          fechaCita: 2020
        },
      ];
      this.state = { citas: listaCitas }; 
      this.AgregarCita = this.AgregarCita.bind(this);
      this.eliminar = this.eliminar.bind(this);
      
    }
    componentDidMount() {
      console.log("componentDidMount");
       //Del Web API
      axios.get('https://localhost:44309/api/Citas') //esto es una promesa
        .then(response => {
          console.log('response');
          this.setState({citas: response.data});
        })
        .catch(error =>{
          console.log('error');
          console.log(error);
        });   

         /* const lista = ls.get('misCita');
      if (lista && lista.length > 0 ){
        this.setState ({Citas: lista})
      }    */
    }
  
    /* componentDidUpdate() {
      console.log("componentDidUpdate");

    } */
  
    AgregarCita(){
      this.props.history.push('/AgregarCita')
    }
  
    eliminar(idCita){
      
      let indice = this.state.citas.findIndex(cita => cita.idCita === idCita);
      this.props.history.push('/EliminarCita', this.state.citas[indice]);
  
    } 
  
  
   render() {
      return (
        <div>
       
       <DatosCita citas={this.state.citas} AgregarCita={this.AgregarCita} eliminar={this.eliminar}/> 
   
        </div>
      );
    } 
  }
export default Citas;