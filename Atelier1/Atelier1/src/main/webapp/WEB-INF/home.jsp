<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .btn {
            margin: 10px 0;
            width: 100%;
        }
    </style>
</head>
<body class="bg-light">
<div class="container min-vh-100 d-flex justify-content-center align-items-center">
    <div class="card">
        <div class="card-header text-center">
            <h4>Main Menu</h4>
        </div>
        <div class="card-body">
            <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}/client/list" class="btn btn-primary">Client</a>
                <a href="${pageContext.request.contextPath}/commandes/list" class="btn btn-success">Commande</a>
                <a href="${pageContext.request.contextPath}/ligneDeCommande/list" class="btn btn-warning">Ligne de Commande</a>
                <a href="${pageContext.request.contextPath}/produit/list" class="btn btn-danger">Produit</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>