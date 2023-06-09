--1) FIX

DROP PROC IF EXISTS EX_1_READ_INFO_UNCOMMITTED_READ_FIX  
GO
CREATE PROC EX_1_READ_INFO_UNCOMMITTED_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
    BEGIN TRAN 
    BEGIN TRY 
        SELECT * FROM MONAN
    END TRY 

    BEGIN CATCH 
        ROLLBACK TRAN
        RETURN 0
    END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO



DROP PROC IF EXISTS  EX_1_UPDATE_INFO_UNCOMMITTED_READ_FIX
GO 
CREATE PROC EX_1_UPDATE_INFO_UNCOMMITTED_READ_FIX
        @MAMA CHAR(6),
        @MATD_MA CHAR(6),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        UPDATE MONAN SET GIA = @GIA WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA
        SELECT *  FROM MONAN    
        WAITFOR DELAY '00:00:05'
        IF ( @GIA < 0 )
                BEGIN
                    ROLLBACK TRAN 
                    RETURN 0
        END
    COMMIT TRAN      
    RETURN 1
END

--2) FIX
DROP PROC IF EXISTS EX_2_READ_INFO_UNCOMMITTED_READ_FIX  
GO
CREATE PROC EX_2_READ_INFO_UNCOMMITTED_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    BEGIN TRAN 
    BEGIN TRY 
        SELECT * FROM NHANVIEN

    END TRY 

    BEGIN CATCH 
        ROLLBACK TRAN
        RETURN 0
    END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO



DROP PROC IF EXISTS  EX_2_UPDATE_INFO_UNCOMMITTED_READ_FIX
GO 
CREATE PROC EX_2_UPDATE_INFO_UNCOMMITTED_READ_FIX
        @MANV CHAR(6),
        @TENNV nvarchar(50)
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM NHANVIEN WHERE MANV = @MANV )
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        UPDATE NHANVIEN SET TENNV = @TENNV WHERE MANV = @MANV 
        SELECT *  FROM NHANVIEN    
        WAITFOR DELAY '00:00:05'  
    ROLLBACK TRAN
    RETURN 1
END

--3 FIX
DROP PROC IF EXISTS EX_3_READ_DH_UNCOMMITTED_READ_FIX 
go

CREATE PROC EX_3_READ_DH_UNCOMMITTED_READ_FIX 
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
    BEGIN TRAN 
        BEGIN TRY 
            SELECT * FROM DONHANG
           

        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_3_UPDATE_DH_UNCOMMITTED_READ_FIX 
GO
CREATE PROC EX_3_UPDATE_DH_UNCOMMITTED_READ_FIX 
        @MADH CHAR(50),
        @MAKH CHAR(6),
        @MACN CHAR(6),
        @GHICHU nvarchar(100) 
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM DONHANG WHERE MADH = @MADH AND MAKH = @MAKH)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        UPDATE DONHANG SET GHICHU = @GHICHU WHERE MADH = @MADH AND MAKH = @MAKH
        SELECT *  FROM DONHANG
        WAITFOR DELAY '00:00:05'  
    ROLLBACK TRAN 
    RETURN 1
END

--4 FIX
DROP PROC IF EXISTS EX_4_READ_MONAN_UNCOMMITTED_READ_FIX 
go

CREATE PROC EX_4_READ_MONAN_UNCOMMITTED_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
    BEGIN TRAN 
        BEGIN TRY 
            SELECT * FROM MONAN

        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_4_INSERT_MONAN_UNCOMMITTED_READ_FIX
GO
CREATE PROC EX_4_INSERT_MONAN_UNCOMMITTED_READ_FIX
        @MATD_DA CHAR(50),
        @MAMA CHAR(6),
        @TENMA nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
    INSERT INTO MONAN (MATD_DA, MAMA, TENMA, MIEUTA, GIA) 
    VALUES (@MATD_DA, @MAMA, @TENMA, @MIEUTA, @GIA)        
    SELECT *  FROM MONAN
    WAITFOR DELAY '00:00:05'
    ROLLBACK TRAN 
    RETURN 1
END 

GO

--5) FIX
DROP PROC IF EXISTS EX_5_READ_MENU_UNREPEATABLE_READ 
GO
CREATE PROC EX_5_READ_MENU_UNREPEATABLE_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    BEGIN TRAN 
    BEGIN TRY 
            SELECT * FROM MONAN


    END TRY 

    BEGIN CATCH 
        ROLLBACK TRAN
        RETURN 0
    END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO


