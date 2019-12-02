<?php
    require'models/connection_bdd.php';


    function liste(){
        global $basedonne;

        $sql = "SELECT produits.nom,produits.description,produits.image_produit,produits.prix,
        GROUP_CONCAT(DISTINCT genre.type SEPARATOR ', ') AS genre,
        GROUP_CONCAT(DISTINCT marques.marque SEPARATOR ', ') AS marques,
        GROUP_CONCAT(DISTINCT categories.categorie SEPARATOR ', ') AS categories
        FROM produit_genre 
        INNER JOIN produits ON produit_genre.produit = produits.id
        INNER JOIN produit_marque ON produit_marque.produit = produits.id
        INNER JOIN marques ON marques.id = produit_marque.marque
        INNER JOIN genre ON genre.id = produit_genre.genre
        INNER JOIN produit_categorie ON produit_categorie.produit = produits.id
        INNER JOIN categories ON categories.id = produit_categorie.categorie
        GROUP BY produits.nom";
        
        $requete = $basedonne->prepare($sql);
        $requete->execute();    
        return $requete->fetchAll(PDO::FETCH_ASSOC);    
    }

    function getProductById($id) {

        global $basedonne;

        $sql = "SELECT * 
        FROM produits p, produit_marque pm
        WHERE p.id = pm.produit
        AND pm.marque=:idmarque;";
        
        $requete = $basedonne->prepare($sql);
        $requete -> bindParam(':idmarque', $id, PDO::PARAM_INT);
        $requete->execute();    

        return $requete->fetchAll(PDO::FETCH_ASSOC);    
    }

    function getProductByGenre($id) {
        
        global $basedonne;

        $sql = "SELECT * 
        FROM produits p, produit_genre pg
        WHERE p.id = pg.produit
        AND pg.genre=:idgenre;";
        
        $requete = $basedonne->prepare($sql);
        $requete -> bindParam(':idgenre', $id, PDO::PARAM_INT);
        $requete->execute();    

        return $requete->fetchAll(PDO::FETCH_ASSOC);    
    }