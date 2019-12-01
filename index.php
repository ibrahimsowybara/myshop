<?php 


// rooting
$requete = explode("/", trim($_SERVER['REQUEST_URI'], "/"));

$controller=(count($requete)=== 1)?  "home":$requete[1];
$action=(count($requete) < 3)? "list": $requete[2];
$id=(count($requete) < 4)? 0: (int)$requete[3];

switch ($controller) {
        case 'marques':
        require_once("controllers/marques_controller.php");
        break;

        case 'genre':
        require_once("controllers/genres_controller.php");
        break;

        case 'categorie':
        require_once("controllers/categories_controller.php");
        break;

    default:
        require_once("controllers/produits_controller.php");
        break;
}




?>