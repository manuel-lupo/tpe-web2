<?php
require_once './app/models/album.model.php';
require_once './app/views/album.view.php';
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
        $this->view->renderAlbum($album, $songs);
    }

    public function showAlbumList(){
        $albums = $this->album_model->getAlbums();
        $this->view->renderAlbumList($albums);
    }

    public function showAlbumCard($id){
        $album = $this->album_model->getAlbumById($id);
        $this->view->renderAlbumCard($album);
    }

    public function showAdminPanel(){
        $albums = $this->album_model->getAlbums();
        $this->view->renderAdminPanel($albums);
    }

    public function showModifyForm($album_id){
        $album = $this->album_model->getAlbumById($album_id);
        $this->view->renderModifyForm($album);
    }

}