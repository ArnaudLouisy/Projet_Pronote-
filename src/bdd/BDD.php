<?php

class BDD
{
    private $bdd;

    public function __construct()
    {
        $this->bdd = new PDO('mysql:host=localhost;dbname=aly_pronote;charset=utf8', 'aly_pronote', 'arnaud');

    }

    /**
     * @return PDO
     */
    public function getBdd()
    {
        return $this->bdd;
    }

}