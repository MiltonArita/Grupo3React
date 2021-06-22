import React, { } from 'react';
/* import ls from 'local-storage'; */
import DatosCliente from './DatosCliente';
import axios from 'axios';
class Clientes extends React.Component {

    constructor(props) {
      super(props);
      const listaClientes = [
        {
          idCliente: 1,
          cliente: "Milton",
          fechaNacimiento: 2021,
          procedencia: "Santa Barbara",
          identidad: "1604-2001-00485"
         
        },
        {
          idCliente: 2,
          cliente: "Juan",
          fechaNacimiento: 2021,
          procedencia: "San Pedro",
          identidad: "1504-2001-00485"
         
        },
        {
          idCliente: 3,
          cliente: "Josue",
          fechaNacimiento: 2021,
          procedencia: "Roatan",
          identidad: "0004-2001-00485"
         
        },
        {
          idCliente: 4,
          cliente: "Allan",
          fechaNacimiento: 2021,
          procedencia: "Santa Rosa",
          identidad: "1005-2001-00485"
         
        },
        
      ];
      this.state = { clientes: listaClientes }; 
      this.AgregarCliente = this.AgregarCliente.bind(this);
      this.eliminar = this.eliminar.bind(this);
      
    }
    componentDidMount() {
      console.log("componentDidMount");
       //Del Web API
      axios.get('https://localhost:44309/api/Clientes') //esto es una promesa
        .then(response => {
          console.log('response');
          this.setState({clientes: response.data});
        })
        .catch(error =>{
          console.log('error');
          console.log(error);
        });   
      }
        
  
    AgregarCliente(){
      this.props.history.push('/AgregarCliente')
    }
  
    eliminar(idCliente){
      
      let indice = this.state.clientes.findIndex(cliente => cliente.idCliente === idCliente);
      this.props.history.push('/EliminarCliente', this.state.clientes[indice]);
  
    } 
  
  
   render() {
      return (
        <div>
       
       <DatosCliente clientes={this.state.clientes} AgregarCliente={this.AgregarCliente} eliminar={this.eliminar}/> 
      
        </div>
      );
    } 
  }
export default Clientes;