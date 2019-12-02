<?php
    require'models/connection_bdd.php';


    function listemarque() {
        
        global $basedonne;
        
        $requete = $basedonne->prepare("SELECT marques.marque, marques.id, marques.img_marque FROM marques");

        $requete->execute();

        $data = array();

        while($row = $requete->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }

        return $data;
        
    }

    function marqueById($id){
        
        global $basedonne;

        $requete = $basedonne->prepare("SELECT * 
        FROM produits p, produit_marque pm
        WHERE p.id = pm.produit
        AND pm.marque=:id;");

        $requete -> bindParam(":id", $id, PDO::PARAM_INT);
        $requete->execute();

        $data = array();

        while($row = $requete->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }

        return $data;
        
    }
    
    