DROP PROC IF EXISTS EX_5_UPDATE_MONAN_UNREPEATABLE_READ  
GO 
CREATE PROC EX_5_UPDATE_MONAN_UNREPEATABLE_READ_FIX
        @TENMON NVARCHAR(50),
        @MAMA CHAR(6),
        @MATD_MA CHAR(6)
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA)
        BEGIN
            ROLLBACK TRAN 
            RETURN 0
        END
        UPDATE MONAN SET TENMA = @TENMON WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA
                WAITFOR DELAY '00:00:05'

    COMMIT TRAN 
    RETURN 1

END


--6) FIX
DROP PROC IF EXISTS EX_6_READ_MONAN_UNREPEATABLE_READ_FIX 
go

CREATE PROC EX_6_READ_MONAN_UNREPEATABLE_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM MONAN

             
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_6_UPDATE_MONAN_UNREPEATABLE_READ_FIX  
GO
CREATE PROC EX_6_UPDATE_MONAN_UNREPEATABLE_READ_FIX
        @TENMONAN NVARCHAR(50),
        @MAMA CHAR(6),
        @MATD_MA CHAR(6),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        UPDATE MONAN SET GIA = @GIA WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA
                WAITFOR DELAY '00:00:05'

    COMMIT TRAN 
    RETURN 1
END
--7 ) FIX 

DROP PROC IF EXISTS EX_7_READ_NHANVIEN_UNREPEATABLE_READ_FIX 
go

CREATE PROC EX_7_READ_NHANVIEN_UNREPEATABLE_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM NHANVIEN

                
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_7_UPDATE_NHANVIEN_UNREPEATABLE_READ_FIX  
GO
CREATE PROC EX_7_UPDATE_NHANVIEN_UNREPEATABLE_READ_FIX
        @MANV CHAR(6),
        @TENNV NVARCHAR(50)
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM NHANVIEN WHERE MANV = @MANV)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        UPDATE NHANVIEN SET TENNV = @TENNV WHERE MANV = @MANV
                WAITFOR DELAY '00:00:05'

    COMMIT TRAN 
    RETURN 1
END

--8) FIX

DROP PROC IF EXISTS EX_8_READ_DOUONG_UNREPEATABLE_READ_FIX 
go

CREATE PROC EX_8_READ_DOUONG_UNREPEATABLE_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM DOUONG

                WAITFOR DELAY '00:00:05'

                SELECT * FROM DOUONG
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_8_UPDATE_DOUONG_UNREPEATABLE_READ_FIX  
GO
CREATE PROC EX_8_UPDATE_DOUONG_UNREPEATABLE_READ_FIX  
        @MATD_DU CHAR(6),
        @MA_DU NVARCHAR(50),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM DOUONG WHERE MATD_DU = @MATD_DU AND MADU = @MA_DU)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        UPDATE DOUONG SET GIA = @GIA WHERE MATD_DU = @MATD_DU AND MADU = @MA_DU
    COMMIT TRAN 
    RETURN 1
END

--9) FIX
DROP PROC IF EXISTS EX_9_READ_MONAN_PHANTOM_FIX
go

CREATE PROC EX_9_READ_MONAN_PHANTOM_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

    BEGIN TRAN 
        BEGIN TRY 
                WAITFOR DELAY '00:00:05'  
                SELECT * FROM MONAN 

              
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_9_INSERT_MONAN_PHANTOM_FIX 
GO
CREATE PROC EX_9_INSERT_MONAN_PHANTOM_FIX 
        @MATD_DA CHAR(50),
        @MAMA CHAR(6),
        @TENMA nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY 
            IF EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_DA)
        BEGIN
            ROLLBACK TRAN 
            RETURN 0
        END
        INSERT INTO MONAN (MATD_DA, MAMA, TENMA, MIEUTA, GIA) VALUES (@MATD_DA, @MAMA, @TENMA, @MIEUTA, @GIA) 

    END TRY


    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

     COMMIT TRAN  
    RETURN 1
END

--10) FIX
DROP PROC IF EXISTS EX_10_READ_NHANVIEN_PHANTOM_FIX
go

