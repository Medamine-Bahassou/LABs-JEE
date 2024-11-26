<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Client</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(document).ready(function() {
      $('form').on('submit', function(e) {
        const email = $('#email').val();
        if (!email.includes('@')) {
          alert('Please enter a valid email.');
          e.preventDefault();
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
          <h2 class="card-title text-center mb-4">Add Client</h2>

          <form method="post" action="${pageContext.request.contextPath}/client/save">
            <div class="mb-3">
              <label for="nom" class="form-label">Name</label>
              <input type="text" class="form-control" name="nom" id="nom" required>
            </div>

            <div class="mb-3">
              <label for="adresse" class="form-label">Address</label>
              <input type="text" class="form-control" name="adresse" id="adresse" required>
            </div>

            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" name="email" id="email" required>
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary">Save</button>
              <a href="${pageContext.request.contextPath}/client/list"
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