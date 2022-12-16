<?php 
	//incluimos la conexion a la base de datos
	require '../config/Conexion.php';

	Class Articulo{

		//implementamos el contructor
		public function __construct(){

		}
		//imprelementamos un metodo  para insertar registros

		public function insertar($idcategoria,$codigo,$nombre,$stock,$descripcion,$imagen){

			$sql="INSERT INTO articulo (idcategoria,codigo,nombre,stock,descripcion,imagen,condicion)
		VALUES ('$idcategoria','$codigo','$nombre','$stock','$descripcion','$imagen','1')";
			return ejecutarConsulta($sql);
		}

		//imprelementamos un metodo  para editar registros
		public function editar($idarticulo,$idcategoria,$codigo,$nombre,$stock,$descripcion,$imagen){
			$sql="UPDATE articulo SET idcategoria='$idcategoria',codigo='$codigo',nombre='$nombre',stock='$stock',descripcion='$descripcion',imagen='$imagen' WHERE idarticulo='$idarticulo'";
		return ejecutarConsulta($sql);

		}

		// metodo para cambiar condicion registrps

		public function desactivar($idarticulo){
			$sql="UPDATE articulo SET condicion='0' WHERE idarticulo='$idarticulo'";
			return ejecutarConsulta($sql);

		}
		public function activar($idarticulo){
			$sql="UPDATE articulo SET condicion='1' WHERE idarticulo='$idarticulo'";
			return ejecutarConsulta($sql);

		}

		//metodo para mostrar datos de un registro a modificar 

		public function mostrar($idarticulo){
			$sql="SELECT * FROM articulo WHERE idarticulo='$idarticulo'";
			return ejecutarConsultaSimpleFila($sql);

		}

		//metodo para listar datos de un registro a modificar 

		public function listar(){
			$sql="SELECT a.idarticulo,a.idcategoria,c.nombre as categoria,a.codigo,a.nombre,a.stock,a.descripcion,a.imagen,a.condicion FROM articulo a INNER JOIN categoria c ON a.idcategoria=c.idcategoria";
			return ejecutarConsulta($sql);

		}
		//metodo para listar datos de un registro activos

		public function listaractivos(){
			$sql="SELECT a.idarticulo,a.idcategoria,c.nombre as categoria,a.codigo,a.nombre,a.stock,a.descripcion,a.imagen,a.condicion FROM articulo a INNER JOIN categoria c ON a.idcategoria=c.idcategoria WHERE a.condicion='1'";
			return ejecutarConsulta($sql);

		}

		//Implementar un método para listar los registros activos, su último precio y el stock (vamos a unir con el último registro de la tabla detalle_ingreso)
		public function listarActivosVenta()
		{
			$sql="SELECT a.idarticulo,a.idcategoria,c.nombre as categoria,a.codigo,a.nombre,a.stock,(SELECT precio_venta FROM detalle_ingreso WHERE idarticulo=a.idarticulo order by iddetalle_ingreso desc limit 0,1) as precio_venta,a.descripcion,a.imagen,a.condicion FROM articulo a INNER JOIN categoria c ON a.idcategoria=c.idcategoria WHERE a.condicion='1'";
			return ejecutarConsulta($sql);		
		}





	}






 ?>