CREATE PROC EX_10_READ_NHANVIEN_PHANTOM_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
    BEGIN TRAN 
        BEGIN TRY 
                WAITFOR DELAY '00:00:05'  
                SELECT * FROM NHANVIEN 
             
        END TRY 

        BEGIN CATCH 
            ROLLBACK 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_10_INSERT_NHANVIEN_PHANTOM_FIX 
GO
CREATE PROC EX_10_INSERT_NHANVIEN_PHANTOM_FIX 
        @MANV CHAR(6),
        @TENNV nvarchar(50)
       
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        IF  EXISTS(SELECT * FROM NHANVIEN WHERE MANV = @MANV )
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        INSERT INTO NHANVIEN(MANV, TENNV) VALUES (@MANV, @TENNV)     

    END TRY


    BEGIN CATCH
        ROLLBACK  
        RETURN 0
    END CATCH

    COMMIT  TRAN
    RETURN 1
END
--11) FIX
DROP PROC IF EXISTS EX_11_READ_DONDK_PHANTOM_FIX
go

CREATE PROC EX_11_READ_DONDK_PHANTOM_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
    BEGIN TRAN 
        BEGIN TRY 
            WAITFOR DELAY '00:00:05'  
            SELECT * FROM DON_DK 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_11_INSERT_DONDK_PHANTOM_FIX 
GO
CREATE PROC EX_11_INSERT_DONDK_PHANTOM_FIX 
   @NGUOIDD              nvarchar(30)       ,      
   @TENNH                nvarchar(30)       ,
   @DIACHINH             nvarchar(50)        ,
   @STK                  char(15)           ,
   @EMAIL                nvarchar(50)      ,
   @TENQUAN              nvarchar(50)     ,
   @THANHPHO             nvarchar(50)      ,
   @QUAN                 nvarchar(50)        ,
   @DIACHI               nvarchar(50)       ,
   @SLDONHANGMN          int               ,
   @LOAIAMTHUC           nvarchar(50)       ,
   @SDT                  nvarchar(15)       ,
   @SOCHINHANH           int
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
       
        INSERT INTO DON_DK(NGUOIDD,TENNH,DIACHINH, STK, EMAIL, TENQUAN, THANHPHO,QUAN,DIACHI ,SLDONHANGMN, LOAIAMTHUC,SDT,SOCHINHANH)
        VALUES(@NGUOIDD,@TENNH,@DIACHINH, @STK, @EMAIL, @TENQUAN, @THANHPHO,@QUAN,@DIACHI ,@SLDONHANGMN, @LOAIAMTHUC,@SDT,@SOCHINHANH)

    END TRY


    BEGIN CATCH
        ROLLBACK  
        RETURN 0
    END CATCH

     COMMIT TRAN  
    RETURN 1
END

--12) FIX
DROP PROC IF EXISTS EX_12_READ_TOPING_PHANTOM_FIX
go

CREATE PROC EX_12_READ_TOPING_PHANTOM_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
    BEGIN TRAN 
        BEGIN TRY 
                WAITFOR DELAY '00:00:05'  
                SELECT * FROM  TOPING_DA 

               
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_12_INSERT_TOPING_PHANTOM_FIX 
GO
CREATE PROC EX_12_INSERT_TOPING_PHANTOM_FIX 
   @MATD_DA                 char(6)             ,
   @MAMA                    char(6)            ,
   @TENTOPING              nvarchar(30)       ,
   @GIA               float               
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        IF NOT EXISTS(SELECT * FROM TOPING_DA  WHERE MATD_DA = @MATD_DA AND MAMA = @MAMA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        INSERT INTO TOPING_DA(MATD_DA,MAMA,TENTOPING,GIA)
        VALUES(@MATD_DA,@MAMA,@TENTOPING,@GIA)

    END TRY


    BEGIN CATCH
        ROLLBACK  
        RETURN 0
    END CATCH
            WAITFOR DELAY '00:00:05'

     COMMIT TRAN  
    RETURN 1
END

--13)FIX
DROP PROC IF EXISTS EX_13_READ_MONAN_FIX 
go

CREATE PROC EX_13_READ_MONAN_FIX 
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SELECT * FROM MONAN
            WAITFOR DELAY '00:00:05'
            SELECT * FROM MONAN

        END TRY 

        BEGIN CATCH 
            ROLLBACK 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_13_INSERT_MONAN_FIX
