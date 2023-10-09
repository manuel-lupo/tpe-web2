<?php
require_once './app/models/user.model.php';
require_once './app/views/auth.view.php';

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
}