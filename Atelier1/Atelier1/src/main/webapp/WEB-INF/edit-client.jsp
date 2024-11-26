<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Client</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .form-control:focus {
            background-color: #e0f7fa;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">Edit Client</h1>

    <div class="card">
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/client/update">
                <input type="hidden" name="id" value="${client.id}"/>

                <div class="mb-3">
                    <label for="nom" class="form-label">Name:</label>
                    <input type="text" class="form-control" name="nom" id="nom"
                           value="${client.nom}" required/>
                </div>

                <div class="mb-3">
                    <label for="adresse" class="form-label">Address:</label>
                    <input type="text" class="form-control" name="adresse" id="adresse"
                           value="${client.adresse}" required/>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" name="email" id="email"
                           value="${client.email}" required/>
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save"></i> Save
                    </button>
                    <a href="${pageContext.request.contextPath}/client/list"
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