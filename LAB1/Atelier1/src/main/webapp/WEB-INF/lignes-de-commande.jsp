<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lignes De Commande</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            // Confirm delete
            $(".delete-form").on("submit", function (e) {
                if (!confirm("Are you sure you want to delete this Ligne De Commande?")) {
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
        <h1>List of Lignes De Commande</h1>
        <a href="${pageContext.request.contextPath}/ligneDeCommande/add"
           class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Add New Ligne De Commande
        </a>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Commande</th>
                        <th>Produit</th>
                        <th>Quantité</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ligne" items="${lignesDeCommande}">
                        <tr>
                            <td>${ligne.id}</td>
                            <td>Commande ID: ${ligne.commande.id}</td>
                            <td>${ligne.produit.nom}</td>
                            <td>${ligne.quantite}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/ligneDeCommande/delete?id=${ligne.id}"
                                      method="post"
                                      class="delete-form d-inline">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="id" value="${ligne.id}"/>
                                    <button type="submit" class="btn btn-danger btn-sm">
                                        <i class="bi bi-trash"></i> Delete
                                    </button>
                                </form>
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