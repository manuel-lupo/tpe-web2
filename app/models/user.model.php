<?php

class User_model{
    private $db;

    function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=db_albums;charset=utf8', 'root', '');
    }

    public function getByUser($user) {
        $query = $this->db->prepare('SELECT * FROM Users WHERE name = ?');
        $query->execute([$user]);

        return $query->fetch(PDO::FETCH_OBJ);
    }
}