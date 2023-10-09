<?php
require_once './app/objects/Album.php';
class Album_model{
    private $db;

    public function __construct(){
        $this->db = new PDO('mysql:host=localhost;dbname=db_albums;charset=utf8', 'root', '');
    }

    public function getAlbums(){
        $query = $this->db->prepare('SELECT * FROM Albums');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_CLASS, 'Album');
    }

    public function getAlbumById($id){
        $query = $this->db->prepare('SELECT * FROM Albums WHERE id = ?');
        $query->setFetchMode(PDO::FETCH_CLASS, 'Album');
        $query->execute([$id]);
        return $query->fetch();
    }

    public function deleteAlbum($id){
        $query= $this->db->prepare('DELETE FROM Albums WHERE id = ?');
        $query->execute([$id]);
    }

}