<?php

require_once './app/views/songs.view.php';
require_once './app/models/songs.model.php';
require_once './app/models/album.model.php';
require_once './app/objects/Album.php';
require_once './app/views/main.view.php';

class songs_controller
{
    private $model;
    private $view;
    private $album_model;
    private $main_view;

    public function __construct()
    {
        $this->model = new Songs_model();
        $this->view = new Songs_view();
        $this->album_model = new Album_model();
        $this->main_view = new Main_view();
    }

    public function showSongs()
    {
        if (!empty($_GET["search_input"])) {
            $songs = $this->model->getFilteredSongs($_GET["search_input"]);
            if (count($songs) == 0) {
                $this->main_view->showError("No se encontró ninguna canción.", $_GET["action"]);
                die();
            }
        } else {
            $songs = $this->model->getSongs();
        }
        $this->view->renderSongs($songs, function ($id) {
            return $this->getAlbumTitle($id);
        });
    }

    private function getAlbumTitle($id)
    {
        $album = $this->album_model->getAlbumById($id);
        return $album->getTitle();
    }

    private function getAlbumArtist($id)
    {
        $album = $this->album_model->getAlbumById($id);
        return $album->getArtist();
    }

    public function showLyric($id)
    {
        $song = $this->model->getSongById($id);
        $this->view->renderLyric($song, $this->getAlbumArtist($song->getAlbum_id()));
    }

    public function showSongsABM()
    {
        AuthHelper::verify();
        $albums = $this->album_model->getAlbums();
        $songs = $this->model->getSongs();
        $this->view->renderABM($albums, $songs);
    }

    public function addSong()
    {
        if (empty($_POST['title']) || empty($_POST['album'])) {
            $this->main_view->showError("Falta completar alguno de los campos", "administracion/songs");
            die();
        }
        $title = $_POST['title'];
        $release_date = (isset($_POST['rel-date'])) ? $_POST['rel-date'] : null;
        $lyric = (isset($_POST['lyric'])) ? $_POST['lyric'] : null;
        $album = $_POST['album'];
        $id = $this->model->addSong($title, $release_date, $album, $lyric);
        if ($id) {
            header('Location:' . BASE_URL . '/canciones');
        }
    }

    public function deleteSong()
    {
        $id = $_POST['song'];
        if ($id == "Seleccione una opcion") {
            $this->main_view->showError("No se eligió una canción para eliminar", "administracion/songs");
            die();
        }
        $this->model->deleteSong($id);
        header('Location: ' . BASE_URL . '/canciones');
    }

    public function showUpdateSong($id)
    {
        $song = $this->model->getSongById($id);
        $this->view->renderModifyForm($song);
    }

    public function modifySong()
    {
        if (empty($_POST['title']) || empty($_POST['song'])) {
            $this->main_view->showError("Falta completar alguno de los campos", "administracion/songs");
            die();
        }
        $title = $_POST['title'];
        $rel_date = ($_POST['rel-date'] !== "") ? $_POST['rel-date'] : null;
        $lyric = (isset($_POST['lyric'])) ? $_POST['lyric'] : null;
        $id = $_POST['song'];

        $this->model->updateSong($title, $rel_date, $lyric, $id);
        header("Location: " . BASE_URL . "/canciones");
    }
}
