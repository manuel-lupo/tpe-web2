<?php

class Auth_view{
    public function renderLoginForm($error = NULL){
        require_once './template/login.phtml';
    }
}

