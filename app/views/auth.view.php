<?php

class Auth_view{
    public function renderLoginForm(){
        require_once './template/login.phtml';
    }

    public function renderLoginPage($error = null){
        require_once './template/header.phtml';
        require_once './template/login.phtml';
        require_once './template/footer.phtml';
    }
}

