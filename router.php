<?php
try {
    require_once './app/objects/Album.php';
    require_once './app/controllers/main.controller.php';
    require_once './app/controllers/songs.controller.php';
    require_once './app/controllers/album.controller.php';

    define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');
    $songs_controller = new songs_controller();
    $main_controller = new Main_controller();
    $album_controller = new Album_controller();
    $action = 'home'; // accion por defecto
    if (!empty($_GET['action'])) {
        $action = $_GET['action'];
    }

    /* 'home' --> $main_controller->showHome();
    Canciones -->  $songs_controller->showSongs();
    'albums' --> $album_controller->showAlbumList();
    'albums/id' --> $album_controller->showAlbum(id);
    'administracion/albums' --> $album_controller->showAlbumAdminPanel();
    */
    $params = explode('/', $action);

switch ($params[0]) { // en la primer posicion tengo la accion real
    case 'home':
        $main_controller->showHome();
        break;
    case 'canciones':
        $songs_controller->showSongs();
        break;
    case 'albums':
        if(!empty($params[1]))
            $album_controller->showAlbum($params[1]);
        else
            $album_controller->showAlbumList();
        break;
    case 'administracion':
        if(empty($params[1]))
            $main_controller->show404();
        if($params[1] == 'albums')
            $main_controller->show404();
        if($params[1] == 'songs')
            $main_controller->show404();
        break;
    case 'request':
        if(empty($_POST['type']))
            header('Location: /home');
        switch ($_POST['type']) {
            case 'get_album_card':
                if(!empty($_POST['id']))
                    $album_controller->showAlbumCard($_POST['id']);
                else
                    throw new Exception("No se ha proporcionado una id", 1);  
                break;
        }
        break;
    default: 
        $main_controller->show404();
        break;
}
} catch (\Throwable $th) {
    echo $th;
}
