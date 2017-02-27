<?php
include("php/conectar.php");
$link = conectar();
extract($_POST);
$condicion_tipoDoc ="";

if(isset($sl_tipoDoc))
{
    if($sl_tipoDoc!=0)
      $condicion_tipoDoc = " and id_tipo_doc = $sl_tipoDoc";
}

$query_filtro = "select nombre_tipo_doc from tipo_doc";
$query_completa = $query_filtro.$condicion_tipoDoc;
$result_lista = mysqli_query($link, $query_completa) or die('Error de Conexión, el error está acá (' . mysqli_connect_errno() . ') '
            . mysqli_connect_error());


$query_tipoDoc = "select id_tipo_doc, nombre_tipo_doc from tipo_doc";
$result_tipoDoc = mysqli_query($link, $query_tipoDoc) or die('Error de Conexión (' . mysqli_connect_errno() . ') '
            . mysqli_connect_error());

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/estilosBiblioteca.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="js/jquery-slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  <body>
    <section class="bienvenidos">
      <header class="encabezado">
          <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse"><!--navbar-light bg-faded-->
          <div class="container">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="index.html"><i class="fa fa-book fa-2x" aria-hidden="true"></i>Bibliocom</a>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-md-0">
      <li class="nav-item"><!--el badge-deafult es para resaltar el texto inicio-->
        <a class="nav-link" href="index.html"><i class="fa fa-home" aria-hidden="true"></i>     Inicio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active badge-default">
        <a class="nav-link" href="personas.php" ><i class="fa fa-address-book" aria-hidden="true"></i>      Personas</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="libros.html"><i class="fa fa-book" aria-hidden="true"></i>      Libros</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="prestamos.html"><i class="fa fa-bookmark" aria-hidden="true"></i>      Prestamos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="devoluciones.html"><i class="fa fa-bookmark-o" aria-hidden="true"></i>      Devoluciones</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="informes.html"><i class="fa fa-newspaper-o" aria-hidden="true"></i>      Informes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost/BibliotecaBD2/listado_libros.php"><i class="fa fa-file-text" aria-hidden="true"></i>     Listado de libros</a>
      </li>
    </ul>
  </div>
  </div>
</nav>
        <div class="container col-sm-5 espacioform"><!-- col-sm-6 para centrar el container-->
          <form>
  <div class="form-group">
    <label for="inputName">Nombre(s)</label>
    <input type="text" class="form-control" id="inputName" aria-describedby="nombre" placeholder="Ingrese su(s) nombre(s)">
  </div>
  <div class="form-group">
    <label for="inputApellido">Apellido(s)</label>
    <input type="text" class="form-control" id="inputApellido" placeholder="Ingrese su(s) apellido(s)">
  </div>
  <div class="form-group">
    <label for="selectTUsuario">Tipo de usuario</label>
    <select class="form-control" id="selectTUsuario">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </div>
  <div class="form-group">
    <label for="sl_tipoDoc">Tipo de documento</label>
    <select class="form-control" id="sl_tipoDoc">
      <option value='0'></option>;
            <?php
            while($fila_tipoDoc = mysqli_fetch_array($result_tipoDoc))
            {
              extract($fila_tipoDoc);
              echo "<option value='$id_tipo_doc'>$nombre_tipo_doc</option>";
                  
            }         
            ?>
    </select>
  </div>
  <div class="form-group">
    <label for="inputNumDoc">Número de documento</label>
    <input type="number" class="form-control" id="inputNumDoc" placeholder="Ingrese su número de documento">
  </div>
    <div class="form-group">
    <label for="inputTel">Teléfono</label>
    <input type="tel" class="form-control" id="inputTel" placeholder="Ingrese su teléfono">
  </div>
  <div class="form-group">
    <label for="inputDir">Dirección</label>
    <input type="tel" class="form-control" id="inputDir" placeholder="Ingrese su dirección">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
      
      </header>
    </section>
    <footer>
      <p>Nicolas Ariza - Biblioteca ©</p>
    </footer>
  </body>
</html>