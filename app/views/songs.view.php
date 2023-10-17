<?php
require_once './app/objects/Song.php';
require_once './app/objects/Album.php';

class Songs_view {
    public function renderSongs($songs, $titleGetter){
        $action = "songs";
        require_once './template/header.phtml';
        require_once './template/songs_page.phtml';
        require_once './template/songs_searchbar.phtml';
        require_once './template/footer.phtml';
    }
    
    public function searchSongs(){
        require_once './template/songs_searchbar.phtml';
    }

    public function renderLyric($song, $artist){
        require_once './template/song_card.phtml';
    }

    public function renderABM($albums, $songs){
        $action = "admin_songs";
        require_once './template/header.phtml';
        require_once './template/abm_songs_page.phtml';
        require_once './template/footer.phtml';
    }

    public function renderModifyForm($song){
        require_once './template/modify_song_form.phtml';
    }
}