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

    public function updateAlbum($id , $album){
        $query= $this->db->prepare('UPDATE `Albums` SET `title`= ?,`rel_date`=?,`review`=?,`artist`=?,`genre`=?,`rating`=? WHERE id = ?');
        $query->execute([$album->getTitle() , $album->getRel_date(), $album->getReview(), $album->getArtist(), $album->getGenre(), $album->getRating() , $id]);
    }

    
    public function createAlbum($album){
        $query = $this->db->prepare("INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES (?,?,?,?,?,?)");
        $query->execute([$album->getTitle() , $album->getRel_date(), $album->getReview(), $album->getArtist(), $album->getGenre(), $album->getRating()]);
    }
}