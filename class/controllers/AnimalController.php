<?php


class AnimalController {


    function Listar() {
        $servidor = 'mysql:host=localhost;dbname=prontuario_vet';
        $usuario = 'root';
        $senha = 'root'; 



        try {
            $pdo = new PDO($servidor, $usuario, $senha);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $cSQL = $pdo->prepare('SELECT cd_animal, nm_animal, cd_especie FROM animal');
            $cSQL->execute();

            $dados = $cSQL->fetch(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            echo 'Erro: ' . $e->getMessage();
        }
       
    }
}


?>