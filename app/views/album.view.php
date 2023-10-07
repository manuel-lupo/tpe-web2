<?php
require_once './app/objects/Album.php';
class Album_view{

    public function renderAlbum($album, $songs){
        require_once './template/header.phtml';
        require_once './template/album_page.phtml';
        require_once './template/footer.phtml';
    }

}