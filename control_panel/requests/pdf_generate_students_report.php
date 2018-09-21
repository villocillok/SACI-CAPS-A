<?php
    require_once('../../fpdf/pdf_mc_table.php');

    class PDF_Generate_Students_Report extends PDF_MC_Table {
        function Header() {
            $this->SetFillColor(25, 40, 35);
            $this->SetMargins(10, 15, 10);
            
            if($this->PageNo() == 1) {
                $this->SetFont('Arial', '', 20);
                $this->SetTextColor(25, 40, 35);
                $this->Cell(0, 8, 'Southeast Asian College, Inc.', 0, 0, 'L');
                $this->Ln();
                $this->SetFont('Arial', '', 10);
                $this->Cell(0, 5, 'Borrower Report', 0, 0, 'L');
                $this->Ln(20);
            }

            $this->SetFont('Arial', 'B', 10);
            $this->SetTextColor(25, 40, 35);
            $this->SetAligns(array('C', 'C', 'C', 'C', 'C', 'C', 'C'));
            $this->SetWidths(array(50, 100, 46));// di pa ayos yung spaces na ooccupy ng table
            $this->Row(array('Borrower ID', 'Department Name', 'Borrower Name', 'Contact Number', 'Gender', 'Borrower Type', 'Course', 'Status'));
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
        }
    }
?>