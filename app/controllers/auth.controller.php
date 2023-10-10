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
        $user = $_POST['user'];
        $password = $_POST['password'];

        if (empty($user) || empty($password)) {
            $this->view->renderLoginPage('Faltan completar datos');
            return;
        }

        // busco el usuario
        $user = $this->model->getByUser($user);
        if ($user && password_verify($password, $user->password)) {
            // ACA LO AUTENTIQUE
            
            AuthHelper::login($user);
            
            header('Location: ' . BASE_URL);
        } else {
            $this->view->renderLoginPage('Usuario inválido');
        }
    }
    
}