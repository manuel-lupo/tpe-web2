<?php
require_once './app/objects/Song.php';
class Songs_model
{
    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=' . MYSQL_HOST .';dbname=' . MYSQL_DBASE .';charset=utf8', MYSQL_USER, MYSQL_PASS);
    }

    public function getSongs()
    {
        $query = $this->db->prepare('SELECT * FROM Songs');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_CLASS, 'Song');
    }

    public function getSongsByAlbum($id)
    {
        $query = $this->db->prepare('SELECT * FROM Songs WHERE album_id = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_CLASS, 'Song');
    }

    public function getFilteredSongs($string)
    {
        $query = $this->db->prepare('SELECT * FROM Songs WHERE title LIKE ?');
        $query->execute(["%" . $string . "%"]);
        return $query->fetchAll(PDO::FETCH_CLASS, 'Song');
    }

    public function getSongById($id)
    {
        $query = $this->db->prepare('SELECT * FROM Songs WHERE id= ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_CLASS, 'Song')[0];
    }

    public function addSong($title, $release_date, $album, $lyric)
    {
        $query = $this->db->prepare('INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES (?,?,?,?)');
        $query->execute([$title, $release_date, $album, $lyric]);
        return $this->db->lastInsertId();
    }

    public function deleteSong($id)
    {
        $query = $this->db->prepare('DELETE FROM `Songs` WHERE id = ?');
        $query->execute([$id]);
    }

    public function updateSong($title, $rel_date, $lyric, $id)
    {
        $query = $this->db->prepare('UPDATE `Songs` SET `title`= ?,`rel_date`= ?,`lyrics`= ? WHERE id = ?');
        $query->execute([$title, $rel_date, $lyric, $id]);
    }
}
