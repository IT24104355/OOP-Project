<!-- my-reservations.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReservEats - My Reservations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Base styles from previous pages */
        :root {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("resources/images/pic.jpg");
            background-size: cover;
            background-position: center;
            color: white;

            --primary: #2a2a2a;
            --secondary: #c1272d;
            --accent: #f8f8f8;
            --text: #333;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
        }

        /* Reservations Specific Styles */
        .reservations-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .reservations-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .status-filters {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .status-filter {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s;
            border: 1px solid #ddd;
        }

        .status-filter.active {
            background: var(--secondary);
            color: white;
            border-color: var(--secondary);
        }

        .reservation-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
            position: relative;
        }

        .reservation-status {
            position: absolute;
            top: 1rem;
            right: 1rem;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.85rem;
        }

        .status-confirmed {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }

        .status-completed {
            background: rgba(42, 42, 42, 0.1);
            color: var(--primary);
        }

        .status-cancelled {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }

        .reservation-header {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .restaurant-image {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            object-fit: cover;
        }

        .reservation-details {
            flex: 1;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            color : black;
        }

        .detail-item strong {
            display: block;
            color: var(--primary);
            margin-bottom: 0.25rem;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .btn-icon {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .empty-state {
            text-align: center;
            padding: 4rem;
            background: white;
            border-radius: 12px;
        }

        /* Modification Modal */
        .modify-modal {
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

        .modify-content {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            width: 90%;
            max-width: 500px;
        }

        @media (max-width: 768px) {
            .reservation-header {
                flex-direction: column;
            }

            .restaurant-image {
                width: 100%;
                height: 200px;
            }

            .status-filters {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
<!-- Header (Same as Homepage) -->

<main class="reservations-container">
    <div class="reservations-header">
        <h1>My Reservations</h1>
        <div class="search-box">
            <input type="text" placeholder="Search reservations..." class="form-control">
        </div>
    </div>

    <div class="status-filters">
        <div class="status-filter active" data-status="all">All</div>
        <div class="status-filter" data-status="upcoming">Upcoming</div>
        <div class="status-filter" data-status="completed">Completed</div>
        <div class="status-filter" data-status="cancelled">Cancelled</div>
    </div>

    <!-- Reservation Cards -->
    <div class="reservations-list">

        <!-- Active Reservation -->
        <div class="reservation-card">
            <span class="reservation-status status-confirmed">Confirmed</span>
            <div class="reservation-header">
                <img src="resources/images/rest2.jpg" alt="Restaurant" class="restaurant-image">
                <div class="reservation-details">
                    <div class="detail-item">
                        <strong>Restaurant</strong>
                        La Maison Gourmet
                    </div>
                    <div class="detail-item">
                        <strong>Date & Time</strong>
                        Fri, Aug 25 2025 | 7:30 PM
                    </div>
                    <div class="detail-item">
                        <strong>Party Size</strong>
                        4 People
                    </div>
                    <div class="detail-item">
                        <strong>Reservation ID</strong>
                        #RES-235689
                    </div>
                </div>
            </div>
            <div class="action-buttons">
                <button class="btn-primary btn-icon" onclick="showModifyModal()">
                    <i class="fas fa-edit"></i> Modify
                </button>
                <button class="btn-danger btn-icon" onclick="cancelReservation()">
                    <i class="fas fa-times"></i> Cancel
                </button>
                <button class="btn-secondary btn-icon">
                    <i class="fas fa-directions"></i> Directions
                </button>
            </div>
        </div>

        <!-- Completed Reservation 01-->
        <div class="reservation-card">
            <span class="reservation-status status-completed">Completed</span>
            <div class="reservation-header">
                <img src="resources/images/rest3.jpg" alt="Restaurant" class="restaurant-image">
                <div class="reservation-details">
                    <div class="detail-item">
                        <strong>Restaurant</strong>
                        Celonese
                    </div>
                    <div class="detail-item">
                        <strong>Date & Time</strong>
                        Thu, Feb 13 2025 | 10:00 AM
                    </div>
                    <div class="detail-item">
                        <strong>Party Size</strong>
                        10 People
                    </div>
                    <div class="detail-item">
                        <strong>Reservation ID</strong>
                        #RES-105664
                    </div>
                </div>
            </div>
            <div class="action-buttons">
                <button class="btn-secondary btn-icon">
                    <i class="fas fa-receipt"></i> View Receipt
                </button>
                <button class="btn-primary btn-icon">
                    <i class="fas fa-star"></i> Leave Review
                </button>
            </div>
        </div>

        <!-- Completed Reservation 02-->
        <div class="reservation-card">
            <span class="reservation-status status-completed">Completed</span>
            <div class="reservation-header">
                <img src="resources/images/rest5.jpg" alt="Restaurant" class="restaurant-image">
                <div class="reservation-details">
                    <div class="detail-item">
                        <strong>Restaurant</strong>
                        Celonese
                    </div>
                    <div class="detail-item">
                        <strong>Date & Time</strong>
                        Thu, Jan 09 2025 | 07:00 AM
                    </div>
                    <div class="detail-item">
                        <strong>Party Size</strong>
                        10 People
                    </div>
                    <div class="detail-item">
                        <strong>Reservation ID</strong>
                        #RES-105664
                    </div>
                </div>
            </div>
            <div class="action-buttons">
                <button class="btn-secondary btn-icon">
                    <i class="fas fa-receipt"></i> View Receipt
                </button>
                <button class="btn-primary btn-icon">
                    <i class="fas fa-star"></i> Leave Review
                </button>
            </div>
        </div>

        <!-- Empty State -->
        <div class="empty-state" style="display: none;">
            <i class="fas fa-calendar-times fa-3x" style="color: var(--secondary); margin-bottom: 1rem;"></i>
            <h3>No Reservations Found</h3>
            <p>You don't have any upcoming reservations. Start exploring restaurants!</p>
            <button class="btn-primary" onclick="location.href='restaurant-listings.html'">
                Browse Restaurants
            </button>
        </div>
    </div>
</main>

<!-- Modification Modal -->
<div class="modify-modal" id="modifyModal">
    <div class="modify-content">
        <h2>Modify Reservation</h2>
        <form class="modify-form">
            <div class="form-group">
                <label>Date</label>
                <input type="date" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Time</label>
                <select class="form-control">
                    <option>7:00 PM</option>
                    <option>7:30 PM</option>
                    <option>8:00 PM</option>
                </select>
            </div>
            <div class="form-group">
                <label>Party Size</label>
                <select class="form-control">
                    <option>2 People</option>
                    <option>4 People</option>
                    <option>6 People</option>
                </select>
            </div>
            <div class="action-buttons">
                <button type="button" class="btn-secondary" onclick="closeModifyModal()">Cancel</button>
                <button type="submit" class="btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>

<script>
    // Filter Functionality
    document.querySelectorAll('.status-filter').forEach(filter => {
        filter.addEventListener('click', () => {
            document.querySelectorAll('.status-filter').forEach(f => f.classList.remove('active'));
            filter.classList.add('active');
            const status = filter.dataset.status;
            // Add filtering logic here
        });
    });

    // Modal Handling
    function showModifyModal() {
        document.getElementById('modifyModal').style.display = 'flex';
    }

    function closeModifyModal() {
        document.getElementById('modifyModal').style.display = 'none';
    }

    // Cancel Reservation
    function cancelReservation() {
        if(confirm('Are you sure you want to cancel this reservation?')) {
            // Add cancellation logic
        }
    }

    // Close modal on outside click
    window.onclick = function(e) {
        if(e.target.classList.contains('modify-modal')) {
            closeModifyModal();
        }
    }
</script>
</body>
</html>
