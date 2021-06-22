import React from 'react';
import './Complementos/CSS/estilos.css';
import './Complementos/iconsFonts/icofont.min.css';
//import Topbar from './Componentes/Topbar';
import Gallery1 from './Complementos/Imagenes/gallery/gallery-1.jpg';
import Gallery2 from './Complementos/Imagenes/gallery/gallery-2.jpg';
import Gallery3 from './Complementos/Imagenes/gallery/gallery-3.jpg';
import Gallery4 from './Complementos/Imagenes/gallery/gallery-4.jpg';
import Gallery5 from './Complementos/Imagenes/gallery/gallery-5.jpg';
import Gallery6 from './Complementos/Imagenes/gallery/gallery-6.jpg';
import Gallery7 from './Complementos/Imagenes/gallery/gallery-7.jpg';
import Gallery8 from './Complementos/Imagenes/gallery/gallery-8.jpg';
import Gallery9 from './Complementos/Imagenes/gallery/gallery-9.jpeg';
import {
    Link
  } from "react-router-dom";


const Inicio = () => {
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

                <section id="bienvenida" className="d-flex align-items-center">

                    <div className="container">
                        <div className="center">
                            <div className="gallery-item">
                                <a href="Complementos/Imagenes/gallery/gallery-9.jpeg" data-gall="gallery-item">
                                   <center> <img src={Gallery9} width="550" height="400" alt="" />
                                    <img src="https://static.wixstatic.com/media/3da00c_d39982652d02493eb0d646334e27adb3~mv2.gif" width="550" height="400"></img ></center>
                                  
                                    {/* <img src={Gallery2} alt className="" /> */}

                                </a>
                            </div>
                        </div>
                        <h1>Bienvenidos</h1>
                        <h1>Honduras Healthy </h1>
                      
                        <div align="center"><h2>Historia</h2>
                            </div><p>Honduras  Healty fue fundada el 26 de abril del año 2021 con la vision de los socios; Josue Emanuel, Milton Arita, Oscar Andino, Keith Bueso y Cesar Martinez. En ser una de las primeras empresas con el sistema de farmacia, consultas y agendalizacion de citas y cirugias via web.</p>
                            <p>Desde entonces, Honduras Healthy se ha esforzado para mantenerse como una de las principales alternativas de servicios de salud de la región contando con los mejores servicios medicos las mejores atenciones con los mejores medicos y siempre ayudandole al que mas lo necesita.</p>
                <p></p>
                    </div>
                    <div></div>
                </section>


                <main>
                    {/*About*/}
                    <section id="about" className="about">
                        <div className="container">
                            <div className="col-xl-12 col-lg-12 icon-boxes d-flex flex-column align-items-stretch justify-content-center ">
                                {/* <h3></h3 > */}
                                {/*           <p></p>
 */}
                                <div className="icon-box">
                                    <div className="Contacto" />
                                    <h4 className="title"><a href></a></h4>
                                    <p className="description" />
                                </div>
                                <div className="icon-box">
                                    <div className="nav-link" />
                                    <center className="faq section-bg">
                                        <div className="section-title">
                                    <h2 className="title"><a href></a> <Link className="nav-link" to="/Contacto">CONSULTA PRIVADA</Link> </h2> 
                                    <h4 className="title"><a href></a> <Link className="nav-link" to="/Citas">CITAS </Link> </h4> </div></center>
                                    <p className="description" />
                                </div>
                                <div className="">
                                    <div className="icon" />
                                    <h4 className="title"><a href></a></h4>
                                    <p className="description" />
                                </div>
                            </div>
                        </div>
                    </section>

                    {/*Preguntas*/}
                    <section id="faq" className="faq section-bg">
                        <div className="container">
                            <div className="section-title">
                                <h2>Preguntas Frecuentes</h2>
                                <p />
                            </div>
                            <div className="faq-list">
                                <ul>
                                    <li data-aos="fade-up">
                                        <a data-toggle="collapse" className="collapse" href="#faq-list-1">¿Como Programo una Cita?</a>

                                        <div id="faq-list-1" className="collapse show" data-parent=".faq-list">
                                            <p>
                                                Para programar una cita inicial, llame al +504-99999999. Una enfermera registrada trabajará junto a usted para reunir la información necesaria
                                                y determinar si puede beneficiarse con nuestra atención. Después de programar su cita, se le enviará por correo un paquete de información.
                </p>
                                        </div>
                                    </li>
                                    <li data-aos="fade-up">
                                        <a data-toggle="collapse" className="collapse" href="#faq-list-2">¿Cual es el Horario?</a>

                                        <div id="faq-list-2" className="collapse show" data-parent=".faq-list-2">
                                            <p>
                                                Contingencia por CORONAVIRUS COVID-2019:
                                                Lunes a viernes de 9:00 a.m. a 12:00 m. y de 12:30 m. a 4:00 p.m.
                                                
                                                Horario normal luego de contingencia:
                                                Lunes a viernes de 7:00 a.m. a 5:00 p.m. jornada continua.
                </p>
                                        </div>
                                    </li>

                                    <li data-aos="fade-up">
                                        <a data-toggle="collapse" className="collapse" href="#faq-list-3">¿Cuando esta abierto el Centro Honduras Healthy?</a>

                                        <div id="faq-list-3" className="collapse show" data-parent=".faq-list-3">
                                            <p>
                                                El Centro Honduras Healthy está abierto de lunes a viernes, de 10:00 a 17:00 o por cita.
                                                Llámenos o envíenos un correo electrónico al Healthy@gmail.com o a  +504-99999999.
                </p>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </section>
                    {/*Galeria*/}
                    <section id="gallery" className="gallery">
                        <div className="container">
                            <div className="section-title">
                                <h2>Galeria</h2>
                                <p>.</p>
                            </div>
                        </div>
                        <div className="container-fluid">
                            <div className="row no-gutters">
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-1.jpg" data-gall="gallery-item">
                                            <img src={Gallery1} alt="" />
                                        </a>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-2.jpg" data-gall="gallery-item">
                                            <img src={Gallery2} alt="" />
                                            {/* <img src={Gallery2} alt className="" /> */}

                                        </a>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-3.jpg" data-gall="gallery-item">
                                            <img src={Gallery3} alt="" />
                                        </a>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-4.jpg" data-gall="gallery-item">
                                            <img src={Gallery4} alt="" />
                                        </a>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-5.jpg" data-gall="gallery-item">
                                            <img src={Gallery5} alt="" />
                                        </a>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-6.jpg" data-gall="gallery-item">
                                            <img src={Gallery6} alt="" />
                                        </a>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-7.jpg" data-gall="gallery-item">
                                            <img src={Gallery7} alt="" />
                                        </a>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-4">
                                    <div className="gallery-item">
                                        <a href="Complementos/Imagenes/gallery/gallery-8.jpg" data-gall="gallery-item">
                                            <img src={Gallery8} alt="" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>


                </main>
                <hr />
                <footer id="footer">
                    <div className="container">
                        <div className="center">
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
                {/*Bootstrap*/}
            </>



        </div>




    );
}



export default Inicio;