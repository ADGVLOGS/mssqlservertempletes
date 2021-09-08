USE [db]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tblAddress] @personid varchar(max), @Address_Type text ,@Address_Line1 text,@Address_Line2 text , @Address_Line3 text, @Suburb text, @Town text, @City text, @Province text, @Postal_Code smallint
AS
BEGIN	 
   SET NOCOUNT ON;
BEGIN TRY
    BEGIN TRANSACTION
		INSERT INTO [dbo].[tblAddress_Data]([personid],[Address_Type],[Address_Line1],[Address_Line2],[Address_Line3],[Suburb],[City],[Province],[Postal_Code]) VALUES (@personid,@Address_Type,@Address_Line1,@Address_Line3,@Suburb,@Town,@City,@Province,@Postal_Code)
    COMMIT TRAN 
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN 
    DECLARE @ErrorMessage NVARCHAR(4000);  
    DECLARE @ErrorSeverity INT;  
    DECLARE @ErrorState INT;  

    SELECT   
       @ErrorMessage = ERROR_MESSAGE(),  
       @ErrorSeverity = ERROR_SEVERITY(),  
       @ErrorState = ERROR_STATE();  

    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);  
    
END CATCH
END
GO

 
