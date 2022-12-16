<?php 
	//incluimos la conexion a la base de datos
	require '../config/Conexion.php';

	Class Permiso{

		//implementamos el contructor
		public function __construct(){

		}


		//metodo para listar datos de un registro a modificar 

		public function listar(){
			$sql="SELECT * FROM permiso";
			return ejecutarConsulta($sql);

		}

	}






 ?>