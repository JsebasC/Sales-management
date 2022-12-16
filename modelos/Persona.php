<?php 
	//incluimos la conexion a la base de datos
	require '../config/Conexion.php';

	Class Persona{

		//implementamos el contructor
		public function __construct(){

		}
		//imprelementamos un metodo  para insertar registros

		public function insertar($tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email){

			$sql="INSERT INTO persona(tipo_persona,nombre,tipo_documento,num_documento,direccion,telefono,email)
				VALUES ('$tipo_persona','$nombre','$tipo_documento','$num_documento','$direccion','$telefono','$email')";
			return ejecutarConsulta($sql);
		}

		//imprelementamos un metodo  para editar registros
		public function editar($idpersona,$tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email){
			$sql="UPDATE persona SET tipo_persona='$tipo_persona',nombre='$nombre',tipo_documento='$tipo_documento',num_documento='$num_documento',direccion='$direccion',telefono='$telefono',email='$email' WHERE idpersona='$idpersona'";
		return ejecutarConsulta($sql);

		}

		// metodo para cambiar condicion de las categorias

		public function eliminar($idpersona){
			$sql="DELETE FROM persona  WHERE  idpersona='$idpersona'";
			return ejecutarConsulta($sql);

		}
		

		//metodo para mostrar datos de un registro a modificar 

		public function mostrar($idpersona){
			$sql="SELECT * FROM persona WHERE idpersona='$idpersona'";
			return ejecutarConsultaSimpleFila($sql);

		}

		//metodo para listar datos de un registro a modificar 

		public function listarp(){
			$sql="SELECT * FROM persona WHERE tipo_persona='Proveedor'";
			return ejecutarConsulta($sql);

		}
		public function listarc(){
			$sql="SELECT * FROM persona WHERE tipo_persona='Cliente'";
			return ejecutarConsulta($sql);

		}

	





	}






 ?>