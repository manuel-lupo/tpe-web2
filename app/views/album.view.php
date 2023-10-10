<?php
require_once './app/objects/Album.php';
class Album_view{

    public function renderAlbum($album, $songs){
        require_once './template/header.phtml';
        require_once './template/album_page.phtml';
        require_once './template/footer.phtml';
    }

    public function renderAlbumList($albums){
        $action = 'albums';
        require_once './template/header.phtml';
        require_once './template/albums_page.phtml';
        require_once './template/footer.phtml';
    }

    public function renderAlbumCard($album){
        require_once './template/album_card.phtml';
    }

    public function renderAdminPanel(){
        require_once './template/header.phtml';
        require_once './template/albums_admin.phtml';
        require_once './template/footer.phtml';
    }
}