<?php

function DB_table_exists($db, $table){
    try{
        $db->query("SELECT 1 FROM 'db_albums'.$table");
    } catch (PDOException $e){
        return false;
    }
    return true;
}

    try {
        $dbh = new PDO("mysql:host=localhost", 'root', '');

        $dbh->exec("CREATE DATABASE `db_albums`;");
        $dbh = new PDO('mysql:host=localhost;dbname=db_albums;charset=utf8', 'root', '');
        $sql = file_get_contents('./db_albums.sql');
        $dbh->exec($sql);
    }
    catch (PDOException $e) {
        if($e->getCode() != 'HY000')//HY000 Codigo de error cuando la db ya esta creada
            die("DB ERROR: " . $e->getCode());
    }
