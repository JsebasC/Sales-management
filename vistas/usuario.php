<?php

  //activamso el almacenamieno en el buffer

  ob_start();
  session_start();

  if (!isset($_SESSION["nombre"])) {

    header("Location: login.html");

  }else{

  require 'header.php';

    if ($_SESSION['acceso']==1) {
      
    
?>
<!--Contenido-->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        
        <!-- Main content -->
        <section class="content">
            <div class="row">
              <div class="col-md-12">
                  <div class="box">
                    <div class="box-header with-border">
                          <h1 class="box-title">Usuario<button class="btn btn-success" id="btnagregar" onclick="mostrarform(true)"><i class="fa fa-plus-circle"></i> Agregar</button></h1>
                        <div class="box-tools pull-right">
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <!-- centro -->
                    
                    <div class="panel-body table-responsive" id="listadoregistros">
                        <table id="tblistado" class="table table-striped table-bordered tabled-condensed tabled-hover">
                          <thead>
                            <th>Opciones</th>
                            <th>nombre</th>
                            <th>Documento</th>
                            <th>Numero</th>
                            <th>Telefono</th>
                            <th>Email</th>
                            <th>Login</th>
                            <th>Foto</th>
                            <th>Estado</th>

                          </thead>
                          <tbody>
                            

                          </tbody>
                          <tfoot>
                            <th>Opciones</th>
                            <th>nombre</th>
                            <th>Documento</th>
                            <th>Numero</th>
                            <th>Telefono</th>
                            <th>Email</th>
                            <th>Login</th>
                            <th>Foto</th>
                            <th>Estado</th>
                          </tfoot>
                        </table>
                    </div>

                    <div class="panel-body" id="formularioregistros">
                        <form name="formulario" id="formulario" method="POST">
                          <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label> Nombre (*): </label>
                            <input type="hidden" name="idusuario" id="idusuario">
                            <input type="text" name="nombre" id="nombre" class="form-control" maxlength="100" placeholder="Nombre" required>
                          </div>
                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Tipo Documento (*): </label>
                        
                            <select class="form-control select- picker" id="tipo_documento" name="tipo_documento" required>
                              <option value="DNI">DNI</option>
                              <option value="RUT">RUT</option>
                              <option value="CEDULA">CEDULA</option>
                            </select>
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Numero (*): </label>
                            <input type="text" name="num_documento" id="num_documento" class="form-control" maxlength="20" placeholder="Documento" required>
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Direccion: </label>
                      
                            <input type="text" name="direccion" id="direccion" class="form-control" placeholder="Dirrecion" maxlength="70">
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Telefono: </label>
                            <input type="text" name="telefono" id="telefono" class="form-control" maxlength="250" placeholder="Telefono">
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Email: </label>
                            <input type="text" name="email" id="email" class="form-control" maxlength="250" placeholder="Email">
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Cargo: </label>
                            <input type="text" name="cargo" id="cargo" class="form-control" maxlength="20" placeholder="Cargo">
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Login (*): </label>
                            <input type="text" name="login" id="login" class="form-control" maxlength="20" placeholder="Cargo" required>
                          </div>

                           <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Clave (*): </label>
                            <input type="password" name="clave" id="clave" class="form-control" maxlength="64" placeholder="Clave" required>
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Permiso (*): </label>
                            <ul style="list-style: none;" id="permisos" name="permisos">
                              
                            </ul>
                          </div>

                          <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Imagen: </label>
                            <input type="file" name="imagen" id="imagen" class="form-control">
                            <input type="hidden" name="imagenactual" id="imagenactual">
                            <img src="" width="150px" height="120px" id="imagenmuestra">


                          </div>

                          <div class="form-group col-lg-12 col-md-12 col sm-12 col-xs-12">
                            
                              <button class="btn btn-primary" type="submit" id="btnGuardar">
                                <i class="fa fa-save"> 
                                </i>
                                Guardar
                              </button>

                              <button class="btn btn-danger" type="button" onclick="cancelarform()">
                                <i class="fa fa-arrow-circle-left"> 
                                </i>
                                Cancelar
                              </button>

                          </div>
                        </form>
                    </div>
                    <!--Fin centro -->
                  </div><!-- /.box -->
              </div><!-- /.col -->
          </div><!-- /.row -->
      </section><!-- /.content -->

    </div><!-- /.content-wrapper -->
  <!--Fin-Contenido-->

<?php
  }else{
      require 'noacceso.php';
    }

  require 'footer.php';
?>
<script type="text/javascript" src="scrips/usuario.js"></script>
<?php 
} 
ob_end_flush();
?>