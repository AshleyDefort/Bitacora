<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="Public/img/logo.png" >
    <title>Recuperación de contraseña</title>

    <!-- Custom fonts for this template-->
    <link href="Public/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="Public/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-light" >
    <header class="bg-light" >
												<a href="?controller=main&action=frmLogin"><img src="Public/img/LogoSimbolo.jpg" class="img-fluid w-25" alt="Banner"> </a>
            

    <div class="w-100 bg-gradient-primary" style="height:20px;">

    </div>
    </header>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">
								

            <div class="col-xl-6 col-lg-9 col-md-6">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row justify-content-center">
                            <div class="d-none d-lg-block"></div>
                            <div class="col-lg-9">
                                <div class="p-4">
                                    <div class="text-center">
                                        <h1 class="h4 text-green-900 mb-15">Recuperación de contraseña</h1>
                                    </div>
 <form class="user" method="post" 
 		action="?controller=funcionarios&action=validar" onsubmit="return false">

         <div class="form-group row">
         <div class="col-sm-12">
									<h1 class="h6 text-green-900 mb-4">Seleccione tipo de documento:</h1>
                    <select id="doc" name="doc" class="form-control">
																				
                        <option value="Cedula de Ciudadania">Cedula de Ciudadania</option>
                        <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                        <option value="Permiso Especial de Permanencia">Permiso Especial de Permanencia</option>
                        <option value="Cedula de Extrangeria">Cedula de Extrangeria</option>
                        <option value="Permiso por Protección Temporal">Permiso por Protección Temporal</option>
                    </select>
                </div>

                                        </div>
			<h1 class="h6 text-green-900 mb-4">Número de documento:</h1>
                                        <div class="form-group">
    <input type="number" class="form-control form-control-user"
              id="id" name="id" placeholder="Ingrese número de documento">

                                        </div>
                                        <div class="form-group" hidden="true">
    

                                        </div>                                                                                                             
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="submit" value="Recuperar contraseña" class="btn btn-primary" onclick=" return recuperarcontrasena()">
                                        </div>
                                         
                                    </form>
                                    <hr>
                                                                       
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <footer class="bg-gradient-primary text-center text-lg-start">
  <!-- Copyright -->
  <div class="text-center p-3 bg-gradient-primary text-light">
    © 202X Copyright:
    <a class="text-light" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>

    <!-- Bootstrap core JavaScript-->
    <script src="Public/vendor/jquery/jquery.min.js"></script>
    <script src="Public/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="Public/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="Public/js/sb-admin-2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="Public/js/script.js"></script>

</body>
</html>