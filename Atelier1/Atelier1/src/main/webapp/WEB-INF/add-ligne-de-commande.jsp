<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Ligne De Commande</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $("form").on("submit", function (e) {
                if (!confirm("Are you sure you want to add this Ligne De Commande?")) {
                    e.preventDefault();
                }
            });

            $("input, select").on("blur", function () {
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
                    <h2 class="card-title text-center mb-4">Add Ligne De Commande</h2>

                    <form action="${pageContext.request.contextPath}/ligneDeCommande/save" method="post">
                        <div class="mb-3">
                            <label for="commandeId" class="form-label">Commande</label>
                            <select class="form-select"
                                    id="commandeId"
                                    name="commandeId"
                                    required>
                                <c:forEach var="commande" items="${commandes}">
                                    <option value="${commande.id}">Commande ID: ${commande.id}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="produitId" class="form-label">Produit</label>
                            <select class="form-select"
                                    id="produitId"
                                    name="produitId"
                                    required>
                                <c:forEach var="produit" items="${produits}">
                                    <option value="${produit.id}">${produit.nom}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="quantite" class="form-label">Quantité</label>
                            <input type="number"
                                   class="form-control"
                                   id="quantite"
                                   name="quantite"
                                   min="1"
                                   required>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a href="${pageContext.request.contextPath}/ligneDeCommande/list"
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