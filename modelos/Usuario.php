<?php 
	//incluimos la conexion a la base de datos
	require '../config/Conexion.php';

	Class Usuario{

		//implementamos el contructor
		public function __construct(){

		}
		//imprelementamos un metodo  para insertar registros

		public function insertar($nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email,$cargo,$login,$clave,$imagen,$permisos){

			$sql="INSERT INTO usuario (nombre,tipo_documento,num_documento,direccion,telefono,email,cargo,login,clave,imagen,condicion)
		VALUES ('$nombre','$tipo_documento','$num_documento','$direccion','$telefono','$email','$cargo','$login','$clave','$imagen','1')";
		//return ejecutarConsulta($sql);
		$idusuarionew=ejecutarConsulta_retornarID($sql);

		$num_elementos=0;
		$sw=true;

		while ($num_elementos < count($permisos))
		{
			$sql_detalle = "INSERT INTO usuario_permiso(idusuario, idpermiso) VALUES('$idusuarionew', '$permisos[$num_elementos]')";
			ejecutarConsulta($sql_detalle) or $sw = false;
			$num_elementos=$num_elementos + 1;
		}

		return $sw;



			//return ejecutarConsulta($sql);
		}

		//imprelementamos un metodo  para editar registros
		public function editar($idusuario,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email,$cargo,$login,$clave,$imagen,$permisos){
			$sql="UPDATE usuario SET nombre='$nombre',tipo_documento='$tipo_documento',num_documento='$num_documento',direccion='$direccion',telefono='$telefono',email='$email',cargo='$cargo'='$login',login='$login',clave='$clave',imagen='$imagen' WHERE idusuario='$idusuario'";
		ejecutarConsulta($sql);

		//eliminamso todos los permisos asignados para volverlos a asignar

		$sqldel="DELETE FROM usuario_permiso WHERE idusuario='$idusuario'";
		ejecutarConsulta($sqldel);

		//actualizaos los permisos 
		$num_elementos=0;
		$sw=true;

		while ($num_elementos < count($permisos))
		{
			$sql_detalle = "INSERT INTO usuario_permiso(idusuario, idpermiso) VALUES('$idusuario', '$permisos[$num_elementos]')";
			ejecutarConsulta($sql_detalle) or $sw = false;
			$num_elementos=$num_elementos + 1;
		}

		return $sw;


		}

		// metodo para cambiar condicion de las categorias

		public function desactivar($idusuario){
			$sql="UPDATE usuario SET condicion='0' WHERE idusuario='$idusuario'";
			return ejecutarConsulta($sql);

		}
		public function activar($idusuario){
			$sql="UPDATE usuario SET condicion='1' WHERE idusuario='$idusuario'";
			return ejecutarConsulta($sql);

		}

		//metodo para mostrar datos de un registro a modificar 

		public function mostrar($idusuario){
			$sql="SELECT * FROM usuario WHERE idusuario='$idusuario'";
			return ejecutarConsultaSimpleFila($sql);

		}

		//metodo para listar datos de un registro a modificar 

		public function listar(){
			$sql="SELECT * FROM usuario";
			return ejecutarConsulta($sql);

		}

		//implemetar un metodo para lista los permisos marcados
		public function listarmarcados($idusuario){
			$sql="SELECT * FROM usuario_permiso WHERE idusuario='$idusuario'";
			return ejecutarConsulta($sql);
		}

		//funcion para verificar el acceso al sistema
		public function verificar($login,$clave){
			$sql="SELECT idusuario,nombre,tipo_documento,num_documento,direccion,telefono,email,cargo,login,clave,imagen FROM usuario WHERE login='$login' AND clave='$clave' AND condicion='1'";
			return ejecutarConsulta($sql);
		}
		


	}






 ?>