<?php
try {
    require_once './app/config.php';
    require_once './app/objects/Album.php';
    require_once './app/controllers/main.controller.php';
    require_once './app/controllers/songs.controller.php';
    require_once './app/controllers/album.controller.php';
    require_once './app/controllers/auth.controller.php';
    define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

    $songs_controller = new songs_controller();
    $main_controller = new Main_controller();
    $album_controller = new Album_controller();
    $auth_controller = new Auth_controller();

    $auth_controller->checkSession();

    $action = 'home'; // accion por defecto
    if (!empty($_GET['action'])) {
        $action = $_GET['action'];
    }

    /* 'home' --> $main_controller->showHome();
     'Canciones' -->  $songs_controller->showSongs();
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
            if (!empty($params[1]))
                $album_controller->showAlbum($params[1]);
            else
                $album_controller->showAlbumList();
            break;

        case 'administracion':
            if (empty($params[1]))
                $main_controller->show404();
            if ($params[1] == 'albums')
                $album_controller->showAdminPanel();
            if ($params[1] == 'songs')
                $songs_controller->showSongsABM();
            break;

        case 'add':
            switch ($params[1]) {
                case 'album':
                    $album_controller->addAlbum();
                    break;

                case 'song':
                    $songs_controller->addSong();
                    break;

                default:
                    header("Location: /home");
                    break;
            }
            break;

        case 'delete':
            switch ($params[1]) {
                case 'album':
                    if (isset($_POST['album']))
                        $album_controller->deleteAlbum($_POST['album']);
                    break;
                case 'song':
                    if (isset($_POST['song']))
                        $songs_controller->deleteSong();
                    break;

                default:
                    header("Location: /home");
                    break;
            }
            break;

        case 'update':
            switch ($params[1]) {
                case 'album':
                    if (isset($_POST['album']))
                        $album_controller->updateAlbum();
                    break;
                case 'song':
                    $songs_controller->modifySong();
                    break;

                default:
                    header("Location: /home");
                    break;
            }
            break;

        case 'auth':
            $auth_controller->auth();
            break;

        case 'logout':
            $auth_controller->logout();
            break;

        case 'request':
            if (empty($_POST['type']))
                header('Location: /home');
            switch ($_POST['type']) {
                case 'get_album_card':
                    if (!empty($_POST['id']))
                        $album_controller->showAlbumCard($_POST['id']);
                    else
                        throw new Exception("No se ha proporcionado una id", 1);
                    break;
                case 'get_song_lyric':
                    if (!empty($_POST['id']))
                        $songs_controller->showLyric($_POST['id']);
                    else
                        throw new Exception("No se ha proporcionado una id", 1);
                    break;
                case 'get_login_form':
                    if (empty($_POST['logged']))
                        $auth_controller->showLoginForm();
                    else
                        $auth_controller->showConfirmationBox();
                    break;
                case 'get_modify_panel':
                    if (!empty($_POST['id']))
                        $album_controller->showModifyForm($_POST['id']);
                    else
                        throw new Exception("No se ha proporcionado una id", 1);
                    break;
                case 'get_modify_song':
                    if (!empty($_POST['id']))
                        $songs_controller->showUpdateSong($_POST['id']);
                    else
                        throw new Exception("No se ha proporcionado una id", 1);
                    break;
            }
            break;
    }
} catch (\Throwable $th) {
    echo $th;
}
