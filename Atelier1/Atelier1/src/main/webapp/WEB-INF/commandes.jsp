<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Commandes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .table-actions {
            white-space: nowrap;
        }
    </style>
    <script>
        $(document).ready(function () {
            // Confirm delete with jQuery
            $("a.delete-link").on("click", function (e) {
                if (!confirm("Are you sure you want to delete this Commande?")) {
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">List of Commandes</h1>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Date Commande</th>
                <th>Client ID</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="commande" items="${commandes}">
                <tr>
                    <td>${commande.id}</td>
                    <td>${commande.dateCommande}</td>
                    <td>${commande.client.id}</td>
                    <td class="table-actions">
                        <a href="${pageContext.request.contextPath}/commandes/edit?id=${commande.id}"
                           class="btn btn-primary btn-sm">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                        <a href="${pageContext.request.contextPath}/commandes/delete?id=${commande.id}"
                           class="btn btn-danger btn-sm delete-link">
                            <i class="bi bi-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="mt-3">
        <a href="${pageContext.request.contextPath}/commandes/add" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Add New Commande
        </a>
    </div>
</div>
</body>
</html>