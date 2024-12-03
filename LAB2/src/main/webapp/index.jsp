<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Navigation Menu Card</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .card {
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .nav-button {
      width: 100%;
      margin: 5px 0;
    }
    .main-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: #f8f9fa;
    }
  </style>
</head>
<body>
<div class="main-container">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6 col-lg-4">
        <div class="card">
          <div class="card-header text-center bg-primary text-white">
            <h4 class="mb-0">Menu</h4>
          </div>
          <div class="card-body">
            <div class="d-grid gap-2">
              <a href="<%=contextPath%>/client/listClients.xhtml" class="btn btn-success nav-button">
                <i class="bi bi-code-slash"></i> Client
              </a>
              <a href="<%=contextPath%>/commande/listCommande.xhtml" class="btn btn-info nav-button text-white">
                <i class="bi bi-info-circle"></i> Commande
              </a>
              <a href="<%=contextPath%>/panier/listPaniers.xhtml" class="btn btn-warning nav-button">
                <i class="bi bi-envelope"></i> Panier
              </a>
              <a href="<%=contextPath%>/produit/listProduits.xhtml" class="btn btn-danger nav-button">
                <i class="bi bi-gear"></i> Produit
              </a>
            </div>
          </div>
          <div class="card-footer text-center">
            <small class="text-muted">Select an option to navigate</small>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>