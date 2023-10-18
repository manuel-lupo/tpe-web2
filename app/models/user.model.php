<?php

class User_model{
    private $db;

    function __construct() {
        $this->db = new PDO('mysql:host=' . MYSQL_HOST .';dbname=' . MYSQL_DBASE .';charset=utf8', MYSQL_USER, MYSQL_PASS);
    }

    public function getByUser($user) {
        $query = $this->db->prepare('SELECT * FROM Users WHERE name = ?');
        $query->execute([$user]);

        return $query->fetch(PDO::FETCH_OBJ);
    }
}