<?php
session_start();
include("php/conectar.php");//incluye la función conectar ubicada en el archivo conectar.php
$link = conectar();//asigno la función a la variable link
extract($_POST);//obtener las variables post
error_reporting(0);//para no mostrar el error por variables aun no definidas
$query_tipoDoc = "select id_tipo_doc, nombre_tipo_doc from tipo_doc";
$result_tipoDoc = mysqli_query($link, $query_tipoDoc) or die('Error de Conexión (' . mysqli_connect_errno() . ') '. mysqli_connect_error());//Query para llamar los tipos de documento
$query_tipoUsu = "SELECT id_tipo_usuario, nombre_tipo_usuario FROM tipo_usuario WHERE nombre_tipo_usuario NOT LIKE  '%Visitante%'";//Sentencia select con el not like que no muestre el resultado visitante
$result_tipoUsu = mysqli_query($link, $query_tipoUsu) or die('Error de Conexión (' . mysqli_connect_errno() . ') '. mysqli_connect_error());
$documentoUsuario = mysqli_query($link, "SELECT * FROM usuarios WHERE documento = '$inputDocumento'");

$usuarioExiste = mysqli_query($link, "SELECT * FROM persona WHERE num_documento = '$inputNumeroDoc'");//Hace la consulta para saber si hay un documento con el mismo numero de documento
if (mysqli_num_rows($usuarioExiste) == 0){ //devuele el numero de documentos encontrados con ese numero y si es 0 significa que no hay ninguno y se realizan los insert
    $ins = $link -> query("INSERT INTO persona VALUES ('', '$inputTipoDoc', '$inputNumeroDoc', '$inputNombre','$inputApellido', '$inputTelefono', '$inputDireccion', '$inputTipoUsu')");//Estructura para un insert
    $tablaUsuarios = $link -> query("INSERT INTO usuarios VALUES('','$inputNumeroDoc', '$inputPass')");
    if ($ins) {
    echo '<div class="container" style="margin-top: 100px">
    <div class="row">
    <div class="col"></div>
    <div class="col alert alert-success" role="alert">
  <strong>Éxito!</strong> Tus datos han sido registrados.
</div>
    <div class="col"></div>
    </div>
    </div>';
    }//muestra un mensaje de éxito
}
else{//si el sqli_num_rows devuelve mas de 0 entonces muestra este mensaje de error y no hace el insert
    echo '<div class="container" style="margin-top: 100px">
    <div class="row">
    <div class="col"></div>
    <div class="col alert alert-danger" role="alert">
  <strong>Error!</strong> Revisa el documento ingresado.
</div>
    <div class="col"></div>
    </div>
    </div>
    ';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bibliocom Login</title>
        <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/estilosBiblioteca.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="js/sha.js"></script>
    <script src="js/jquery-slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div class="row"> 
<div class="col"></div>
<div class="col">
    <div class="jumbotron" style="margin-top: 10%">

                <h1 class="text-center">Bienvenido</h1>
          <div class="row">
            <div class="col"></div>
            <div class="col">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#modalRegistro"><!--el btn-block es para hacer un bloque de botones que tengan espacio y el mismo tamaño-->
                    Registro
                </button>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#modalInicio">
                    Iniciar sesión
                </button>
            </div>
            <div class="col"></div>
        </div>
</div>
</div>
<div class="col"></div>
</div>
</div>
<!-- Modal Registro-->
<div class="modal fade" id="modalRegistro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Registro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
          <form method="POST" role="form">
      <div class="modal-body">
        <div class="container">
  <div class="form-group">
    <label for="inputName">Nombre(s)</label>
    <input type="text" class="form-control" id="inputName" name="inputNombre" aria-describedby="nombre" placeholder="Ingrese su(s) nombre(s)" required pattern="[a-zA-Z]{2-9}*">
  </div>
  <div class="form-group">
    <label for="inputApe">Apellido(s)</label>
    <input type="text" class="form-control" id="inputApe" name="inputApellido" placeholder="Ingrese su(s) apellido(s)" required pattern="[A-Za-z]{2-10}">
  </div>
  <div class="form-group">
    <label for="sl_tUsu">Tipo de usuario</label>
    <select class="form-control" id="sl_tUsu" name="inputTipoUsu" required>
      <option value='0'></option>;
            <?php
            while($fila_tipoUsu = mysqli_fetch_array($result_tipoUsu))
            {
              extract($fila_tipoUsu);
              echo "<option value='$id_tipo_usuario'>$nombre_tipo_usuario</option>";
            }         
            ?>
    </select>
  </div>
  <div class="form-group">
    <label for="sl_tipoDoc">Tipo de documento</label>
    <select class="form-control" id="sl_tipoDoc" name="inputTipoDoc" required>
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
    <input type="number" class="form-control" id="inputNumDoc" name="inputNumeroDoc" placeholder="Ingrese su número de documento" required>
  </div>
    <div class="form-group">
    <label for="inputTel">Teléfono</label>
    <input type="number" class="form-control" id="inputTel" name="inputTelefono" placeholder="Ingrese su teléfono" required >
  </div>
  <div class="form-group">
    <label for="inputDir">Dirección</label>
    <input type="tel" class="form-control" id="inputDir" name="inputDireccion" placeholder="Ingrese su dirección" required>
  </div>
  <div class="form-group">
    <label for="password">Contraseña</label>
    <input type="password" class="form-control" id="password" name="inputPass" aria-describedby="nombre" placeholder="Ingrese su constraseña">
  </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
    <button type="submit" class="btn btn-primary" onclick="cifrar()">Guardar</button>
    <script>
    function cifrar(){
      var input_pass = document.getElementById("password");
      input_pass.value = calcSHA1(input_pass.value);
    }
  </script>
    </div>
    </div>
    </div>
  </form>
      </div>
    </div>
  </div>
</div>
<!-- Modal Inicio-->
<div class="modal fade" id="modalInicio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ingrese sus datos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="POST" role="form">
      <div class="modal-body">
      <div class="container">
        <div class="form-group">
    <label for="inputNumDoc">Número de documento</label>
    <input type="number" class="form-control" id="inputNumDoc" name="inputDocumento" placeholder="Ingrese su número de documento" required>
  </div>
  <div class="form-group">
    <label for="password">Contraseña</label>
    <input type="password" class="form-control" id="password" name="inputPass" aria-describedby="nombre" placeholder="Ingrese su constraseña">
  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Ingresar</button>
      </div>
    </div>
  </div>
  </form>
</div>
</div>
</div>
</body>
</html>