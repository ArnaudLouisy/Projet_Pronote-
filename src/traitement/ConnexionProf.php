<?php
session_start();
require_once '../bdd/BDD.php';
$bdd = new Bdd();

$req = $bdd->getBdd()->prepare('SELECT * FROM prof WHERE mail = :mail AND mot_de_passe = :mot_de_passe');
$req->execute(array(
    'mail' => $_POST['mail'],
    'mot_de_passe' => $_POST['mot_de_passe'],
));

$res = $req->fetch();

if ($res) {
    $_SESSION['mail'] = $res['mail'];
    $_SESSION['id_prof'] = $res['id_prof'];

    header('Location:../../index.php');
}
else{
    header('Location: connexionProf.html');
}
