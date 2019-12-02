<?php 

require 'vendor/autoload.php';

$loader = new Twig_Loader_Filesystem('view');
$twig = new Twig_Environment($loader, array(
    'cache' => false,
));

require_once('models/produits.php');
require_once('models/marques.php');


switch ($action) {
    case 'marque' :
        showListByOneMarque();
        break;
    case 'genre' :
        showListByGenre();
        break;
    default : 
        showList();
}

function showList(){
    
    global $twig, $baseurl;

    $produits = liste();
  
    $template = $twig->load('produits.html.twig');
    echo $template->render( array('title'=>'Tous les Produits', 'produits' => $produits, 'baseurl' => $baseurl) );

}

function showListByOneMarque(){
    
    global $twig, $id, $baseurl;

    $produits = getProductById($id);
    
    $marques = marqueById($id);

    // $titre = $marques["marques"].' a joué dans le(s) film(s) ci-dessous';
    $titre = "Tmp title";

    $template = $twig->load('produits.html.twig');
    echo $template->render( array(
        'showmarques'=> $titre, 
        'returnmarques'=>'<i class="fas fa-arrow-circle-left"></i> Retourner en arrière', 
        'marques' => $marques, 
        'baseurl' => $baseurl,
        'produits' => $produits
        
    ) );
}

function showListByGenre(){
    
    global $twig, $id, $baseurl;

    $produits = getProductByGenre($id);

    // $titre = $marques["marques"].' a joué dans le(s) film(s) ci-dessous';
    $titre = "Tmp title"; 

    $template = $twig->load('produits.html.twig');
    echo $template->render( array(
        'showmarques'=> "", 
        'returnmarques'=>'<i class="fas fa-arrow-circle-left"></i> Retourner en arrière', 
        'baseurl' => $baseurl,
        'produits' => $produits
        
    ) );

}