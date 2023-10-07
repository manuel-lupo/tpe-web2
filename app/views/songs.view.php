<?php
require_once './app/objects/Song.php';
class Songs_view {
    public function renderSongs($songs){
        require_once './template/header.phtml';
        foreach ($songs as $song){
            echo "<p>" . $song->getTitle() . " | " . $song->getRel_date() . "</p>";        }
        require_once './template/footer.phtml';
    }
}