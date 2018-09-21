<?php
    require_once('../../fpdf/pdf_mc_table.php');

    class PDF_Generate_Reserved_Materials_Report extends PDF_MC_Table {
        function Header() {
            $this->SetFillColor(25, 40, 35);
            $this->SetMargins(10, 15, 10);
            
            if($this->PageNo() == 1) {
                $this->SetFont('Arial', '', 20);
                $this->SetTextColor(25, 40, 35);
                $this->Cell(0, 8, 'Southeast Asian College, Inc.', 0, 0, 'L');
                $this->Cell(0, 8, 'Web-based Library Management System for Southeast Asian College, Inc.', 0, 0, 'L');
                $this->Ln();
                $this->SetFont('Arial', '', 10);
                $this->Cell(0, 5, 'Reserved Books Report', 0, 0, 'L');
                $this->Cell(0, 5, 'Date of report: ', 0, 0, 'L');//accoding to date picker
                $this->Ln(20);
            }

            $this->SetFont('Arial', 'B', 10);
            $this->SetTextColor(25, 40, 35);
            $this->SetAligns(array('C', 'C', 'C', 'C', 'C', 'C', 'C', 'C'));
            $this->SetWidths(array(50, 25, 30, 20, 20, 60, 30, 25));
            $this->Row(array('Reservation ID', 'Borrower ID', 'Book ID', 'Accession Number', 'Barcode Number', 'Book Title', 'Date Reserved', 'Status'));
            $this->SetFont('Arial', '', 8);
            $this->SetTextColor(25, 40, 35);
        }

        function Footer() {
            $this->SetFont('Arial', 'I', 8);
            $this->SetTextColor(150);
            $this->SetY(-20);
            $this->Cell(0, 10, 'Page ' . $this->PageNo() . ' of {nb}', 0, 0, 'R');
            $this->SetY(-20);
            $this->Cell(0, 10, 'Library System: Generated Report', 0, 0, 'L');
            $this->Cell(0, 10, 'Printed by: ', 0, 0, 'L');//who print the report
            $this->Cell(0, 10, 'Date printed: ', 0, 0, 'L');// current date
        }
    }
?>