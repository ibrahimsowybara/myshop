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
        case 'marque':
            showListByOneMarque();
            break;
}



function showList(){
    global $twig, $baseurl;
    $produits = liste();
  
    $template = $twig->load('produits.html.twig');
    echo $template->render( array('title'=>'Tous les Produits', 'produits' => $produits, 'baseurl' => $baseurl) );

}

function showListByOneMarque(){
    global $twig, $id, $baseurl;
    $produits = showListByOneMarque($id);
    $marques = marqueById($id);
    $titre = $marques["marques"].' a joué dans le(s) film(s) ci-dessous';

    $template = $twig->load('produits.html.twig');
    echo $template->render( array('showmarques'=> $titre, 'returnmarques'=>'<i class="fas fa-arrow-circle-left"></i> Retourner en arrière', 'marques' => $marques, 'baseurl' => $baseurl) );

}