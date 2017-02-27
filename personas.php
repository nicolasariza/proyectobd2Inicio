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
    <label for="selectTUsuario">Tipo de documento</label>
    <select class="form-control" id="selectTUsuario">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleSelect2">Example multiple select</label>
    <select multiple class="form-control" id="exampleSelect2">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleTextarea">Example textarea</label>
    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputFile">File input</label>
    <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
    <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
  </div>
  <fieldset class="form-group">
    <legend>Radio buttons</legend>
    <div class="form-check">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked>
        Option one is this and that&mdash;be sure to include why it's great
      </label>
    </div>
    <div class="form-check">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
        Option two can be something else and selecting it will deselect option one
      </label>
    </div>
    <div class="form-check disabled">
    <label class="form-check-label">
        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
        Option three is disabled
      </label>
    </div>
  </fieldset>
  <div class="form-check">
    <label class="form-check-label">
      <input type="checkbox" class="form-check-input">
      Check me out
    </label>
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