<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReservEats - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #1a1d28;
            --secondary: #c1272d;
            --accent: #f8f8f8;
            --text: #333;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
        }

        /* Admin Panel Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        .admin-container {

            grid-template-columns: 240px 1fr;
            min-height: 100vh;
            background: #f5f6fa;
        }

        .admin-sidebar {
            background: var(--primary);
            color: white;
            padding: 1.5rem;
            position: fixed;
            width: 240px;
            height: 100%;
        }

        .admin-brand {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 2rem;
        }

        .nav-menu {
            list-style: none;
            padding: 0;
        }

        .nav-item {
            margin: 0.5rem 0;
        }

        .nav-link {
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            padding: 0.75rem 1rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: all 0.2s;
        }

        .nav-link.active,
        .nav-link:hover {
            background: rgba(255,255,255,0.1);
            color: white;
        }

        .admin-main {
            padding: 2rem;
            margin-left: 240px;
        }

        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        /* Button Styles */
        .btn-primary {
            background: var(--secondary);
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .btn-secondary {
            background: var(--accent);
            color: var(--text);
            border: 1px solid #ddd;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            cursor: pointer;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            margin: 0.5rem 0;
        }

        .data-table {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background: var(--accent);
            font-weight: 600;
            cursor: pointer;
        }

        .badge {
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.85rem;
        }

        .badge-success {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn-icon {
            padding: 0.5rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-edit {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }

        .btn-delete {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            width: 90%;
            max-width: 600px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin: 1rem 0;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-top: 0.5rem;
        }

        @media (max-width: 768px) {
            .admin-container {
                grid-template-columns: 1fr;
            }

            .admin-sidebar {
                position: static;
                width: 100%;
                height: auto;
            }

            .admin-main {
                margin-left: 0;
            }

            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>
<div class="admin-container">
    <!-- Sidebar -->
    <nav class="admin-sidebar">
        <div class="admin-brand">ReservEats Admin</div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <i class="fas fa-tachometer-alt"></i>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-utensils"></i>
                    Restaurants
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-users"></i>
                    Users
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-calendar-check"></i>
                    Reservations
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-cog"></i>
                    Settings
                </a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="admin-main">
        <div class="admin-header">
            <h1>Dashboard Overview</h1>
            <div class="admin-profile">
                <i class="fas fa-user-circle fa-2x"></i>
            </div>
        </div>

        <!-- Statistics Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-title">Total Restaurants</div>
                <div class="stat-value">1,234</div>
                <div class="stat-trend success">
                    <i class="fas fa-arrow-up"></i> 12% from last month
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Active Users</div>
                <div class="stat-value">5,678</div>
                <div class="stat-trend warning">
                    <i class="fas fa-arrow-down"></i> 3% from last week
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Total Reservations</div>
                <div class="stat-value">9,876</div>
                <div class="stat-trend success">
                    <i class="fas fa-arrow-up"></i> 8% today
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Revenue</div>
                <div class="stat-value">$23,456</div>
                <div class="stat-trend success">
                    <i class="fas fa-arrow-up"></i> 15% this month
                </div>
            </div>
        </div>

        <!-- Reservations Table -->
        <div class="data-table">
            <div class="table-header">
                <h3>Recent Reservations</h3>
                <button class="btn-primary" onclick="showModal('exportModal')">
                    <i class="fas fa-download"></i> Export
                </button>
            </div>

            <table id="reservationsTable">
                <thead>
                <tr>
                    <th>Restaurant</th>
                    <th>User</th>
                    <th>Date</th>
                    <th>Party Size</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>La Maison Gourmet</td>
                    <td>john@example.com</td>
                    <td>2024-03-20 19:30</td>
                    <td>4</td>
                    <td><span class="badge badge-success">Confirmed</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-icon btn-edit">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn-icon btn-delete">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Restaurant Management -->
        <div class="data-table" style="margin-top: 2rem;">
            <div class="table-header">
                <h3>Restaurant Listings</h3>
                <button class="btn-primary" onclick="showModal('addRestaurantModal')">
                    <i class="fas fa-plus"></i> Add Restaurant
                </button>
            </div>

            <table id="restaurantsTable">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Cuisine</th>
                    <th>Rating</th>
                    <th>Status</th>
                    <th>Reservations</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Sample Restaurant</td>
                    <td>Italian</td>
                    <td>4.5</td>
                    <td>Active</td>
                    <td>25</td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-icon btn-edit">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn-icon btn-delete">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </main>
</div>

<!-- Modals -->
<div class="modal" id="addRestaurantModal">
    <div class="modal-content">
        <h2>Add New Restaurant</h2>
        <form class="form-grid" onsubmit="event.preventDefault()">
            <div class="form-group">
                <label>Restaurant Name</label>
                <input type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Cuisine Type</label>
                <select class="form-control" required>
                    <option>Italian</option>
                    <option>French</option>
                    <option>Japanese</option>
                </select>
            </div>
            <div class="form-group">
                <label>Location</label>
                <input type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Capacity</label>
                <input type="number" class="form-control" required>
            </div>
            <div class="action-buttons">
                <button type="button" class="btn-secondary" onclick="closeModal()">Cancel</button>
                <button type="submit" class="btn-primary">Save Restaurant</button>
            </div>
        </form>
    </div>
</div>

<div class="modal" id="exportModal">
    <div class="modal-content">
        <h2>Export Data</h2>
        <form onsubmit="event.preventDefault()">
            <div class="form-group">
                <label>Select Format:</label>
                <select class="form-control">
                    <option>CSV</option>
                    <option>Excel</option>
                    <option>PDF</option>
                </select>
            </div>
            <div class="action-buttons">
                <button type="button" class="btn-secondary" onclick="closeModal()">Cancel</button>
                <button type="submit" class="btn-primary">Export</button>
            </div>
        </form>
    </div>
</div>

<script>
    // Authentication check
    (function() {
        if(sessionStorage.getItem('authenticated') !== 'true') {
            window.location.href = 'admin_page.jsp';
        }
    })();

    // Add logout functionality
    function logout() {
        sessionStorage.removeItem('authenticated');
        window.location.href = 'admin_page.jsp';
    }

    // Modal Handling
    function showModal(modalId) {
        document.getElementById(modalId).style.display = 'flex';
    }

    function closeModal() {
        document.querySelectorAll('.modal').forEach(modal => {
            modal.style.display = 'none';
        });
    }

    // Table Sorting
    document.querySelectorAll('th').forEach(header => {
        header.addEventListener('click', () => {
            const table = header.closest('table');
            const tbody = table.querySelector('tbody');
            const rows = Array.from(tbody.querySelectorAll('tr'));
            const index = Array.from(header.parentElement.children).indexOf(header);

            rows.sort((a, b) => {
                const aVal = a.children[index].textContent;
                const bVal = b.children[index].textContent;
                return aVal.localeCompare(bVal);
            });

            rows.forEach(row => tbody.appendChild(row));
        });
    });

    // Close modals on outside click
    window.onclick = function(event) {
        if(event.target.classList.contains('modal')) {
            closeModal();
        }
    }
</script>
</body>
</html>