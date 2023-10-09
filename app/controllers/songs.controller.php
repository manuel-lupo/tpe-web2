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

    public function searchSongs(){
        $this->view->searchSongs();
        $this->model->getSongsByAlbum($id);
    }

    public function showSongs(){
        $songs = $this->model->getSongs();
        $this->view->renderSongs($songs, function($id){
            return $this->getAlbumTitle($id);
        });
    }

    private function getAlbumTitle($id) {
        $album = $this->album_model->getAlbumById($id);
        return $album->getTitle();
    }

    public function show404(){
        require_once './template/header.phtml';
        echo 'ERROR 404 NO ENCONTRADO';
        require_once './template/header.phtml';
    }
}