<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Commande</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#addCommandeForm").on("submit", function (e) {
                if (!confirm("Are you sure you want to add this Commande?")) {
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
                    <h2 class="card-title text-center mb-4">Add Commande</h2>

                    <form action="${pageContext.request.contextPath}/commandes/save"
                          method="post"
                          id="addCommandeForm">

                        <div class="mb-3">
                            <label for="dateCommande" class="form-label">Date Commande</label>
                            <input type="date"
                                   class="form-control"
                                   id="dateCommande"
                                   name="dateCommande"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label for="clientId" class="form-label">Client</label>
                            <select class="form-select"
                                    id="clientId"
                                    name="clientId"
                                    required>
                                <option value="">Select a Client</option>
                                <c:forEach var="client" items="${clients}">
                                    <option value="${client.id}">${client.nom}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a href="${pageContext.request.contextPath}/commandes/list"
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