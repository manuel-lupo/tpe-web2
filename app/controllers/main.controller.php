<?php
    require_once './app/views/main.view.php';
    require_once "./app/models/album.model.php";
    
    class Main_controller{
        private $view;
        private $model;

        public function __construct(){
            $this->view = new Main_view();
            $this->model = new Album_model();
        }

        public function showHome(){
            $albums = $this->model->getAlbums();
            $this->view->renderAlbums($albums);
        }

        public function show404(){
            require_once './template/header.phtml';
            echo 'ERROR 404 NO ENCONTRADO';
            require_once './template/header.phtml';
        }
    }