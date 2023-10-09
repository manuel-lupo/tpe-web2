<?php
require_once './app/objects/Song.php';
require_once './app/objects/Album.php';

class Songs_view {
    public function renderSongs($songs, $titleGetter){
        require_once './template/header.phtml';
        require_once './template/songs_page.phtml';
        require_once './template/songs_searchbar.phtml';
        require_once './template/footer.phtml';
    }
    public function searchSongs(){
        require_once './template/songs_searchbar.phtml';
    }
}