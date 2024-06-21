<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrendHub</title>
    <!-- Link to Bootstrap CSS from CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <!-- Custom styles -->
    <style>
        /* Custom navbar background color */
        .navbar-custom {
            background-color: #81C784; /* Dark green background */
            color: white; /* White text color */
        }

        /* Custom toggle button color */
        .navbar-custom .navbar-toggler-icon {
            background-color: white; /* White toggle button color */
        }

        /* Custom active link color */
        .navbar-custom .nav-link.active {
            color: white; /* White active link color */
        }
        .navbar-brand {
            color: white;
        }
        .nav-item {
            color: white;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="/finalodev/">TrendHub</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/finalodev/">Home</a>
                    </li>
                    
                    <!-- Add more navigation items here as needed -->
                </ul>
                <form id="searchForm" class="d-flex" action="/finalodev/ara" method="get">
                    <input id="searchInput" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="aranan">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Your content here -->

    <!-- Bootstrap JS and dependencies if needed -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
