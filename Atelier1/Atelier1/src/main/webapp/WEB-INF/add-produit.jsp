<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Produit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $("form").on("submit", function (e) {
                if (!confirm("Are you sure you want to add this Produit?")) {
                    e.preventDefault();
                }
            });

            $("input").on("blur", function () {
                if (!$(this).val()) {
                    $(this).addClass('is-invalid');
                } else {
                    $(this).removeClass('is-invalid').addClass('is-valid');
                }
            });
        });
    </script>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Add Produit</h2>

                    <form action="${pageContext.request.contextPath}/produit/save" method="post">
                        <div class="mb-3">
                            <label for="nom" class="form-label">Nom</label>
                            <input type="text"
                                   class="form-control"
                                   id="nom"
                                   name="nom"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label for="prix" class="form-label">Prix</label>
                            <div class="input-group">
                                <span class="input-group-text">€</span>
                                <input type="number"
                                       class="form-control"
                                       id="prix"
                                       name="prix"
                                       step="0.01"
                                       min="0"
                                       required>
                            </div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a href="${pageContext.request.contextPath}/produit/list"
                               class="btn btn-secondary">Back to List</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>