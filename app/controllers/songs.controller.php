<?php

require_once './app/views/songs.view.php';
require_once './app/models/songs.model.php';
require_once './app/models/album.model.php';
require_once './app/objects/Album.php';

class songs_controller {
    private $model;
    private $view;
    private $album_model;

    public function __construct(){
        $this->model = new Songs_model();
        $this->view = new Songs_view();
        $this->album_model = new Album_model();
    }

    public function showSongs(){
        $songs = $this->model->getSongs();
        $this->view->renderSongs($songs, function($id){
            return $this->getAlbumTitle($id);
        });
    }
    
    public function searchSongs(){
        $this->model->getSongsByAlbum($id);
        $this->view->searchSongs();
    }

    private function getAlbumTitle($id) {
        $album = $this->album_model->getAlbumById($id);
        return $album->getTitle();
    }

    private function getAlbumArtist($id) {
        $album = $this->album_model->getAlbumById($id);
        return $album->getArtist();
    }

    public function showLyric($id){
        $song = $this->model->getSongById($id);
        $this->view->renderLyric($song, $this->getAlbumArtist($song->getAlbum_id()));
    }

    public function showSongsABM(){
        $albums = $this->album_model->getAlbums();
        $songs = $this->model->getSongs();
        $this->view->renderABM($albums, $songs);
    }

    public function addSong(){
        $title = $_POST['title'];
        $release_date = $_POST['release_date'];
        $album = $_POST['album'];
        $lyric = $_POST['lyric'];
        //if (empty($title) || empty($release_date) || empty($album)) {
          //  $this->view->showError("Debe completar todos los campos"); //esto igual se tiene que cambiar y hacer el view showError
            //return;
        //}
        $id = $this->model->addSong($title, $release_date, $album, $lyric);
        if ($id) {
            header('Location:' . BASE_URL . '/canciones');
        } //else {
            //$this->view->showError("Error al insertar la tarea"); //esto igual se tiene que cambiar y hacer el view showError
        //}
    }

    public function deleteSong(){
        $id = $_POST['song'];
        $this->model->deleteSong($id);
        //hacer un chequeo de si quieres borrar la cancion
        header('Location: ' . BASE_URL . '/canciones');
    }

    public function updateSong($id){
        $song = $this->model->getSongById($id);
        $this->view->renderModifyForm($song);
    }

    public function show404(){
        require_once './template/header.phtml';
        echo 'ERROR 404 NO ENCONTRADO'; //showError();
        require_once './template/header.phtml';
    }
}