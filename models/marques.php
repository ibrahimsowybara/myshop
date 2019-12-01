<?php
    require'models/connection_bdd.php';


    function listemarque(){
        global $basedonne;
        $requete = $basedonne->prepare("SELECT marques.marque, marques.id, marques.img_marque FROM marques");

        $requete->execute();
    
        return $requete->fetchAll(PDO::FETCH_ASSOC);
        
    }

    function marqueById($id){
        global $basedonne;
        $requete = $basedonne->prepare("SELECT marques.marque, marques.id, marques.img_marque FROM marques WHERE marques.id=:id");
        $requete -> bindParam(":id", $id, PDO::PARAM_INT);
        $requete->execute();
    
        return $requete->fetch(PDO::FETCH_ASSOC);
        
    }
    
    