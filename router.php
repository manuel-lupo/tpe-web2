<?php
try {
    require_once './app/objects/Album.php';
require_once './app/controllers/main.controller.php';
define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']));

$main_controller = new Main_controller();

$action = 'home'; // accion por defecto
if (!empty( $_GET['action'])) {
    $action = $_GET['action'];
}

// 'home' --> $main_controller->showHome();

$params = explode('/', $action);

switch ($params[0]) { // en la primer posicion tengo la accion real
    case 'home':
        $main_controller->showHome();
        break;
    default: 
        $main_controller->show404();
        break;
}
} catch (\Throwable $th) {
    echo $th;
}