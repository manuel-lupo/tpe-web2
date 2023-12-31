<?php
require_once './app/models/album.model.php';
require_once './app/views/album.view.php';
require_once './app/views/main.view.php';
class Album_controller
{

    private $view;
    private $album_model;
    private $main_view;
    private $song_model;

    public function __construct()
    {
        $this->view = new Album_view();
        $this->album_model = new Album_model();
        $this->song_model = new Songs_model();
        $this->main_view = new Main_view();
    }

    public function showAlbum($id)
    {
        $album = $this->album_model->getAlbumById($id);
        $songs = $this->song_model->getSongsByAlbum($id);
        $this->view->renderAlbum($album, $songs);
    }

    public function showAlbumList()
    {
        if (!empty($_GET["search_input"])) {
            $albums = $this->album_model->getFilteredAlbums($_GET['search_input']);
            if (count($albums) == 0) {
                $this->main_view->showError('No se han encontrado resultados');
                die();
            }
        } else
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
        if ($this->album_model->deleteAlbum($id))
            header("Location: " . BASE_URL . "/albums");
        else {
            $this->main_view->showError("No se pudo eliminar el album, debe eliminar todas sus canciones primero", "administracion/albums");
        }
    }

    public function addAlbum()
    {
        $params = $this->getAlbumFromPost();
        $id = $this->album_model->createAlbum($params[0]);
        if ($id)
            header("Location: " . BASE_URL . "/albums/$id");
        else
            $this->main_view->showError("No se pudo añadir el album, intente de nuevo", "administracion/albums");
    }

    public function updateAlbum()
    {
        if (empty($_POST['title']) and empty($_POST['rel_date']) and empty($_POST['rating'])) {
            $this->main_view->showError("Falto ingresar algun dato", "administracion/albums");
            die();
        }
        $params = $this->getAlbumFromPost();
        if ($params and $this->album_model->updateAlbum($_POST['album'], $params[0] , $params[1]))
            header("Location: " . BASE_URL . "/albums/" . $_POST['album']);
        else
            $this->main_view->showError("Fallo la actualizacion del album", "administracion/albums");
    }

    private function getAlbumFromPost()
    {
        $flag = true;
        if ((empty($_POST['title'])) and (empty($_POST['artist'])) and (empty($_POST['rating'])))
            $this->main_view->showError('Falto ingresar algun dato', 'administracion/albums');

        if ($_FILES['img']['size'] == 0) {
            if (!empty($_POST['last_img_url'])) {
                $img_url = $_POST['last_img_url'];
                $flag = false;
                //si esta seteada la ultima imagen pero no se subio imagen usamos la ultima subida
            } else
                $img_url = null;
            //Si esta vacio es porque no se subio imagen, si no se subio una imagen incorrecta
        }
        if ($_FILES['img']['type'] == "image/jpg" || $_FILES['img']['type'] == "image/jpeg" || $_FILES['img']['type'] == "image/png") {
            $img_url = $_FILES['img']['tmp_name'];
        } else {
            if($flag){
                $this->main_view->showError('Error al subir la imagen, archivo no soportado', 'administracion/albums');
                die();
            }
        }
        $album = new Album();
        $album->setValues($_POST['title'], $_POST['rel_date'], $_POST['review'], $_POST['artist'], $_POST['genre'], $_POST['rating'], $img_url);
        return [$album, $flag];
    }
}
