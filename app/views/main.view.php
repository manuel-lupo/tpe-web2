<?php
class Main_view{
    public function renderAlbums($albums){
        require_once './template/header.phtml';
        require_once './template/main_page_cards.phtml';
        require_once './template/main_page_searchbar.phtml';
        require_once './template/footer.phtml';
    }
}