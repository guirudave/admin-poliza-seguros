<?php
if (! defined ( 'SRCP' )) {
	die ( "Logged Hacking attempt!" );
}
///////// Super inseguro pero funciona
$tipo = $_GET['tipo'];
$id = $_GET['id'];
$cedula = $_GET['id'];
function query($var1, $var2, PDO $db){
	switch ($var1) {
		case 'corredor':{
			$query = '	UPDATE corredor   
						SET 
						       estatus = :estatus 
						 WHERE cedula = :cedula
        		';
        $query_params = array(
            ':estatus' => 'Inactivo',
            ':cedula' => $var2
            );
        try {
            $stmt = $db->prepare($query);
            $result = $stmt->execute($query_params);
        } catch (PDOException $ex) {
            // Si tenemos problemas para ejecutar la consulta imprimimos el error
            echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
					</div>
				  </div>".$ex->getMessage();
        }//fin catch error
        header('Location: index.php?do=listacorredor');
        break;
    } //fin case corredor
            
            
    case 'asegurado':{
			$query = '	UPDATE asegurado   
						SET 
						       estatus = :estatus 
						 WHERE cedula = :cedula
        		';
        $query_params = array(
            ':estatus' => 'Inactivo',
            ':cedula' => $var2
            );
        try {
            $stmt = $db->prepare($query);
            $result = $stmt->execute($query_params);
        } catch (PDOException $ex) {
            // Si tenemos problemas para ejecutar la consulta imprimimos el error
            echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
					</div>
				  </div>".$ex->getMessage();
        }//fin catch error
        header('Location: index.php?do=listaasegurado');
        break;
    } //fin case asegurado
            
             case 'beneficiario':{
			$query = '	UPDATE beneficiario   
						SET 
						       estatus = :estatus 
						 WHERE cedula = :cedula
        		';
        $query_params = array(
            ':estatus' => 'Inactivo',
            ':cedula' => $var2
            );
        try {
            $stmt = $db->prepare($query);
            $result = $stmt->execute($query_params);
        } catch (PDOException $ex) {
            // Si tenemos problemas para ejecutar la consulta imprimimos el error
            echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
					</div>
				  </div>".$ex->getMessage();
        }//fin catch error
        header('Location: index.php?do=listabeneficiario');
        break;
    } //fin case tipopolizas
               case 'tipopolizas':{
			$query = '	UPDATE tipopolizas   
						SET 
						       estatus = :estatus 
						 WHERE id = :cedula
        		';
        $query_params = array(
            ':estatus' => 'Inactivo',
            ':cedula' => $var2
            );
        try {
            $stmt = $db->prepare($query);
            $result = $stmt->execute($query_params);
        } catch (PDOException $ex) {
            // Si tenemos problemas para ejecutar la consulta imprimimos el error
            echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
					</div>
				  </div>".$ex->getMessage();
        }//fin catch error
        header('Location: index.php?do=tpoliza');
        break;
    } //fin case tipopolizas
            
                  case 'tiposeguro':{
			$query = '	UPDATE tiposeguro   
						SET 
						       estatus = :estatus 
						 WHERE id = :cedula
        		';
        $query_params = array(
            ':estatus' => 'Inactivo',
            ':cedula' => $var2
            );
        try {
            $stmt = $db->prepare($query);
            $result = $stmt->execute($query_params);
        } catch (PDOException $ex) {
            // Si tenemos problemas para ejecutar la consulta imprimimos el error
            echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
					</div>
				  </div>".$ex->getMessage();
        }//fin catch error
        header('Location: index.php?do=tseguro');
        break;
    } //fin case tiposeguro
            
            
                case 'aseguradora':{
			$query = '	UPDATE aseguradora   
						SET 
						       estatus = :estatus 
						 WHERE rif = :cedula
        		';
        $query_params = array(
            ':estatus' => 'Inactivo',
            ':cedula' => $var2
            );
        try {
            $stmt = $db->prepare($query);
            $result = $stmt->execute($query_params);
        } catch (PDOException $ex) {
            // Si tenemos problemas para ejecutar la consulta imprimimos el error
            echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
					</div>
				  </div>".$ex->getMessage();
        }//fin catch error
        header('Location: index.php?do=listaaseguradora');
        break;
    } //fin case tiposeguro
            
            
            
            
            
            

		default:
			header('Location: index.php?do=panel');
			break;
} // fin switch
}//fin funcion
query($tipo, $id, $db);

/*
Aqui hacemos una query basica que va a servir completamente para todos los eliminados logicos
Osea pasamos los valores del tipo y el valor a cada cosa ejemplo
el tipo = corredor, asegurado, poliza
el id = cedula, rif, otro.
*/