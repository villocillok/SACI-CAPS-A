<?php
    date_default_timezone_set('Asia/Manila');

    require_once('pdf_generate_penalty_report.php');
    require_once('connection.php');

    $connection = new Connection();
    $connection->open();
   // $connection2 = new Connection();
   // $connection2->open();

    $date = $connection->escape_string($_GET['date']);

    $pdf = new PDF_Generate_Penalty_Report('L', 'mm', 'Letter');

    $pdf->AliasNbPages();
    $pdf->AddPage();
    $pdf->SetFont('Arial', '', 8);

    // $connection->query("SELECT * FROM book INNER JOIN publishers ON book.Publisher_ID=publishers.Publisher_ID INNER JOIN categories ON book.Category_ID=categories.Category_ID INNER JOIN section ON book.Section_ID=section.Section_ID WHERE book.Date_Added LIKE '$date%'");
    $connection->query("SELECT * FROM penalties WHERE Date_Of_Payment LIKE '$date%'");

    while($row = $connection->fetch_assoc()) {
       // $authors = '';
       // $isFirst = true;

        //$connection2->query("SELECT * FROM works INNER JOIN authors ON works.Author_ID=authors.Author_ID WHERE works.Book_ID='$row[Book_ID]'");

       // while($row2 = $connection2->fetch_assoc()) {
         //   if($isFirst) {
           //     $authors .= $row2['Author_First_Name'] . ' ' . $row2['Author_Last_Name'];
             //   $isFirst = false;
            //} else {
              //  $authors .= ', ' . $row2['Author_First_Name'] . ' ' . $row2['Author_Last_Name'];
           // }
        //}

        $pdf->Row(array($row['Penalty_ID'], $row['Return_ID'], $row['Penalty'], $row['Date_Of_Payment'], $row['Status'] ));
    }

    $pdf->Output();

    //$connection2->close();
    $connection->close();
?>