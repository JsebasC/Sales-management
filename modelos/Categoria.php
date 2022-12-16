<?php 
	//incluimos la conexion a la base de datos
	require '../config/Conexion.php';

	Class Categoria{

		//implementamos el contructor
		public function __construct(){

		}
		//imprelementamos un metodo  para insertar registros

		public function insertar($nombre,$descripcion){

			$sql="INSERT INTO categoria(nombre,descripcion,condicion)
				VALUES ('$nombre','$descripcion','1');
			";
			return ejecutarConsulta($sql);
		}

		//imprelementamos un metodo  para editar registros
		public function editar($idcategoria,$nombre,$descripcion){
			$sql="UPDATE categoria SET nombre='$nombre',descripcion='$descripcion' WHERE idcategoria='$idcategoria'";
		return ejecutarConsulta($sql);

		}

		// metodo para cambiar condicion de las categorias

		public function desactivar($idcategoria){
			$sql="UPDATE categoria SET condicion='0' WHERE idcategoria='$idcategoria'";
			return ejecutarConsulta($sql);

		}
		public function activar($idcategoria){
			$sql="UPDATE categoria SET condicion='1' WHERE idcategoria='$idcategoria'";
			return ejecutarConsulta($sql);

		}

		//metodo para mostrar datos de un registro a modificar 

		public function mostrar($idcategoria){
			$sql="SELECT * FROM categoria WHERE idcategoria='$idcategoria'";
			return ejecutarConsultaSimpleFila($sql);

		}

		//metodo para listar datos de un registro a modificar 

		public function listar(){
			$sql="SELECT * FROM categoria";
			return ejecutarConsulta($sql);

		}

		//metodo para listar datos de un registro y mostar en el select

		public function select(){
			$sql="SELECT * FROM categoria WHERE condicion=1";
			return ejecutarConsulta($sql);

		}






	}






 ?>