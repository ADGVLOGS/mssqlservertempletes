/****** Object:  StoredProcedure ADGTranactionTemplete ******/
USE [db]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE TransactionDemo
BEGIN	 
   SET NOCOUNT ON;
BEGIN TRY
    BEGIN TRANSACTION
-- DO WHAT YOU WANT HERE ==========================================================================
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

 
