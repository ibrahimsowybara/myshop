<?php 

require 'vendor/autoload.php';

$loader = new Twig_Loader_Filesystem('view');
$twig = new Twig_Environment($loader, array(
    'cache' => false,
));






require_once('models/produits.php');
require_once('models/marques.php');



switch ($action) {
    case 'list':
        showList();
        break;
}





function showList(){
    global $twig, $id;
    $result = listemarque();
    
    

    $template = $twig->load('marques.html.twig');
    echo $template->render(array('title'=>'Toutes les Marques','marques' => $result));


}