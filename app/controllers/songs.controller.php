<?php

require_once './app/views/songs.view.php';
require_once './app/models/songs.model.php';

class songs_controller {
    private $model;
    private $view;

    public function __construct(){
        $this->model = new Songs_model();
        $this->view = new Songs_view();
    }

    public function searchSongs(){
        $this->view->searchSongs();
        $this->model->getSongsByAlbum($id);
    }

    public function showSongs(){
        $songs = $this->model->getSongs();
        $this->view->renderSongs($songs);
    }

    public function show404(){
        require_once './template/header.phtml';
        echo 'ERROR 404 NO ENCONTRADO';
        require_once './template/header.phtml';
    }
}