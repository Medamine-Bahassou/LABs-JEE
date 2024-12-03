<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Clients List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .table-actions {
            white-space: nowrap;
        }
    </style>
    <script>
        $(document).ready(function() {
            // Confirm delete with jQuery
            $('a.delete-link').on('click', function(e) {
                if (!confirm('Are you sure you want to delete this client?')) {
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">List of Clients</h1>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="client" items="${clients}">
                <tr>
                    <td>${client.id}</td>
                    <td>${client.nom}</td>
                    <td>${client.adresse}</td>
                    <td>${client.email}</td>
                    <td class="table-actions">
                        <a href="${pageContext.request.contextPath}/client/edit?id=${client.id}"
                           class="btn btn-primary btn-sm">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                        <a href="${pageContext.request.contextPath}/client/delete?id=${client.id}"
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
        <a href="${pageContext.request.contextPath}/client/add" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Add New Client
        </a>
    </div>
</div>
</body>
</html>