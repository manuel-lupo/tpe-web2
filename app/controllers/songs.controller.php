<?php
class songs_controller {

    public function show404(){
        require_once './template/header.phtml';
        echo 'ERROR 404 NO ENCONTRADO';
        require_once './template/header.phtml';
    }
}