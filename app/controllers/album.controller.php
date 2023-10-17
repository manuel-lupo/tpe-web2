<?php
require_once './app/models/album.model.php';
require_once './app/views/album.view.php';
class Album_controller
{

    private $view;
    private $album_model;

    private $song_model;

    public function __construct()
    {
        $this->view = new Album_view();
        $this->album_model = new Album_model();
        $this->song_model = new Songs_model();
    }

    public function showAlbum($id)
    {
        $album = $this->album_model->getAlbumById($id);
        $songs = $this->song_model->getSongsByAlbum($id);
        $this->view->renderAlbum($album, $songs);
    }

    public function showAlbumList()
    {
        if(!empty($_GET["search_input"]))
            $albums = $this->album_model->getFilteredAlbums($_GET['search_input']);
        else
            $albums = $this->album_model->getAlbums();
        $this->view->renderAlbumList($albums);
    }

    public function showAlbumCard($id)
    {
        $album = $this->album_model->getAlbumById($id);
        $this->view->renderAlbumCard($album);
    }

    public function showAdminPanel()
    {
        AuthHelper::verify();
        $albums = $this->album_model->getAlbums();
        $this->view->renderAdminPanel($albums);
    }

    public function showModifyForm($album_id)
    {
        $album = $this->album_model->getAlbumById($album_id);
        $this->view->renderModifyForm($album);
    }

    public function deleteAlbum($id)
    {
        if($this->album_model->deleteAlbum($id))
            header("Location: " . BASE_URL . "/albums");
        else{
            //$main_view->showError("No se pudo eliminar el album, debe eliminar todas sus canciones primero")
        }
    }

    public function addAlbum()
    {
        $album = $this->getAlbumFromPost();
        $this->album_model->createAlbum($album);
        header("Location: " . BASE_URL . "/albums");
    }

    public function updateAlbum()
    {
        $album = $this->getAlbumFromPost();
        $this->album_model->updateAlbum($_POST['album'], $album);
        header("Location: " . BASE_URL . "/albums");
    }

    private function getAlbumFromPost()
    {
        if ((isset($_POST['title'])) and (isset($_POST['rel_date'])) and (isset($_POST['review'])) and (isset($_POST['artist'])) and (isset($_POST['genre'])) and (isset($_POST['rating']))) {
            $album = new Album();
            $album->setValues($_POST['title'], $_POST['rel_date'], $_POST['review'], $_POST['artist'], $_POST['genre'], $_POST['rating']);
            return $album;
        } else
            die("Falto ingresar algun dato");
    }
}
