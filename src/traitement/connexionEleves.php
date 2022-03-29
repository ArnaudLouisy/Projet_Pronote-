<?php
session_start();
require_once '../bdd/BDD.php';
$bdd = new Bdd();

$req = $bdd->getBdd()->prepare('SELECT * FROM eleves WHERE mail = :mail AND mot_de_passe = :mot_de_passe');
$req->execute(array(
    'mail' => $_POST['mail'],
    'mot_de_passe' => $_POST['mot_de_passe'],
));

$res = $req->fetch();

if ($res) {
    $_SESSION['mail'] = $res['mail'];
    $_SESSION['id_eleves'] = $res['id_eleves'];

    header('Location:../../index.html');
}
else{
    header('Location: connexionEleves.html');
}

