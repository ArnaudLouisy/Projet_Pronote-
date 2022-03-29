<?php
session_start();
if (isset($_SESSION['mail'])){
    header('Location: accueilCo.php');
}else {

    header('Location: AccueilNc.php');

}
