import './Complementos/CSS/estilos.css';
import './Complementos/iconsFonts/icofont.min.css'; 

const Farmaciag = () => {


    return (  
    
        window.onload = function Farmacia () {
          const baseDeDatos = [
              {
                  id: 1,
                  nombre: 'Paracetamol',
                  precio: 200,
                  imagen: 'paracetamol.jpg'
              },
              {
                  id: 2,
                  nombre: 'Amoxicilina',
                  precio: 100,
                  imagen: 'amoxicilina.jpg'
              },
              {
                  id: 3,
                  nombre: 'Aspirina',
                  precio: 250,
                  imagen: 'Aspirina.jpeg'
              },
              {
                  id: 4,
                  nombre: 'Tapon',
                  precio: 150,
                  imagen: 'tapon.jpg'
              },
              {
                  id: 5,
                  nombre: 'Mucosalvan',
                  precio: 150,
                  imagen: 'mucusalvan.jpg'
              },
              {
                  id: 6,
                  nombre: 'Vitaflenaco',
                  precio: 100,
                  imagen: 'vitaflenaco.jpg'
              },
          



          ];

          let carrito = [];
          let total = 0;
          const DOMitems = document.querySelector('#items');
          const DOMcarrito = document.querySelector('#carrito');
          const DOMtotal = document.querySelector('#total');
          const DOMbotonVaciar = document.querySelector('#boton-vaciar');

    
          function renderizarProductos() {
              baseDeDatos.forEach((info) => {
                 
                  const miNodo = document.createElement('div');
                  miNodo.classList.add('card', 'col-sm-4');
               
                  const miNodoCardBody = document.createElement('div');
                  miNodoCardBody.classList.add('card-body');
                 
                  const miNodoTitle = document.createElement('h5');
                  miNodoTitle.classList.add('card-title');
                  miNodoTitle.textContent = info.nombre;
                  // Imagen
                  const miNodoImagen = document.createElement('img');
                  miNodoImagen.classList.add('img-fluid');
                  miNodoImagen.setAttribute('src', info.imagen);
                  // Precio
                  const miNodoPrecio = document.createElement('p');
                  miNodoPrecio.classList.add('card-text');
                  miNodoPrecio.textContent = info.precio + ' .LPS';
                  // Boton 
                  const miNodoBoton = document.createElement('button');
                  miNodoBoton.classList.add('btn', 'btn-primary');
                  miNodoBoton.textContent = '+';
                  miNodoBoton.setAttribute('marcador', info.id);
                  miNodoBoton.addEventListener('click', anyadirProductoAlCarrito);
                  // Insertamos
                  miNodoCardBody.appendChild(miNodoImagen);
                  miNodoCardBody.appendChild(miNodoTitle);
                  miNodoCardBody.appendChild(miNodoPrecio);
                  miNodoCardBody.appendChild(miNodoBoton);
                  miNodo.appendChild(miNodoCardBody);
                  DOMitems.appendChild(miNodo);
              });
          }

        
          function anyadirProductoAlCarrito(evento) {
              // Anyadimos el Nodo a nuestro carrito
              carrito.push(evento.target.getAttribute('marcador'))
              // Calculo el total
              calcularTotal();
              // Actualizamos el carrito 
              renderizarCarrito();

          }

       
          function renderizarCarrito() {
              // Vaciamos todo el html
              DOMcarrito.textContent = '';
              // Quitamos los duplicados
              const carritoSinDuplicados = [...new Set(carrito)];
              // Generamos los Nodos a partir de carrito
              carritoSinDuplicados.forEach((item) => {
                  // Obtenemos el item que necesitamos de la variable base de datos
                  const miItem = baseDeDatos.filter((itemBaseDatos) => {
                      // ¿Coincide las id? Solo puede existir un caso
                      return itemBaseDatos.id === parseInt(item);
                  });
                  // Cuenta el número de veces que se repite el producto
                  const numeroUnidadesItem = carrito.reduce((total, itemId) => {
                      // ¿Coincide las id? Incremento el contador, en caso contrario no mantengo
                      return itemId === item ? total += 1 : total;
                  }, 0);
                  // Creamos el nodo del item del carrito
                  const miNodo = document.createElement('li');
                  miNodo.classList.add('list-group-item', 'text-right', 'mx-2');
                  miNodo.textContent = `${numeroUnidadesItem} x ${miItem[0].nombre} - ${miItem[0].precio}.LPS`;
                  // Boton de borrar
                  const miBoton = document.createElement('button');
                  miBoton.classList.add('btn', 'btn-danger', 'mx-5');
                  miBoton.textContent = 'X';
                  miBoton.style.marginLeft = '1rem';
                  miBoton.dataset.item = item;
                  miBoton.addEventListener('click', borrarItemCarrito);
                  // Mezclamos nodos
                  miNodo.appendChild(miBoton);
                  DOMcarrito.appendChild(miNodo);
              });
          }

          /**
          * Evento para borrar un elemento del carrito
          */
          function borrarItemCarrito(evento) {
              // Obtenemos el producto ID que hay en el boton pulsado
              const id = evento.target.dataset.item;
              // Borramos todos los productos
              carrito = carrito.filter((carritoId) => {
                  return carritoId !== id;
              });
              // volvemos a renderizar
              renderizarCarrito();
              // Calculamos de nuevo el precio
              calcularTotal();
          }

          /**
          * Calcula el precio total teniendo en cuenta los productos repetidos
          */
          function calcularTotal() {
              // Limpiamos precio anterior
              total = 0;
              // Recorremos el array del carrito
              carrito.forEach((item) => {
                  // De cada elemento obtenemos su precio
                  const miItem = baseDeDatos.filter((itemBaseDatos) => {
                      return itemBaseDatos.id === parseInt(item);
                  });
                  total = total + miItem[0].precio;
              });
              // Renderizamos el precio en el HTML
              DOMtotal.textContent = total.toFixed(2);
          }
    
          function vaciarCarrito() {
               carrito = [];
          
              renderizarCarrito();
              calcularTotal();
          }
          // Eventos
          DOMbotonVaciar.addEventListener('click', vaciarCarrito);
          // Inicio
          renderizarProductos();
         {/* <div>
         
          <h1 class="text-lg-center">FARMACIA HONDURAS HEALTHY</h1>
          
         
          
          <div>
           
             
              <div class="container">
                  <div class="row">
                      <main id="items" class="col-sm-8 row"></main>
                     
                          <h2>Carrito</h2>
                          <ul class="text-left" id="carrito" class="list-group"></ul>
                          
                          <p class="text-right">Total: <span id="total"></span>&dollar;</p>
                          <button id="boton-vaciar" class="btn btn-danger">Vaciar</button>
                     
                  </div>
              </div>
          </div> */}
   







































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
        
         {/*Farmacia*/}
    <section id="farmacia" className="farmacia">
      <div className="container">
        <div className="section-title">
          <h2>Farmacia</h2>
          <p>
          </p>
        </div>
        <div className="row">
          <div className="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div className="icon-box">
              <div className="icon"><i className="icofont-heart-beat" /></div>
{/*               <h4><a href /></h4> 
 */}              <p />
            </div>
          </div>
          <div className="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div className="icon-box">
              <div className="icon"><i className="icofont-drug" /></div>
              {/* <h4><a href /></h4> */}
              <p />
            </div>
          </div>
          <div className="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div className="icon-box">
              <div className="icon"><i className="icofont-dna-alt-2" /></div>
              {/* <h4><a href /></h4> */}
              <p />
            </div>
          </div>
          <div className="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div className="icon-box">
              <div className="icon"><i className="icofont-heartbeat" /></div>
              {/* <h4><a href /></h4> */}
              <p />
            </div>
          </div>
          <div className="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div className="icon-box">
              <div className="icon"><i className="icofont-disabled" /></div>
              {/* <h4><a href /></h4> */}
              <p />
            </div>
          </div>
          <div className="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div className="icon-box">
              <div className="icon"><i className="icofont-autism" /></div>
              {/* <h4><a href /></h4> */}
              <p />
            </div>
          </div>
        </div>
      </div></section>
  



      
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
      
      
      
      
}
      );}

    export default Farmaciag;