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

    function showFilmsByOneMarque($idmarques){
        global $basedonne;

        $sql = "SELECT p.id, p.nom, p.description, p.image_produit, p.prix, 
        (SELECT GROUP_CONCAT(DISTINCT g.type SEPARATOR ', ')
                     FROM genre as g inner JOIN produit_genre as pg ON g.id = pg.genre 
                     WHERE pg.produit = p.id ) AS genre,
                     
                     
        (SELECT GROUP_CONCAT(DISTINCT c.categorie SEPARATOR ', ')
               		 FROM categories as c inner JOIN produit_categorie as pc ON c.id = pc.categorie  
                     WHERE pc.produit = p.id ) AS categories,
                     
        (SELECT GROUP_CONCAT(DISTINCT m.marque SEPARATOR ',')
                     FROM marques as m inner JOIN produit_marque as pm ON m.id = pm.marque  
                     WHERE pm.produit = p.id ) AS marques
        
        
        from produits as p 
        inner join produit_marque as pm on pm.produit = p.id 
        inner join marques as m on m.id = pm.marque 
        inner join produit_categorie as pc on pc.categorie = p.id 
        inner join categories as c on c.id = pc.categorie 
        inner join produit_genre as pg on pg.genre = p.id 
        inner join genre as g on g.id = pg.genre 
        where m.id = :idmarques
        group by p.id";
        
        $requete = $basedonne->prepare($sql);
        $requete -> bindParam(':idmarques', $idmarques, PDO::PARAM_INT);
        $requete->execute();    
        return $requete->fetchAll(PDO::FETCH_ASSOC);    
    }