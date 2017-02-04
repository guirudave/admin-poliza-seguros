<?php
$query = "  SELECT  id,
codigo,
                    nombre,
                    observacion                 
            FROM    tiposeguro where estatus!='Inactivo' ORDER BY id ASC
         ";
    try{
        $stmt = $db->prepare($query);
        $result = $stmt->execute();
    }
    catch(PDOException $ex){
    echo "Error > " .$ex->getMessage();
    }
    $rows = $stmt->fetchAll();
?>
