report 50101 "Auto Card Report"
{
    Caption = 'Auto Card Report';
    DefaultLayout = RDLC;
    RDLCLayout = './rdlc/AutoCardReport.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Auto; Auto)
        {
            PrintOnlyIfDetail = true;
            column(No_; "No.")
            {

            }
            column(Mark_No_; "Mark No.")
            {

            }
            column(Model_No_; "Model No.")
            {

            }
            column(Total_rent_cost; "Total rent cost")
            {

            }


            dataitem("Finished Auto Rent Header"; "Finished Auto Rent Header")
            {

                RequestFilterFields = "Reservation Date From", "Reservation Date To";
                DataItemLinkReference = Auto;
                DataItemLink = "Auto No." = field("No.");
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
                trigger OnAfterGetRecord()
                var
                    AutoRenHeader: Record "Finished Auto Rent Header";
                begin
                    if (AutoRenHeader.FindFirst()) then
                        repeat
                            if (AutoRenHeader."Auto No." = Auto."No.") then
                                Auto."Total rent cost" += AutoRenHeader.Total;
                        until AutoRenHeader.Next() = 0;

                end;


            }
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
        AutoNo = 'Auto No.';
        MarkNo = 'Mark No.';
        ModelNo = 'Model No.';
        TotalRentCost = 'Total Rent Cost';
    }


    var
        myInt: Integer;
}