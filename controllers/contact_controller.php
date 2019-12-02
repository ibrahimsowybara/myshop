<?php 

require 'vendor/autoload.php';

$loader = new Twig_Loader_Filesystem('view');
$twig = new Twig_Environment($loader, array(
    'cache' => false,
));



function showList(){
global $twig, $baseurl;

$template = $twig->load('contact.html.twig');
echo $template->render( array('title'=>'Contact', 'baseurl' => $baseurl) );

}