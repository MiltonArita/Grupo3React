import React, { Component } from 'react';

class Topbar extends Component {
  render () {
    return (

    <div id="topbar" className="d-none d-lg-flex align-items-center fixed-top">
        <div className="container d-flex">
            <div className="contact-info mr-auto">
                <i className="icofont-envelope"></i> <a href="mailto:contact@example.com">Healthy@gmail.com</a>
                <i className="icofont-phone"></i> 504-99999999
                <i className="icofont-google-map"></i> Honduras, San Pedro Sula
            </div>
            <div className="social-links">
                <a href="#" className="twitter"><i className="icofont-twitter"></i></a>
                <a href="#" className="facebook"><i className="icofont-facebook"></i></a>
                <a href="#" className="instagram"><i className="icofont-instagram"></i></a>
               
            </div>
        </div>
    </div>

    );
  }

}


export default Topbar;