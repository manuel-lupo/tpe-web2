<?php
require_once './app/objects/Song.php';
class Songs_model{
    private $db;

    public function __construct(){
        $this->db = new PDO('mysql:host=localhost;dbname=db_albums;charset=utf8', 'root', '');
    }

    public function getSongs(){
        $query = $this->db->prepare('SELECT * FROM songs');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_CLASS, 'Song');
    }

    public function getSongsByAlbum($id) {
        $query = $this->db->prepare('SELECT * FROM songs WHERE album_id = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_CLASS, 'Song');
    }
}