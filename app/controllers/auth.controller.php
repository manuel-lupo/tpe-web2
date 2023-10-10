<?php
require_once './app/models/user.model.php';
require_once './app/views/auth.view.php';
require_once './app/helpers/auth.helper.php';

class Auth_controller{
    private $model;
    private $view;

    public function __construct(){
        $this->view = new Auth_view();
        $this->model = new User_model();
    }

    public function showLoginForm(){
        $this->view->renderLoginForm();

    }

    public function auth() {
        $user_name = $_POST['user'];
        $password = $_POST['password'];

        if (empty($user_name) || empty($password)) {
            $this->view->renderLoginPage('Faltan completar datos');
            return;
        }

        // busco el usuario
        $user = $this->model->getByUser($user_name);
        if ($user && password_verify($password, $user->password)) {
            // ACA LO AUTENTIQUE
            
            AuthHelper::login($user);
            var_dump($_SESSION["USER_NAME"]);
            header('Location: ' . BASE_URL);
        } else {
            $this->view->renderLoginPage('Usuario inválido');
        }
    }
    
}