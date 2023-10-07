<?php
require_once './app/models/album.model.php';
require_once './app/views/main.view.php';
class Album_controller{

    private $view;
    private $album_model;

    private $song_model;

    public function __construct(){
        $this->view = new Album_view();
        $this->album_model = new Album_model();
        $this->song_model = new Songs_model();
    }

    public function showAlbum($id){
        $album = $this->album_model->getAlbumById($id);
        $songs = $this->song_model->getSongsByAlbum($id);
    }

}