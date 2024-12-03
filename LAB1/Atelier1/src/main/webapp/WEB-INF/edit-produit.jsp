<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Produit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            // Highlight invalid inputs dynamically
            $("input").on("blur", function () {
                if (!$(this).val()) {
                    $(this).addClass('is-invalid');
                } else {
                    $(this).removeClass('is-invalid');
                }
            });

            // Add confirmation before submitting
            $("#editProduitForm").on("submit", function (e) {
                if (!confirm("Are you sure you want to update this Produit?")) {
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">Edit Produit</h1>

    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/produit/update"
                  method="post"
                  id="editProduitForm">

                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="id" value="${produit.id}"/>

                <div class="mb-3">
                    <label for="nom" class="form-label">Nom:</label>
                    <input type="text"
                           class="form-control"
                           id="nom"
                           name="nom"
                           value="${produit.nom}"
                           required/>
                    <div class="invalid-feedback">
                        Please enter a name
                    </div>
                </div>

                <div class="mb-3">
                    <label for="prix" class="form-label">Prix:</label>
                    <input type="number"
                           class="form-control"
                           id="prix"
                           name="prix"
                           step="0.01"
                           value="${produit.prix}"
                           required/>
                    <div class="invalid-feedback">
                        Please enter a price
                    </div>
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save"></i> Update
                    </button>
                    <a href="${pageContext.request.contextPath}/produit/list"
                       class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Back to List
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>