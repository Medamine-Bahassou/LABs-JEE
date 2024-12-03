<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Produits List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            // Confirm delete
            $(".delete-link").on("click", function (e) {
                if (!confirm("Are you sure you want to delete this Produit?")) {
                    e.preventDefault();
                }
            });

            // Add hover effect to table rows
            $("tbody tr").hover(
                function () {
                    $(this).addClass('table-hover');
                },
                function () {
                    $(this).removeClass('table-hover');
                }
            );
        });
    </script>
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1>List of Produits</h1>
        <a href="${pageContext.request.contextPath}/produit/add"
           class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Add New Produit
        </a>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prix</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="produit" items="${produits}">
                        <tr>
                            <td>${produit.id}</td>
                            <td>${produit.nom}</td>
                            <td>${produit.prix}</td>
                            <td>
                                <div class="d-flex gap-2">
                                    <a href="${pageContext.request.contextPath}/produit/edit?id=${produit.id}"
                                       class="btn btn-warning btn-sm">
                                        <i class="bi bi-pencil"></i> Edit
                                    </a>
                                    <a href="${pageContext.request.contextPath}/produit/delete?id=${produit.id}"
                                       class="btn btn-danger btn-sm delete-link">
                                        <i class="bi bi-trash"></i> Delete
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>