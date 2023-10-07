<?php
class Main_view{
    public function renderMain($albums){
        require_once './template/header.phtml';
        require_once './template/main_page_cards.phtml';
        require_once './template/main_page_searchbar.phtml';
        require_once './template/footer.phtml';
    }

    public function render404(){
        require_once './template/header.phtml';
        echo 'ERROR 404 NOT FOUND';
        require_once './template/footer.phtml';
    }
}