GO
CREATE PROC EX_13_INSERT_MONAN_FIX
        @MATD_DA CHAR(50),
        @MAMA CHAR(6),
        @TENMA nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF  EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_DA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
    INSERT INTO MONAN WITH (UPDLOCK) (MATD_DA, MAMA, TENMA, MIEUTA, GIA) 
    VALUES (@MATD_DA, @MAMA, @TENMA, @MIEUTA, @GIA)        
    SELECT *  FROM MONAN
    WAITFOR DELAY '00:00:05'
    COMMIT TRAN 
    RETURN 1
END 

GO

GO
DROP PROC IF EXISTS EX_13_UPDATE_MONAN_FIX
GO
CREATE PROC EX_13_UPDATE_MONAN_FIX
        @MATD_DA CHAR(50),
        @MAMA CHAR(6),
        @TENMA nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL  READ COMMITTED
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_DA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
  
    SELECT *  FROM MONAN 
    WAITFOR DELAY '00:00:05'
    UPDATE MONAN 
    SET TENMA = @TENMA WHERE MAMA = @MAMA
    COMMIT TRAN 
    RETURN 1
END 

GO
--14)FIX
DROP PROC IF EXISTS EX_14_READ_UONG_UNCOMMITTED_READ_FIX 
go

CREATE PROC EX_14_READ_UONG_UNCOMMITTED_READ_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SELECT * FROM DOUONG
            WAITFOR DELAY '00:00:05'
            SELECT * FROM DOUONG

        END TRY 

        BEGIN CATCH 
            ROLLBACK 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_14_INSERT_UONG_FIX
GO
CREATE PROC EX_14_INSERT_UONG
        @MATD_DU CHAR(50),
        @MADU CHAR(6),
        @TENDU nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF  EXISTS(SELECT * FROM DOUONG WHERE MADU = @MADU AND MATD_DU = @MATD_DU)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
    INSERT INTO  DOUONG WITH (UPDLOCK)(MATD_DU, MADU, TENDU, MIEUTA, GIA) 
    VALUES (@MATD_DU, @MADU, @TENDU, @MIEUTA, @GIA)        
    SELECT *  FROM DOUONG
    WAITFOR DELAY '00:00:05'
    COMMIT TRAN 
    RETURN 1
END 

GO

GO
DROP PROC IF EXISTS EX_14_UPDATE_UONG_FIX
GO
CREATE PROC EX_14_UPDATE_UONG_FIX
        @MATD_DU CHAR(50),
        @MADU CHAR(6),
        @TENDU nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
          IF NOT EXISTS(SELECT * FROM DOUONG WHERE MADU = @MADU AND MATD_DU = @MATD_DU)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
  
    SELECT *  FROM DOUONG 
    WAITFOR DELAY '00:00:05'
    UPDATE DOUONG 
    SET TENDU = @TENDU WHERE MADU = @MADU
    COMMIT TRAN 
    RETURN 1
END 

GO

--15)FIX
DROP PROC IF EXISTS EX_15_READ_MONAN_FIX
go

CREATE PROC EX_15_READ_MONAN_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SELECT * FROM MONAN
            WAITFOR DELAY '00:00:05'
            SELECT * FROM MONAN

        END TRY 

        BEGIN CATCH 
            ROLLBACK 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_15_INSERT_MONAN_FIX
GO
CREATE PROC EX_15_INSERT_MONAN_FIX
        @MATD_DA CHAR(50),
        @MAMA CHAR(6),
        @TENMA nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF  EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_DA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
    INSERT INTO MONAN WITH (UPDLOCK) (MATD_DA, MAMA, TENMA, MIEUTA, GIA) 
    VALUES (@MATD_DA, @MAMA, @TENMA, @MIEUTA, @GIA)        
    SELECT *  FROM MONAN
    WAITFOR DELAY '00:00:05'
    COMMIT TRAN 
    RETURN 1
END 

GO

GO
DROP PROC IF EXISTS EX_15_UPDATE_MONAN_FIX
GO
CREATE PROC EX_15_UPDATE_MONAN_FIX
        @MATD_DA CHAR(50),
        @MAMA CHAR(6),
        @TENMA nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL  READ COMMITTED
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_DA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
  
    SELECT *  FROM MONAN 
    WAITFOR DELAY '00:00:05'
    UPDATE MONAN 
    SET GIA = @GIA WHERE MAMA = @MAMA
    COMMIT TRAN 
    RETURN 1
