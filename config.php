<?php 

    spl_autoload_register(function($className){

        $dirClass = 'class/';


        $allDir = [

            $dirClass,
            $dirClass . 'models/',
            $dirClass . 'views/',
            $dirClass . 'controllers/'
        ];

        foreach ($allDir as $dir) {

            
            $fileName = $dir . $className . '.php';

            if (file_exists($fileName)) {
                require_once $fileName;
                break;
            };
        }



    });


?>