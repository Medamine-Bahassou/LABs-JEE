<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Commande</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            // Highlight invalid inputs dynamically
            $("input, select").on("blur", function () {
                if (!$(this).val()) {
                    $(this).addClass('is-invalid');
                } else {
                    $(this).removeClass('is-invalid');
                }
            });

            // Add confirmation before submitting
            $("#editCommandeForm").on("submit", function (e) {
                if (!confirm("Are you sure you want to update this Commande?")) {
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">Edit Commande</h1>

    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/commandes/update"
                  method="post"
                  id="editCommandeForm">

                <input type="hidden" name="id" value="${commande.id}" />

                <div class="mb-3">
                    <label for="dateCommande" class="form-label">Date Commande:</label>
                    <input type="date"
                           class="form-control"
                           id="dateCommande"
                           name="dateCommande"
                           value="${commande.dateCommande}"
                           required/>
                    <div class="invalid-feedback">
                        Please select a date
                    </div>
                </div>

                <div class="mb-3">
                    <label for="clientId" class="form-label">Client:</label>
                    <select class="form-select"
                            id="clientId"
                            name="clientId"
                            required>
                        <option value="">Select a Client</option>
                        <c:forEach var="client" items="${clients}">
                            <option value="${client.id}"
                                ${client.id == commande.client.id ? 'selected="selected"' : ''}>
                                    ${client.nom}
                            </option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Please select a client
                    </div>
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save"></i> Update
                    </button>
                    <a href="${pageContext.request.contextPath}/commandes/list"
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