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
            $this->view->renderMain($albums);
        }

        public function showError($error, $location = NULL){
            $this->view->showError($error, $location);
        }
    }