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
        $album = $this->album_model->getAlbums();
        $song = $this->model->getSongs();
        $this->view->renderABM($album);
    }

    public function show404(){
        require_once './template/header.phtml';
        echo 'ERROR 404 NO ENCONTRADO';
        require_once './template/header.phtml';
    }
}