END 

GO

--16)FIX
DROP PROC IF EXISTS EX_16_READ_UONG_FIX
go

CREATE PROC EX_16_READ_UONG_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SELECT * FROM DOUONG
            WAITFOR DELAY '00:00:05'
            SELECT * FROM DOUONG

        END TRY 

        BEGIN CATCH 
            ROLLBACK 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_16_INSERT_UONG_FIX
GO
CREATE PROC EX_16_INSERT_UONG_FIX
        @MATD_DU CHAR(50),
        @MADU CHAR(6),
        @TENDU nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF  EXISTS(SELECT * FROM DOUONG WHERE MADU = @MADU AND MATD_DU = @MATD_DU)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
    INSERT INTO DOUONG WITH (UPDLOCK)(MATD_DU, MADU, TENDU, MIEUTA, GIA) 
    VALUES (@MATD_DU, @MADU, @TENDU, @MIEUTA, @GIA)        
    SELECT *  FROM DOUONG
    WAITFOR DELAY '00:00:05'
    COMMIT TRAN 
    RETURN 1
END 

GO

GO
DROP PROC IF EXISTS EX_16_UPDATE_UONG_FIX
GO
CREATE PROC EX_16_UPDATE_UONG_FIX
        @MATD_DU CHAR(50),
        @MADU CHAR(6),
        @TENDU nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL  READ COMMITTED
    BEGIN TRAN
          IF NOT EXISTS(SELECT * FROM DOUONG WHERE MADU = @MADU AND MATD_DU = @MATD_DU)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
  
    SELECT *  FROM DOUONG 
    WAITFOR DELAY '00:00:05'
    UPDATE DOUONG 
    SET GIA = @GIA WHERE MADU = @MADU
    COMMIT TRAN 
    RETURN 1
END 

GO
--17) FIX

DROP PROC IF EXISTS EX_17_READ_MONAN_DEADLOCK_FIX
go

CREATE PROC EX_17_READ_MONAN_DEADLOCK_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  MONAN 

                WAITFOR DELAY '00:00:13'

                SELECT * FROM  MONAN 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO
