<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    

</head> 
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="../inicio.php">BIENVENIDO AL SISTEMA</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"></button>
    </nav>
    <br><br><br>   
    <center><div class="login">   
        <form id="formulario" method="post" action="inicio.php"><br> 
        <strong class="titulo">Ingrese su usuario y contraseña para iniciar sesión</strong> <br>                 
            <label class="titulo">Nombre de Usuario:</label> <br>                  
            <input  style="text-transform: uppercase;" type="text" name="usuario" value="" required/>  <br> 
            <label class="titulo">Contraseña:</label><br>
            <input   type="password" name="clave" value="" required/> <br><br> 
            <input id="btn" class="btn btn-primary" type="submit" value="Iniciar sesión" >
            <div type="input" name="imagen1" value="0"></div>
            <br><br>              
        </form>    
    </div>  </center>  
</div>             
</body>
</html>
