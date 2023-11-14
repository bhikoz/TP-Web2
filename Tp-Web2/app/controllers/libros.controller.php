<?php
require_once './app/views/libros.view.php';
require_once './app/models/libros.model.php';

class LibrosController {

    private $model;
    private $view;
    private $autoresModel;
    public function __construct() {
        $this->view = new LibrosView();
        $this->model = new LibrosModel();
        $this->autoresModel = new AutoresModel();
    }

    public function mostrarLibros(){
        $verify = AuthHelper::verify();
        $libros = $this->model->getLibros();
        $autores = $this->autoresModel->getAutores();
        $this->view->ShowLibros($libros, $autores, $verify);
    }

    public function showLibroXAutor($Autor_id) {
        $Libros = $this->model->getLibrosXAutor($Autor_id);
        $this->view->showLibroXAutor($Libros);
    }

    public function showDetalleLibro($Libro_id) {
        $libro = $this->model->mostrarDetalleLibro($Libro_id);
        $this->view->mostrarDetalle($libro);
    }

    public function addLibro() {
        $titulo = $_POST['Titulo'];
        $saga = $_POST['Saga'];
        $genero = $_POST['Genero'];
        $id_autor = $_POST['id_autor'];

        foreach($_POST as $item){
            if(empty($item)){
                $this->view->showError("Debe completar todos los campos");
                return;
            }
        }

        $id_libro = $this->model->agregarLibro($titulo, $saga, $genero, $id_autor);

        if ($id_libro) {
            header('Location: ' . BASE_URL . 'mostrarLibros');
        } else {
            $this->view->showError("Error al insertar el libro");
        }
    }

    function removeLibros($Libro_id) {
        $this->model->eliminarLibro($Libro_id);
        header('Location: ' . BASE_URL . 'mostrarLibros');
    }

    public function editLibro($id_libro) {
        $verify = AuthHelper::verify();

        if ($verify) {
            $titulo = $_POST['titulo'] ?? '';
            $saga = $_POST['saga'] ?? '';
            $genero = $_POST['genero'] ?? '';
            $id_autor = $_POST['id_autor'] ?? '';

            $result = $this->model->editLibro($id_libro, $_POST);

            if ($result) {
                header('Location: ' . BASE_URL . 'mostrarLibros');
            } else {
                $this->view->showError("Error al editar el libro");
            }
        } else {
            header('Location: ' . BASE_URL . 'mostrarLibros'); 
        }
    }
  
    public function formModificarLibro($id_libro) {
        $verify = AuthHelper::verify();

        if ($verify) {
            $libro = $this->model->getLibroById($id_libro);
            $autores = $this->autoresModel->getAutores();
            $this->view->mostrarFormModLibro($libro, $autores, $verify);
        } else {
            header('Location: ' . BASE_URL . 'mostrarLibros'); 
        }
    }
}