<?php

require_once './app/views/songs.view.php';
require_once './app/models/songs.model.php';

class songs_controller {
    private $view;
    private $model;

    public function __construct(){
        $this->view = new Songs_view();
        $this->model = new Songs_model();
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