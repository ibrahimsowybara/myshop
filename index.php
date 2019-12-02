<?php 

// rooting
$requete = explode("/", trim($_SERVER['REQUEST_URI'], "/"));

$controller = (count($requete) >= 1) ? $requete[0] : "home";
$action= (count($requete) >= 2) ? $requete[1] : "";
$id= (count($requete) >= 3) ? $requete[2] : null;

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

        case 'contact':
                require_once("controllers/contact_controller.php");
                break;

        default:
                require_once("controllers/produits_controller.php");
                break;
}


?>