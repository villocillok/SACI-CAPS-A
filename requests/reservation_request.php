<?php
    date_default_timezone_set('Asia/Manila');
    session_start();

    require_once('connection.php');

    $connection = new Connection();
    $connection->open();

    $username = $_SESSION['account_username'];
    $id = $connection->escape_string($_POST['id']);
    $action = $connection->escape_string($_POST['action']);

    if(isset($username)) {
        if($action == 'Add') {
            // TODO: INSERT Query
            $dateReserved = date('Y-m-d H:i:s');

            $connection->query("SELECT * FROM reservations WHERE Book_ID='$id' AND Borrowers_ID='$username' AND Status='active'");

            if($connection->num_rows() == 0) {
                $connection->query("INSERT INTO reservations (Book_ID, Borrowers_ID, Date_Reserved) VALUES ('$id', '$username', '$dateReserved')");

                if($connection->affected_rows() == 1) {
                    echo json_encode(array('status' => 'Success', 'message' => 'Reservation has been added.'));
                } else {
                    echo json_encode(array('status' => 'Failed', 'message' => 'Failed to reserve book.'));
                }
            } else {
                echo json_encode(array('status' => 'Failed', 'message' => 'A copy of this book has already been reserved.'));
            }
        } else if($action == 'Delete') {
            // TODO: DELETE Query
            $connection->query("UPDATE reservations SET Status='inactive' WHERE Reservation_ID='$id' AND Borrowers_ID='$username'");

            if($connection->affected_rows() == 1) {
                echo json_encode(array('status' => 'Success', 'message' => 'Reservation has been deleted.'));
            } else {
                echo json_encode(array('status' => 'Failed', 'message' => 'Failed to delete reservation.'));
            }
        } else {
            echo json_encode(array('status' => 'Failed', 'message' => 'Please specify a valid action.'));
        }
    } else {
        echo json_encode(array('status' => 'Failed', 'message' => 'Please login first.'));
    }

    $connection->close();
?>