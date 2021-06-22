import React, { } from 'react';
/* import ls from 'local-storage'; */
import DatosMedico from './DatosMedico';
import axios from 'axios';
class DirectorioMedico extends React.Component {

    constructor(props) {
      super(props);
      const listaMedicos = [
        {
          idDoctor: 101,
          nombreDoctor: "David Fernandez",
          especialidad: "Pediatra",
          clinicaAsignada: "13D",
         
        },
        {
            idDoctor: 102,
            nombreDoctor: "Milton",
            especialidad: "Psiquiatra",
            clinicaAsignada: "8D",
        },
        {
            idDoctor: 103,
            nombreDoctor: "Francisco",
            especialidad: "Odontologo",
            clinicaAsignada: "5A",
        },
        {
          idDoctor: 104,
          nombreDoctor: "Alberto Figueroa",
          especialidad: "Psicologo",
          clinicaAsignada: "11A",
      },
      ];
      this.state = { datos: listaMedicos };
     
       
    }
    componentDidMount() {
      console.log("componentDidMount");
       //Del Web API
      axios.get('https://localhost:44309/api/DirectorioMedico') //esto es una promesa
        .then(response => {
          console.log('response');
          this.setState({datos: response.data});
        })
        .catch(error =>{
          console.log('error');
          console.log(error);
        }); 
        
    }
  
     componentDidUpdate() {
      console.log("componentDidUpdate");

    } 
  
    
  
  
   render() {
      return (
        <div>
        
         <DatosMedico datos={this.state.datos}/>
    
        </div>
      );
    } 
  }
export default DirectorioMedico;