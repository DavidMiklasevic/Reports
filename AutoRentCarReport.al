report 50100 "Auto Rent Card Report"
{
    Caption = 'Auto Rent Card Report';
    DefaultLayout = RDLC;
    RDLCLayout = './rdlc/AutoRentCardReport.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {

        dataitem("Auto Rent Header"; "Auto Rent Header")
        {
            PrintOnlyIfDetail = true;
            column(No_; "No.")
            {

            }
            column(Reservation_Date_From; "Reservation Date From")
            {

            }
            column(Reservation_Date_To; "Reservation Date To")
            {

            }
            column(Client_No_; "Client No.")
            {

            }
            column(Total; Total)
            {

            }
            column(Auto_No_; "Auto No.")
            {

            }
            column(Auto_Rent_Cost; "Auto Rent Cost")
            {

            }
            column(Other_Rent_Cost; "Other Rent Cost")
            {

            }


            dataitem(Auto; Auto)
            {
                DataItemLinkReference = "Auto Rent Header";
                DataItemLink = "No." = field("Auto No.");
                column(Mark_No_; "Mark No.")
                {

                }
                column(Model_No_; "Model No.")
                {

                }
            }
            dataitem("Auto Rent Line"; "Auto Rent Line")
            {

                DataItemLinkReference = "Auto Rent Header";
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                {

                }
                column(Amount; Amount)
                {

                }
                column(Price; Price)
                {

                }
                column(Total_cost; "Total cost")
                {

                }



            }
            trigger OnAfterGetRecord()
            var
                AutoRentLine: Record "Auto Rent Line";
            begin

                AutoRentLine.Get("No.", "Auto No.");
                "Auto Rent Cost" := AutoRentLine."Total cost";
                "Other Rent Cost" := Total - "Auto Rent Cost";
            end;


        }


    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    labels
    {
        No = 'Auto No.';
        MarkNo = 'Mark No.';
        ModelN = 'Model No.';
        ReservationFrom = 'Reservation Date From';
        ReservationTo = 'Reservation Date To';
        ClientNo = 'Client No.';
        TotalLbl = 'Total';
        AutoCost = 'Auto Rent Cost';
        OtherCost = 'Extras Rent Cost';
    }


    var
        myInt: Integer;

}