DROP PROC IF EXISTS EX_17_UPDATE_TDB_DEADLOCK_FIX 
GO
CREATE PROC EX_17_UPDATE_TDB_DEADLOCK_FIX 
    @MATD_DA_1    char(6),
    @MAMA_1       char(6),
    @TENMA         nvarchar(30) ,
    @MATD_DA_2    char(6),
    @MAMA_2        char(6),
    @TENMA2       nvarchar(30) 
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL   SERIALIZABLE
    BEGIN TRAN
    BEGIN TRY

        IF NOT EXISTS (SELECT * FROM MONAN WHERE MATD_DA = @MATD_DA_1 AND MAMA = @MAMA_1 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        IF NOT EXISTS (SELECT * FROM MONAN WHERE MATD_DA = @MATD_DA_2 AND MAMA = @MAMA_2 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM MONAN  
        UPDATE MONAN SET TENMA = @TENMA WHERE MATD_DA = @MATD_DA_1 AND MAMA = @MAMA_1
        WAITFOR DELAY '00:00:05'
        UPDATE MONAN SET TENMA = @TENMA2 WHERE MATD_DA = @MATD_DA_2 AND MAMA = @MAMA_2
        SELECT * FROM MONAN  
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END


--18 FIX
DROP PROC IF EXISTS EX_18_READ_MONAN_DEADLOCK_FIX
go

CREATE PROC EX_18_READ_MONAN_DEADLOCK_FIX
AS
BEGIN

    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  THUCDON_DA 

                WAITFOR DELAY '00:00:13'

                SELECT * FROM  THUCDON_DA 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO
DROP PROC IF EXISTS EX_18_UPDATE_TDB_DEADLOCK_FIX 
GO
CREATE PROC EX_18_UPDATE_TDB_DEADLOCK_FIX 
    @MATD_DA_1    char(6),
    @MADT_1          char(6),
    @TENTDDA_1      nvarchar(30) ,
    @MATD_DA_2    char(6),
    @MADT_2          char(6),
    @TENTDDA_2      nvarchar(30) 
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL   SERIALIZABLE
    BEGIN TRAN
    BEGIN TRY

        IF NOT EXISTS (SELECT * FROM THUCDON_DA WHERE MATD_DA = @MATD_DA_1 AND MADT = @MADT_1 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

          IF NOT EXISTS (SELECT * FROM THUCDON_DA WHERE MATD_DA = @MATD_DA_2 AND MADT = @MADT_2 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM THUCDON_DA  
        UPDATE THUCDON_DA SET TENTDDA = @TENTDDA_1 WHERE MATD_DA = @MATD_DA_1 AND MADT = @MADT_1 
        WAITFOR DELAY '00:00:05'
        UPDATE THUCDON_DA SET TENTDDA = @TENTDDA_2 WHERE MATD_DA = @MATD_DA_2 AND MADT = @MADT_2
        SELECT * FROM THUCDON_DA  
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END

--19 FIX
DROP PROC IF EXISTS EX_19_READ_MONAN_DEADLOCK_FIX
go

CREATE PROC EX_19_READ_MONAN_DEADLOCK_FIX
AS
BEGIN

    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  THUCDON_DU 

                WAITFOR DELAY '00:00:13'

                SELECT * FROM  THUCDON_DU 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO
DROP PROC IF EXISTS EX_19_UPDATE_TDB_DEADLOCK_FIX 
GO
CREATE PROC EX_19_UPDATE_TDB_DEADLOCK_FIX 
    @MATD_DU_1    char(6),
    @MADT_1       char(6),
    @TENTDDU_1        nvarchar(50) ,
    @MATD_DU_2    char(6),
    @MADT_2       char(6),
    @TENTDDU_2         nvarchar(50) 
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL   SERIALIZABLE
    BEGIN TRAN
    BEGIN TRY

        IF NOT EXISTS (SELECT * FROM THUCDON_DU WHERE MATD_DU = @MATD_DU_1 AND MADT = @MADT_1 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

          IF NOT EXISTS (SELECT * FROM THUCDON_DU WHERE MATD_DU = @MATD_DU_2 AND MADT = @MADT_2 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM THUCDON_DU  
        UPDATE THUCDON_DU  SET TENTDDU = @TENTDDU_1 WHERE MATD_DU = @MATD_DU_1 AND MADT = @MADT_1
        WAITFOR DELAY '00:00:05'
        UPDATE THUCDON_DU  SET TENTDDU = @TENTDDU_2 WHERE MATD_DU = @MATD_DU_2 AND MADT = @MADT_2
        SELECT * FROM THUCDON_DA  
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END



--20 FIX
DROP PROC IF EXISTS EX_20_READ_MONAN_DEADLOCK_FIX
go

CREATE PROC EX_20_READ_MONAN_DEADLOCK_FIX
AS
BEGIN

    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  MONAN 

                WAITFOR DELAY '00:00:13'

                SELECT * FROM  MONAN 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO
DROP PROC IF EXISTS EX_20_UPDATE_TDB_DEADLOCK_FIX 
GO
CREATE PROC EX_20_UPDATE_TDB_DEADLOCK_FIX 
    @MATD_DA_1    char(6),
    @MAMA_1       char(6),
    @GIA_1         FLOAT ,
    @MATD_DA_2    char(6),
    @MAMA_2        char(6),
    @GIA_2       FLOAT 
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL   SERIALIZABLE
    BEGIN TRAN
    BEGIN TRY

        IF NOT EXISTS (SELECT * FROM MONAN WHERE MATD_DA = @MATD_DA_1 AND MAMA = @MAMA_1 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        IF NOT EXISTS (SELECT * FROM MONAN WHERE MATD_DA = @MATD_DA_2 AND MAMA = @MAMA_2 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM MONAN  
        UPDATE MONAN SET GIA = @GIA_1 WHERE MATD_DA = @MATD_DA_1 AND MAMA = @MAMA_1
        WAITFOR DELAY '00:00:05'
        UPDATE MONAN SET GIA = @GIA_2 WHERE MATD_DA = @MATD_DA_2 AND MAMA = @MAMA_2
        SELECT * FROM MONAN  
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END


--21) FIX
DROP PROC IF EXISTS EX_21_READ_DONHANG_LOST_UPDATE_FIX
go

CREATE PROC EX_21_READ_DONHANG_LOST_UPDATE_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            select * from DONHANG where MATX is NULL AND TINHTRANG = N'Đã xác nhận'
                
                WAITFOR DELAY '00:00:15'

            select * from DONHANG where MATX is NULL AND TINHTRANG = N'Đã xác nhận'        
            
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO
DROP PROC IF EXISTS EX_21_UPDATE_DONHANG_TXA_LOST_UPDATE_FIX 
GO
CREATE PROC EX_21_UPDATE_DONHANG_TXA_LOST_UPDATE_FIX 
   @MADH       char(6),
   @MATX       char(6),
   @TINHTRANG  nvarchar(30)   
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY
        IF NOT EXISTS (SELECT * FROM TAIXE WHERE MATX = @MATX)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END


        IF NOT EXISTS (SELECT * FROM DONHANG WHERE MADH = @MADH AND (TINHTRANG  = N'Đã xác nhận' OR TINHTRANG IS NULL))
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM DONHANG  WHERE MADH = @MADH 
        UPDATE DONHANG SET MATX = @MATX, TINHTRANG = @TINHTRANG WHERE MADH = @MADH
        SELECT * FROM DONHANG WHERE MADH = @MADH

    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH
        WAITFOR DELAY '00:00:10'

    COMMIT TRAN
    RETURN 1
END


GO
DROP PROC IF EXISTS EX_21_UPDATE_DONHANG_TXB_LOST_UPDATE_FIX 
GO
CREATE PROC EX_21_UPDATE_DONHANG_TXB_LOST_UPDATE_FIX 
   @MADH       char(6),
   @MATX       char(6),
   @TINHTRANG  nvarchar(30)   
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY
        IF NOT EXISTS (SELECT * FROM TAIXE WHERE MATX = @MATX)
        BEGIN
            ROLLBACK TRAN
            RETURN 0
        END

        IF NOT EXISTS (SELECT * FROM DONHANG WHERE MADH = @MADH AND (TINHTRANG  = N'Đang chờ xác nhận' OR TINHTRANG IS NULL))
        BEGIN
            ROLLBACK TRAN
            RETURN 0
        END

        SELECT * FROM DONHANG  WHERE MADH = @MADH 

        UPDATE DONHANG SET MATX = @MATX, TINHTRANG = @TINHTRANG WHERE MADH = @MADH
        SELECT * FROM DONHANG WHERE MADH = @MADH
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END

--22) FIX
DROP PROC IF EXISTS EX_22_READ_DONDK_LOST_UPDATE_FIX
go

CREATE PROC EX_22_READ_DONDK_LOST_UPDATE_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  DON_DK 

                WAITFOR DELAY '00:00:15'

                SELECT * FROM  DON_DK 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 
GO
DROP PROC IF EXISTS EX_22_UPDATE_DONDKA_LOST_UPDATE_FIX 
GO
CREATE PROC EX_22_UPDATE_DONDKA_LOST_UPDATE_FIX 
   @MADDK      char(6),
   @MANV       char(6)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY
        IF NOT EXISTS (SELECT * FROM NHANVIEN WHERE MANV = @MANV)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END


        IF NOT EXISTS (SELECT * FROM DON_DK WHERE MADDK = @MADDK AND MANV IS NULL)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM DON_DK  WHERE MADDK = @MADDK 
        WAITFOR DELAY '00:00:10'
        UPDATE DON_DK SET MANV = @MANV WHERE MADDK = @MADDK 
        SELECT * FROM DON_DK WHERE MADDK = @MADDK 
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END


GO
DROP PROC IF EXISTS EX_22_UPDATE_DONDKB_LOST_UPDATE_FIX  
GO
CREATE PROC EX_22_UPDATE_DONDKB_LOST_UPDATE_FIX 
    @MADDK      char(6),
   @MANV       char(6)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY
        IF NOT EXISTS (SELECT * FROM NHANVIEN WHERE MANV = @MANV)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END


        IF NOT EXISTS (SELECT * FROM DON_DK WHERE MADDK = @MADDK AND MANV IS NULL)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM DON_DK WHERE MADDK = @MADDK

        UPDATE DON_DK SET  MANV = @MANV WHERE  MADDK = @MADDK
        SELECT * FROM DON_DK WHERE MADDK = @MADDK
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END

--23) FIX

DROP PROC IF EXISTS EX_23_READ_SOLUONG_LOST_UPDATE_FIX
go

CREATE PROC EX_23_READ_SOLUONG_LOST_UPDATE_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  THUCDON_DA 

                WAITFOR DELAY '00:00:15'

                SELECT * FROM  THUCDON_DA 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 
GO
DROP PROC IF EXISTS EX_23_UPDATE_SOLUONGA_LOST_UPDATE_FIX 
GO
CREATE PROC EX_23_UPDATE_SOLUONGA_LOST_UPDATE_FIX 
   @MATD_DA      char(6),
   @MADT       char(6),
   @SOLUONGMON  FLOAT
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY
    IF EXISTS (SELECT * FROM THUCDON_DA WHERE SOLUONGMON < @SOLUONGMON)
        BEGIN
                PRINT N'LỖI'

            ROLLBACK TRAN
            RETURN 1
        END
        IF NOT EXISTS (SELECT * FROM THUCDON_DA WHERE MATD_DA = @MATD_DA AND MADT = @MADT)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM THUCDON_DA   
        UPDATE THUCDON_DA SET SOLUONGMON = @SOLUONGMON - 1 WHERE MATD_DA = @MATD_DA AND MADT = @MADT
        SELECT * FROM THUCDON_DA 
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END


GO
DROP PROC IF EXISTS EX_23_UPDATE_SOLUONGB_LOST_UPDATE_FIX  
GO
CREATE PROC EX_23_UPDATE_SOLUONGB_LOST_UPDATE_FIX 
   @MATD_DA      char(6),
   @MADT       char(6),
   @SOLUONGMON  FLOAT
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY
    IF EXISTS (SELECT * FROM THUCDON_DA WHERE SOLUONGMON < @SOLUONGMON)
        BEGIN
                PRINT N'LỖI'

            ROLLBACK TRAN
            RETURN 1
        END
        IF NOT EXISTS (SELECT * FROM THUCDON_DA WHERE MATD_DA = @MATD_DA AND MADT = @MADT)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END
        SELECT * FROM THUCDON_DA   
        UPDATE THUCDON_DA SET SOLUONGMON = @SOLUONGMON - 2 WHERE MATD_DA = @MATD_DA AND MADT = @MADT
        SELECT * FROM THUCDON_DA 
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END

--24) FIX

DROP PROC IF EXISTS EX_24_READ_SOLUONG_LOST_UPDATE_FIX
go

CREATE PROC EX_24_READ_SOLUONG_LOST_UPDATE_FIX
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  THUCDON_DU 

                WAITFOR DELAY '00:00:12'

                SELECT * FROM  THUCDON_DU 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 
GO
DROP PROC IF EXISTS EX_24_UPDATE_SOLUONGA_LOST_UPDATE_FIX 
GO
CREATE PROC EX_24_UPDATE_SOLUONGA_LOST_UPDATE_FIX 
   @MATD_DU      char(6),
   @MADT       char(6),
   @SL  FLOAT
AS
BEGIN

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY

        IF EXISTS (SELECT * FROM THUCDON_DU WHERE SL < @SL)
        BEGIN
        PRINT N'LỖI'
            ROLLBACK TRAN
            RETURN 1
        END
        
        IF NOT EXISTS (SELECT * FROM THUCDON_DU WHERE MATD_DU = @MATD_DU AND MADT = @MADT)
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM THUCDON_DU   
        WAITFOR DELAY '00:00:10'
        UPDATE THUCDON_DU SET SL = @SL - 1 WHERE MATD_DU = @MATD_DU AND MADT = @MADT
        SELECT * FROM THUCDON_DU 
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END


GO
DROP PROC IF EXISTS EX_24_UPDATE_SOLUONGB_LOST_UPDATE_FIX  
GO
CREATE PROC EX_24_UPDATE_SOLUONGB_LOST_UPDATE_FIX 
   @MATD_DU      char(6),
   @MADT       char(6),
   @SL  FLOAT
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
    BEGIN TRAN
    BEGIN TRY
        IF EXISTS (SELECT * FROM THUCDON_DU WHERE SL < @SL)
        BEGIN
            PRINT N'LỖI'
            ROLLBACK TRAN
            RETURN 1
        END
        SELECT * FROM THUCDON_DU   
        UPDATE THUCDON_DU SET SL = @SL - 2 WHERE MATD_DU = @MATD_DU AND MADT = @MADT
        SELECT * FROM THUCDON_DU 
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END

