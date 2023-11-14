<?php

class LibrosModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET, DB_USER, DB_PASS);
    }

    function getLibros() {
        $query = $this->db->prepare("SELECT libros.*, autores.nombre as autor_nombre FROM libros JOIN autores ON libros.id_autor = autores.id_autor");
        $query->execute();
        $libros = $query->fetchAll(PDO::FETCH_OBJ);
        return $libros;
    }

    public function getLibrosXAutor($id) {
        $query = $this->db->prepare("SELECT * FROM libros WHERE id_autor = ?");
        $query->execute([$id]);
    
        $libroXAutor = $query->fetchAll(PDO::FETCH_OBJ);
    
        return $libroXAutor;
    }
    
    public function mostrarDetalleLibro($id){
        $query = $this->db->prepare("SELECT id_autor, Titulo, Saga, Genero FROM libros WHERE id_libros = ?");
        $query->execute([$id]);
    
        $libro = $query->fetch(PDO::FETCH_OBJ);
        return $libro;
    }

    public function getLibroById($id){
        $query = $this->db->prepare("SELECT * FROM libros WHERE id_libros = ?");
        $query->execute([$id]);
        $libro = $query->fetch(PDO::FETCH_ASSOC);
    
        return $libro;
    }


    public function agregarLibro($titulo, $saga, $genero, $id_autor) {
        $query = $this->db->prepare("INSERT INTO libros (Titulo, Saga, Genero, id_autor) VALUES(?,?,?,?)");
        $query->execute([$titulo, $saga, $genero, $id_autor]);
    
        return $this->db->lastInsertId();
    }

    public function eliminarLibro($id) {
        $query = $this->db->prepare("DELETE FROM libros WHERE id_libros = ?");
        $query->execute([$id]);
    }

    public function editLibro($id, $post)
{
    $query = $this->db->prepare('UPDATE  libros  SET Titulo = ?, Saga = ?, Genero = ?, id_autor = ? WHERE id_libros = ?');
    return $query->execute([$post["Titulo"], $post["Saga"], $post["Genero"], $post["id_autor"], $id]);
}
}