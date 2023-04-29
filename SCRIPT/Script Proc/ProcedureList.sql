use QLGH
GO
---------------------------------------------------------------STORE PROCEDURE
--################################ TAO_MA_TCA
GO
CREATE PROC TAO_MA_TCA
    @MADH CHAR(6),
    @PARA_MATC_DA CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MATC_DA = 'TCA_01'
            DECLARE @V_MATC_DA VARCHAR(6)= 'TCA_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT 1 FROM CHITIET_DH_DA WHERE MADH = @MADH AND MATC_DA = @PARA_MATC_DA))
            BEGIN 
                SET @PARA_MATC_DA =  @V_MATC_DA + REPLICATE('0', 2-LEN(@I)) + CAST(@I AS CHAR(2))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
--################################ TAO_MA_TCU
GO
CREATE PROC TAO_MA_TCU
    @MADH CHAR(6),
    @PARA_MATC_DU CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MATC_DU = 'TCU_01'
            DECLARE @V_MATC_DU VARCHAR(6)= 'TCU_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT 1 FROM CHITIET_DH_DU WHERE MADH = @MADH AND MATC_DU = @PARA_MATC_DU))
            BEGIN 
                SET @PARA_MATC_DU =  @V_MATC_DU + REPLICATE('0', 2-LEN(@I)) + CAST(@I AS CHAR(2))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
--################################ Tạo MADDK
GO
CREATE PROC TAO_MADDK
    @PARA_MADDK CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MADDK = 'DDK_01'
            DECLARE @V_MADDK VARCHAR(6)= 'DDK_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT 1 FROM DON_DK WHERE MADDK = @PARA_MADDK))
            BEGIN 
                SET @PARA_MADDK =  @V_MADDK + REPLICATE('0', 2-LEN(@I)) + CAST(@I AS CHAR(2))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
GO 
--################################ Tạo MACN
GO 
CREATE PROC TAO_MACN
    @PARA_MACN CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MACN = 'CN_01'
            DECLARE @V_MACN VARCHAR(6)= 'CN_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT 1 FROM CHINHANH WHERE MACN = @PARA_MACN))
            BEGIN 
                SET @PARA_MACN =  @V_MACN + REPLICATE('0', 2-LEN(@I)) + CAST(@I AS CHAR(2))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
GO 
--################################ Tạo MADT
GO 
CREATE PROC TAO_MADT
    @PARA_MADT CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MADT = 'DT_01'
            DECLARE @V_MADT VARCHAR(6)= 'DT_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT * FROM DOITAC WHERE MADT = @PARA_MADT))
            BEGIN 
                SET @PARA_MADT =  @V_MADT + REPLICATE('0', 2-LEN(@I)) + CAST(@I AS CHAR(3))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END

-- ######################### TẠO MADH
GO 
CREATE PROC TAO_MADH
    @PARA_MADH CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MADH = 'DH_001'
            DECLARE @V_MADH VARCHAR(6)= 'DH_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT 1 FROM DONHANG WHERE MADH = @PARA_MADH))
            BEGIN 
                SET @PARA_MADH =  @V_MADH + REPLICATE('0', 3-LEN(@I)) + CAST(@I AS CHAR(3))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
--################################ Tạo MASOTHUE
GO 
CREATE PROC TAO_MASOTHUE
    @PARA_MASOTHUE CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MASOTHUE = 'MT_01'
            DECLARE @V_MASOTHUE VARCHAR(6)= 'MT_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT 1 FROM HOPDONG WHERE MASOTHUE = @PARA_MASOTHUE))
            BEGIN 
                SET @PARA_MASOTHUE =  @V_MASOTHUE + REPLICATE('0', 2-LEN(@I)) + CAST(@I AS CHAR(3))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
--################################ Tạo MAHD
GO 
CREATE PROC TAO_MAHD
    @PARA_MAHD CHAR(6) OUT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            SET @PARA_MAHD = 'HD_01'
            DECLARE @V_MAHD VARCHAR(6)= 'HD_'
            DECLARE @I INT = 1

            WHILE(EXISTS(SELECT 1 FROM HOPDONG WHERE MAHD = @PARA_MAHD))
            BEGIN 
                SET @PARA_MAHD =  @V_MAHD + REPLICATE('0', 2-LEN(@I)) + CAST(@I AS CHAR(3))
                SET @I = @I+1
            END 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END

GO  
--####################################### CREATE KHACHHANG
CREATE PROC P_KHACHHNANG
    @PARA_MAKH CHAR(6),
    @PARA_HOTEN NVARCHAR(50),
    @PARA_EMAIL NVARCHAR(50),
    @PARA_SDT NVARCHAR(15),
    @PARA_TP NVARCHAR(50),
    @PARA_QUAN NVARCHAR(50),
    @PARA_DIACHI NVARCHAR(50)
AS
BEGIN
    BEGIN TRAN
        BEGIN TRY 
                INSERT INTO KHACHHANG(MAKH, HOTEN, EMAIL,SDT, TP, QUAN, DIACHI)
                VALUES(@PARA_MAKH, @PARA_HOTEN, @PARA_EMAIL, @PARA_SDT, @PARA_TP, @PARA_QUAN, @PARA_DIACHI)
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH 

    COMMIT TRAN 
    RETURN 1
END 
--###################################### CREATE DON_DK
GO 
CREATE PROC P_DON_DK 
    @PARA_TENNH NVARCHAR(30),
    @PARA_DIACHINH NVARCHAR(50),
    @PARA_STK CHAR(15) ,
    @PARA_EMAIL NVARCHAR(50) ,
    @PARA_TENQUAN NVARCHAR(50) ,
    @PARA_THANHPHO NVARCHAR(50) ,
    @PARA_QUAN NVARCHAR(50) ,
    @PARA_DIACHI NVARCHAR(50) ,
    @PARA_SOLUONGDONHMN INT ,
    @PARA_LOAITHUCPHAM NVARCHAR(20),
    @PARA_SDT VARCHAR(15),
    @PARA_NGUOIDD NVARCHAR(50)
AS 
BEGIN 
    BEGIN TRAN
        BEGIN TRY 
            DECLARE @MADDK CHAR(6)
            EXEC TAO_MADDK @MADDK OUT
            INSERT INTO DON_DK(MADDK, TENNH, DIACHINH, STK, EMAIL, TENQUAN, THANHPHO, QUAN, DIACHI, SOCHINHANH, SLDONHANGMN, LOAIAMTHUC,SDT,NGUOIDD)
            VALUES(@MADDK, @PARA_TENNH, @PARA_DIACHINH, @PARA_STK, @PARA_EMAIL, @PARA_TENQUAN, @PARA_THANHPHO, @PARA_QUAN, @PARA_DIACHI, 0 ,@PARA_SOLUONGDONHMN,@PARA_LOAITHUCPHAM, @PARA_SDT, @PARA_NGUOIDD)
        END TRY 

        BEGIN CATCH
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END 
-- CREATE TAIXE
GO 
CREATE PROC P_TAIXE
    @PARA_MATX CHAR(6),
    @PARA_TENNH NVARCHAR(50),
    @PARA_DIACHINH NVARCHAR(50),
    @PARA_STK CHAR(15),
    @PARA_HOTEN NVARCHAR(50),
    @PARA_CMND CHAR(15),
    @PARA_DIENTHOAI NVARCHAR(15),
    @PARA_TP NVARCHAR(50),
    @PARA_QUAN NVARCHAR(50),
    @PARA_DIACHI NVARCHAR(50),
    @PARA_BIENSOXE NVARCHAR(15),
    @PARA_TRANGTHAI VARCHAR(50)
AS
BEGIN
    BEGIN TRAN
        BEGIN TRY 
            INSERT INTO TAIXE(MATX, TENNH, DIACHINH, STK, HOTEN, CMND, DIENTHOAI, TP, QUAN,DIACHI,BIENSOXE,TRANGTHAI)
            VALUES(@PARA_MATX, @PARA_TENNH, @PARA_DIACHINH, @PARA_STK, @PARA_HOTEN, @PARA_CMND, @PARA_DIENTHOAI,@PARA_TP, @PARA_QUAN ,@PARA_DIACHI, @PARA_BIENSOXE, @PARA_TRANGTHAI)
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 
--#######################################CREATE DOI TAC
GO
CREATE PROC P_DOITAC 
    @PARA_MADT CHAR(6),
    @PARA_MAHD CHAR(6)
AS 
BEGIN 
    BEGIN TRAN
        BEGIN TRY 
            IF EXISTS (SELECT 1 FROM DOITAC DT WHERE DT.MADT = @PARA_MADT)
            BEGIN
                    RAISERROR('MADT IS FALSE!', 16, 1)
                    ROLLBACK TRAN
                    RETURN 0
            END 
            IF NOT EXISTS (SELECT 1 FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            BEGIN 
                RAISERROR('MAHD IS FALSE!', 16, 1)
                ROLLBACK TRAN
                RETURN 0
            END 
            -------------------------------- REFERENCE HOPDONG
            DECLARE @V_EMAIL NVARCHAR(50) = (SELECT DK.EMAIL FROM HOPDONG HD JOIN DON_DK DK ON HD.MADDK = DK.MADDK WHERE HD.MAHD = @PARA_MAHD)
            DECLARE  @V_TENCUAHANG NVARCHAR(50) = (SELECT HD.TENCUAHANG FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            DECLARE  @V_THANHPHO NVARCHAR(50) = (SELECT HD.THANHPHO FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            DECLARE  @V_QUAN NVARCHAR(50) = (SELECT HD.QUAN FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            DECLARE  @V_DIACHI NVARCHAR(50) = (SELECT HD.DIACHI FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            DECLARE  @V_SOCHINHANH NVARCHAR(50) = (SELECT HD.SOCHINHANHDK FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            DECLARE  @V_LOAIAMTHUC NVARCHAR(50) = (SELECT HD.LOAIAMTHUC FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            DECLARE  @V_SDT NVARCHAR(50) = (SELECT HD.SDT FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)


            -----------------------------------INSERT DOITAC
            INSERT INTO DOITAC(MADT, MAHD, EMAIL, TENQUAN, THANHPHO, QUAN, SOCHINHANH,LOAIAMTHUC, DIACHI,SDT)
            VALUES (@PARA_MADT, @PARA_MAHD, @V_EMAIL, @V_TENCUAHANG, @V_THANHPHO, @V_QUAN, @V_SOCHINHANH, @V_LOAIAMTHUC, @V_DIACHI, @V_SDT)
            ----------------------------------- UPDATE CHINHANH
            DECLARE @V_MADDK CHAR(6) = (SELECT HD.MADDK FROM HOPDONG HD WHERE HD.MAHD = @PARA_MAHD)
            -- UPDATA CHINHANH
            UPDATE CHINHANH 
            SET MADT = @PARA_MADT
            WHERE MADDK = @V_MADDK
            -- UPDATE DOANHTHU
        END TRY
        BEGIN CATCH
            RAISERROR('PROGRAM DOITAC IS FALSE!', 16, 1)
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END
GO
--################################################## CREATE HOPDONG
CREATE PROC P_HOPDONG
   @PARA_MADDK CHAR(6),
   @PARA_MANV CHAR(6)
AS 
BEGIN
    BEGIN TRAN
        BEGIN TRY 
                -- CHECK MADDK
                IF NOT EXISTS (SELECT 1 FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                BEGIN
                    RAISERROR('MADDK IS FALSE!', 16, 1)
                    RETURN 0
                END 
                -- kiểm tra đơn đăng ký đó đã có nhân viên nào duyệt chưa
                IF ((SELECT DDK.MANV FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK) IS NOT NULL)
                BEGIN 
                        RAISERROR('MADDK ALREADY EXIST !', 16, 1)
                    RETURN 0
                END 
                --CHECK MANV
                IF NOT EXISTS (SELECT 1 FROM NHANVIEN NV WHERE NV.MANV = @PARA_MANV)
                BEGIN
                    RAISERROR('MANV IS FALSE!', 16, 1) 
                    RETURN 0
                END 

                
                -- TẠO MÃ SỐ THUẾ VÀ KIỂM TRA KẾT QUẢ TẠO CÓ THÀNH CÔNG HAY KHÔNG
                DECLARE @V_MASOTHUE CHAR(6)
                DECLARE @CHECK_RETURN_MASOTHUE INT 
                EXEC @CHECK_RETURN_MASOTHUE = TAO_MASOTHUE @V_MASOTHUE OUT

                IF (@CHECK_RETURN_MASOTHUE = 0)
                BEGIN  
                    RAISERROR('MASOTHUE IS FALSE!', 16, 1)
                    ROLLBACK TRAN
                    RETURN 0
                END
                
                --TẠO MAHD  VÀ KIỂM TRA KẾT QUẢ TẠO MÃ CÓ THÀNH CÔNG HAY KHÔNG
                DECLARE @V_MAHD CHAR(6)
                DECLARE @CHECK_RESULT_HD INT
                EXEC  @CHECK_RESULT_HD = TAO_MAHD @V_MAHD OUTPUT

                IF(@CHECK_RESULT_HD = 0)
                BEGIN 
                    RAISERROR('TAO_MAHD IS FALSE!', 16, 1)
                    ROLLBACK TRAN
                    RETURN 0
                END

                -- TẠO MADT VÀ KIỂM TRA KẾT QUẢ TẠO MÃ CÓ THÀNH CÔNG HAY KHÔNG

                DECLARE @V_MADT CHAR(6)
                DECLARE @CHECK_RESULT_DT INT 
                EXEC @CHECK_RESULT_DT = TAO_MADT @V_MADT OUT
                IF(@CHECK_RESULT_HD = 0)
                BEGIN 
                    RAISERROR('TAO_MADT IS FALSE!', 16, 1)
                    ROLLBACK TRAN
                    RETURN 0
                END

                -- UPDATA NHANVIEN IN DON_DK
                UPDATE DON_DK 
                SET MANV = @PARA_MANV 
                WHERE MADDK = @PARA_MADDK

                --REFERENCES INFOMATION OF DON_DK
                DECLARE @V_TENNH NVARCHAR(30) = (SELECT DDK.TENNH FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_DIACHINH NVARCHAR(50) = (SELECT DDK.DIACHINH FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_STK NVARCHAR(30) = (SELECT DDK.STK FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_NGUOIDD NVARCHAR(30) = (SELECT DDK.NGUOIDD FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_THANHPHO NVARCHAR(50) = (SELECT DDK.THANHPHO FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_QUAN NVARCHAR(50) = (SELECT DDK.QUAN FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_DIACHI NVARCHAR (50) = (SELECT DDK.DIACHI FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_SOCHINHANHDK NVARCHAR (50) = (SELECT DDK.SOCHINHANH FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_TENCUAHANG NVARCHAR (50) = (SELECT DDK.TENQUAN FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_LOAIAMTHUC NVARCHAR (50) = (SELECT DDK.LOAIAMTHUC FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
                DECLARE @V_SDT NVARCHAR (50) = (SELECT DDK.SDT FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)



                DECLARE @V_NGAYLAP DATETIME = GETDATE()
                DECLARE @V_THOIGIANHIEULUC DATETIME = @V_NGAYLAP + 365
                DECLARE @V_PHANTRAMHOAHONG FLOAT = 10;
                DECLARE @V_TRANGTHAI NVARCHAR(50) = N'Còn hiệu lực'
                -- INSERT HOPDONG
                INSERT INTO HOPDONG(MAHD, TENCUAHANG, LOAIAMTHUC, SDT, TENNH, DIACHINH, STK, MADDK, MASOTHUE, THOIGIANHIEULUC, NGAYLAP, PHANTRAMHOAHONG, SOCHINHANHDK,NGUOIDAIDIEN, TRANGTHAI, THANHPHO, QUAN,DIACHI)
                VALUES (@V_MAHD, @V_TENCUAHANG, @V_LOAIAMTHUC, @V_SDT, @V_TENNH, @V_DIACHINH, @V_STK, @PARA_MADDK, @V_MASOTHUE, @V_THOIGIANHIEULUC, @V_NGAYLAP,@V_PHANTRAMHOAHONG,@V_SOCHINHANHDK, @V_NGUOIDD,@V_TRANGTHAI,@V_THANHPHO,@V_QUAN, @V_DIACHI)
                
                -- UPDATE MAHD ON DON_DK
                UPDATE DON_DK
                SET MAHD = @V_MAHD
                WHERE MADDK = @PARA_MADDK

                --CREATE DOITAC
                EXEC P_DOITAC @V_MADT, @V_MAHD
        END TRY

        BEGIN CATCH
            RAISERROR('PROGRAM P_HOPDONG IS FALSE!', 16, 1)
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END
GO 

--######################### CREATE INSERT CHINHANH
CREATE PROC P_CHINHANH
    @PARA_MADDK CHAR(6),
    @PARA_THANHPHO NVARCHAR(50),
    @PARA_QUAN NVARCHAR(50),
    @PARA_DIACHI NVARCHAR(50),
    @THOIGIANMO TIME,
    @THOIGIANDONG TIME
AS 
BEGIN 
      BEGIN TRAN
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
            BEGIN
                RAISERROR('MADDK IS FALSE!', 16, 1) 
                RETURN 0
            END
            DECLARE @V_MACN CHAR(6)
            DECLARE @V_CHECK_RESULT_MACN INT 
            EXEC @V_CHECK_RESULT_MACN = TAO_MACN @V_MACN OUTPUT
            
            IF(@V_CHECK_RESULT_MACN = 0)
            BEGIN
                RAISERROR('TAO_MACN IS FALSE!', 16, 1) 
                ROLLBACK TRAN
                RETURN 0
            END 
            

            DECLARE @V_TENQUAN NVARCHAR(50) = (SELECT DDK.TENQUAN FROM DON_DK DDK WHERE DDK.MADDK = @PARA_MADDK)
            INSERT INTO CHINHANH(MACN, MADDK, TENQUAN, THANHPHO, QUAN, DIACHI, THOIGIANMO, THOIGIANDONG)
            VALUES(@V_MACN, @PARA_MADDK, @V_TENQUAN, @PARA_THANHPHO, @PARA_QUAN, @PARA_DIACHI, @THOIGIANMO, @THOIGIANDONG)

            -- IF ((SELECT SOCHINHANH FROM DON_DK WHERE MADDK = @PARA_MADDK) IS NULL)
            -- BEGIN
            --     UPDATE DON_DK SET SOCHINHANH = 0 WHERE MADDK = @PARA_MADDK
            -- END
            -- UPDATE DON_DK
            -- SET SOCHINHANH = SOCHINHANH + 1
            -- WHERE MADDK = @PARA_MADDK
        END TRY
        BEGIN CATCH
            RAISERROR('P_CHINHANH IS FALSE!', 16, 1)
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

--############################################################## CREATE THUCDON_DA   (CHUA TEST)
GO
CREATE PROC P_THUCDON_DA
    @PARA_MATD_DA CHAR(6),
    @PARA_MADT CHAR(6),
    @PARA_TENTDDA NVARCHAR(50)
AS 
BEGIN 
    BEGIN TRAN
        BEGIN TRY 
            IF EXISTS(SELECT 1 FROM THUCDON_DA WHERE MATD_DA = @PARA_MATD_DA AND MADT = @PARA_MADT AND TENTDDA = @PARA_TENTDDA)
            BEGIN
                RAISERROR('TENTDDA IS FALSE!',1,16)
                RETURN 0
            END 
            INSERT INTO THUCDON_DA(MATD_DA, MADT, TENTDDA)
            VALUES (@PARA_MATD_DA, @PARA_MADT, @PARA_TENTDDA)
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END



-- ########################################################### CREATE MONAN        
GO
CREATE PROC P_MONAN
    @PARA_MATD_DA CHAR(6),
    @PARA_MAMA CHAR(6),
    @PARA_TENMONAN NVARCHAR(50),
    @PARA_MIEUTA NVARCHAR(100),
    @PARA_GIA FLOAT
AS
BEGIN 
        BEGIN TRAN
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM THUCDON_DA TDDA WHERE TDDA.MATD_DA = @PARA_MATD_DA)
            BEGIN
                RAISERROR('MATD_DA IS FALSE!',1,16)
                RETURN 0
            END 

            IF EXISTS(SELECT 1 FROM MONAN WHERE MATD_DA = @PARA_MATD_DA AND TENMA = @PARA_TENMONAN)
            BEGIN
                RAISERROR('TENMA IS FALSE!',1,16)
                RETURN 0
            END 
            INSERT INTO MONAN(MATD_DA,TENMA, MAMA, MIEUTA, GIA)
            VALUES(@PARA_MATD_DA,@PARA_TENMONAN , @PARA_MAMA, @PARA_MIEUTA, @PARA_GIA)
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END
-- ########################################################### CREATE DA_THEM
GO
CREATE PROC P_DA_THEM
    @PARA_MATD_DA CHAR(6),
    @PARA_MAMA CHAR(6),
    @PARA_TENDA_THEM NVARCHAR(30),
    @PARA_GIA FLOAT
AS
BEGIN 
    BEGIN TRAN
        BEGIN TRY
            IF NOT EXISTS(SELECT 1 FROM MONAN MA WHERE MA.MAMA = @PARA_MAMA)
            BEGIN
                RAISERROR('MAMA IS FALSE!',1,16)
                RETURN 0
            END 

            IF NOT EXISTS(SELECT 1 FROM THUCDON_DA TDDA WHERE TDDA.MATD_DA = @PARA_MATD_DA)
            BEGIN
                RAISERROR('MATD_DA IS FALSE!',1,16)
                RETURN 0
            END 

            INSERT INTO DA_THEM(MATD_DA, MAMA, TENDA_THEM, GIA)
            VALUES(@PARA_MATD_DA, @PARA_MAMA, @PARA_TENDA_THEM, @PARA_GIA) 
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 
-- ########################################################### CREATE TOPING_DA
GO
CREATE PROC P_TOPING_DA
    @PARA_MATD_DA CHAR(6),
    @PARA_MAMA CHAR(6),
    @PARA_TENTOPING NVARCHAR(30),
    @PARA_GIA FLOAT
AS
BEGIN 
    BEGIN TRAN
        BEGIN TRY
            IF NOT EXISTS(SELECT 1 FROM MONAN MA WHERE MA.MAMA = @PARA_MAMA)
            BEGIN
                RAISERROR('MAMA IS FALSE!',1,16)
                RETURN 0
            END 

            IF NOT EXISTS(SELECT 1 FROM THUCDON_DA TDDA WHERE TDDA.MATD_DA = @PARA_MATD_DA)
            BEGIN
                RAISERROR('MATD_DA IS FALSE!',1,16)
                RETURN 0
            END 

            INSERT INTO TOPING_DA(MATD_DA, MAMA,TENTOPING, GIA)
            VALUES(@PARA_MATD_DA, @PARA_MAMA, @PARA_TENTOPING, @PARA_GIA)
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 
--############################################################## CREATE THUCDON_DU 
GO
CREATE PROC P_THUCDON_DU
    @PARA_MATD_DU CHAR(6),
    @PARA_MADT CHAR(6),
    @PARA_TENTDDU NVARCHAR(50)
AS 
BEGIN 
    BEGIN TRAN
        BEGIN TRY 
            IF EXISTS(SELECT 1 FROM THUCDON_DU WHERE  MADT = @PARA_MADT AND TENTDDU = @PARA_TENTDDU)
            BEGIN
                RAISERROR('TENTDDU IS FALSE!',1,16)
                RETURN 0
            END 
            INSERT INTO THUCDON_DU(MATD_DU, MADT, TENTDDU)
            VALUES (@PARA_MATD_DU, @PARA_MADT, @PARA_TENTDDU)
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

-- ########################################################### CREATE   DOUONG   
GO
CREATE PROC P_DOUONG
    @PARA_MATD_DU CHAR(6),
    @PARA_MADU CHAR(6),
    @PARA_TENDU NVARCHAR(30),
    @PARA_MIEUTA NVARCHAR(100),
    @PARA_GIA FLOAT
AS
BEGIN 
    BEGIN TRAN
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM THUCDON_DU TDDU WHERE TDDU.MATD_DU = @PARA_MATD_DU)
            BEGIN
                RAISERROR('MATD_DU IS FALSE!',1,16)
                RETURN 0
            END 
            IF EXISTS(SELECT 1 FROM DOUONG DU WHERE DU.MATD_DU = @PARA_MATD_DU AND DU.TENDU = @PARA_TENDU)
            BEGIN
                RAISERROR('TENDU IS FALSE!',1,16)
                RETURN 0
            END
            INSERT INTO DOUONG(MATD_DU, MADU, TENDU,MIEUTA,GIA)
            VALUES (@PARA_MATD_DU, @PARA_MADU, @PARA_TENDU, @PARA_MIEUTA, @PARA_GIA)
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END
GO 
--##############################################TOPING_DU
CREATE PROC P_TOPING_DU 
    @PARA_MATD_DU CHAR(6),
    @PARA_MADU CHAR(6),
    @PARA_TENTOPING NVARCHAR(50),
    @PARA_GIA FLOAT
AS
BEGIN 
    BEGIN TRAN
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM THUCDON_DU TDU WHERE TDU.MATD_DU = @PARA_MATD_DU)
            BEGIN
                RAISERROR('MATD_DU IS FALSE!',1,16)
                RETURN 0
            END

            IF NOT EXISTS(SELECT 1 FROM DOUONG DU WHERE DU.MADU = @PARA_MADU)
            BEGIN
                RAISERROR('MADU IS FALSE!',1,16)
                RETURN 0
            END

            INSERT INTO TOPING_DU( MATD_DU, MADU, TENTOPPING, GIA)
            VALUES(@PARA_MATD_DU, @PARA_MADU, @PARA_TENTOPING, @PARA_GIA)
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END
GO 
--##################################### UPDATE MONAN
GO
CREATE PROC P_UPDATE_MONAN
        @TENMONAN NVARCHAR(50),
        @MAMA CHAR(6),
        @MATD_MA CHAR(6),
        @GIA CHAR(6)
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA)
        BEGIN
            ROLLBACK TRAN 
            RETURN 0
        END
        UPDATE MONAN SET TENMA = @TENMONAN, GIA = @GIA WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA
    COMMIT TRAN 
    RETURN 1
END

GO
--##################################### CREATE NHANVIEN
CREATE PROC P_NHANVIEN
    @PARA_MANV CHAR(6),
    @PARA_TENNV NVARCHAR(50)
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            INSERT INTO NHANVIEN(MANV, TENNV) VALUES(@PARA_MANV, @PARA_TENNV)
        END TRY
        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH 
    COMMIT TRAN
    RETURN 1
END

GO 
--##############################################CREATE DONHANG
GO 
CREATE PROC P_TAO_DONHANG
    @PARA_MADH CHAR(6) OUT,
    @PARA_MACN CHAR(6),
    @PARA_MAKH CHAR(6)
AS 
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM CHINHANH WHERE MACN = @PARA_MACN)
            BEGIN 
                RAISERROR('MACN IS FALSE!',1,16)
                RETURN 0
            END 

            IF NOT EXISTS(SELECT 1 FROM KHACHHANG WHERE MAKH = @PARA_MAKH)
            BEGIN 
                RAISERROR('MAKH IS FALSE!',1,16)
                RETURN 0
            END 
            IF EXISTS(SELECT 1 FROM  DONHANG WHERE MAKH = @PARA_MAKH AND MACN = @PARA_MACN AND TINHTRANG IS NULL)
            BEGIN 
                SET @PARA_MADH = (SELECT MADH FROM  DONHANG WHERE MAKH = @PARA_MAKH AND MACN = @PARA_MACN AND TINHTRANG IS NULL)
                COMMIT TRAN
                RETURN 0
            END
            EXEC TAO_MADH @PARA_MADH OUT
            INSERT INTO DONHANG(MADH, MAKH, MACN, PHIVANCHUYEN)
            VALUES(@PARA_MADH, @PARA_MAKH, @PARA_MACN, 30000)
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
GO
--################################## CREATE CHITIET_DH_DA
GO
CREATE PROC P_THEM_CHITIET_DH_DA
    @PARA_MACN CHAR(6),
    @PARA_MAKH CHAR(6),
    @PARA_MATD_DA CHAR(6),
    @PARA_MAMA CHAR(6),
    @PARA_TENMA NVARCHAR(50),
    @PARA_SL INT,
    @PARA_GIA FLOAT
AS
BEGIN 
    BEGIN TRAN 
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM THUCDON_DA WHERE MATD_DA = @PARA_MATD_DA)
            BEGIN
                RAISERROR('MATD_DA IS FALSE!',1,16)
                RETURN 0
            END 

            IF NOT EXISTS(SELECT 1 FROM MONAN WHERE MAMA = @PARA_MAMA AND TENMA = @PARA_TENMA)
            BEGIN
                RAISERROR('TENMA IS FALSE!',1,16)
                RETURN 0
            END 

                DECLARE @V_MADH CHAR(6)
                EXEC P_TAO_DONHANG @V_MADH OUT, @PARA_MACN, @PARA_MAKH
                
                DECLARE @V_MA_TC_DA CHAR(6)
                EXEC TAO_MA_TCA @V_MADH, @V_MA_TC_DA OUT

                INSERT INTO CHITIET_DH_DA(MADH, MATC_DA ,MATD_DA, MAMA, TENMA, SL, GIA)
                VALUES(@V_MADH, @V_MA_TC_DA,@PARA_MATD_DA, @PARA_MAMA, @PARA_TENMA, @PARA_SL, @PARA_GIA)
        END TRY

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END
GO 
-- CREATE TUYCHON DA_THEM
CREATE PROC P_TUYCHON_DA_DH  
    @PARA_MADH CHAR(6),
    @PARA_MATC_DA CHAR(6),
    @PARA_TOPPING NVARCHAR(30),
    @PARA_GIA FLOAT
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            IF(@PARA_MATC_DA IS NULL)
            BEGIN
                RAISERROR('MADH IS NULL!',1,16)
                ROLLBACK TRAN
                RETURN 0
            END 
            IF NOT EXISTS(SELECT 1 FROM DONHANG WHERE MADH = @PARA_MADH)
            BEGIN 
                RAISERROR('MADH IS FALSE!',1,16)
                ROLLBACK TRAN 
                RETURN 0
            END 
            INSERT INTO TUYCHON_DA_DH(MADH, MATC_DA, TOPPING, GIA_TC)
            VALUES(@PARA_MADH, @PARA_MATC_DA, @PARA_TOPPING, @PARA_GIA)
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0 
        END CATCH
    COMMIT TRAN
    RETURN 1 
END
--################################# CREATE CHITIETDH_DU
GO
CREATE PROC P_THEM_CHITIET_DH_DU 
    @PARA_MACN CHAR(6),
    @PARA_MAKH CHAR(6),
    @PARA_MATD_DU CHAR(6),
    @PARA_MADU CHAR(6),
    @PARA_TENDU NVARCHAR(50),
    @PARA_SIZE CHAR(3),
    @PARA_LUONGDUONG INT,
    @PARA_LUONGDA INT,
    @PARA_SL INT,
    @PARA_GIA FLOAT
AS 
BEGIN
    BEGIN TRAN 
        BEGIN TRY 

            IF NOT EXISTS(SELECT 1 FROM THUCDON_DU WHERE MATD_DU = @PARA_MATD_DU)
            BEGIN
            RAISERROR('MATD_DU IS FALSE!',1,16)
                RETURN 0
            END 

            IF NOT EXISTS(SELECT 1 FROM DOUONG WHERE MADU = @PARA_MADU)
            BEGIN
            RAISERROR('MADU IS FALSE!',1,16)
                RETURN 0
            END 

            -- KIỂM TRA MADH CỦA KHACHHANG ĐÃ TỒN TẠI Ở CHINHNHANH
            DECLARE @V_MADH CHAR(6)
            EXEC P_TAO_DONHANG @V_MADH OUT, @PARA_MACN, @PARA_MAKH

            DECLARE @V_MATC_DU CHAR(6)
            EXEC TAO_MA_TCU @V_MADH, @V_MATC_DU OUT

            INSERT INTO CHITIET_DH_DU(MADH, MATC_DU,MATD_DU, MADU, TENDU, SIZE, LUONGDUONG, LUONGDA,SL, GIA)
            VALUES(@V_MADH, @V_MATC_DU,@PARA_MATD_DU, @PARA_MADU, @PARA_TENDU, @PARA_SIZE, @PARA_LUONGDUONG, @PARA_LUONGDA,@PARA_SL, @PARA_GIA)
        END TRY 

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0 
        END CATCH 
    COMMIT TRAN 
    RETURN 1
END 
GO 
--CREATE TUYCHON_DH_DU
CREATE PROC P_TUYCHON_DU_DH
    @PARA_MADH CHAR(6),
    @PARA_MATC_DU CHAR(6),
    @PARA_TOPPING NVARCHAR(30),
    @PARA_GIATC FLOAT
AS 
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
        IF NOT EXISTS(SELECT 1 FROM DONHANG WHERE MADH = @PARA_MADH)
        BEGIN 
            RAISERROR('MADH IS FALSE!',1,16)
            RETURN 0
        END 
            INSERT INTO TUYCHON_DU_DH(MADH, MATC_DU,TOPPING, GIA_TC)
            VALUES(@PARA_MADH, @PARA_MATC_DU,@PARA_TOPPING, @PARA_GIATC)
        END TRY 

        BEGIN CATCH
            ROLLBACK TRAN 
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
GO 

--############################################################ CREATE Đánh giá
GO
CREATE PROC P_DANHGIA_DH
    @PARA_MAKH CHAR(6),
    @PARA_MADH CHAR(6),
    @PARA_RATE INT, 
    @PARA_COMMENT NVARCHAR(300)

AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM KHACHHANG WHERE MAKH = @PARA_MAKH)
            BEGIN 
                RAISERROR('MAKH IS FALSE!',1,16)
                RETURN 0
            END 
            
            IF NOT EXISTS(SELECT 1 FROM DONHANG WHERE MADH = @PARA_MADH)
            BEGIN 
                RAISERROR('MADH IS FALSE!',1,16)
                RETURN 0
            END 
            IF NOT EXISTS(SELECT * FROM DONHANG WHERE MADH = @PARA_MADH AND TINHTRANG = N'Giao hàng thành công')
            BEGIN 
                ROLLBACK TRAN 
                RETURN 0
            END
            INSERT INTO DANH_GIA_DON_HANG(MAKH, MADH, RATE, COMMENT)
            VALUES(@PARA_MAKH, @PARA_MADH, @PARA_RATE, @PARA_COMMENT)

        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH 
    COMMIT TRAN 
    RETURN 1
END 
GO

--########################################################## TX_NHẬN ĐƠN
GO
CREATE PROC TX_XAC_NHAN_DH
    @MATX CHAR(6),
    @MADH CHAR(6)
AS 
BEGIN 
    BEGIN TRAN 
        BEGIN TRY 
            IF ((SELECT MATX FROM DONHANG WHERE MADH = @MADH) IS NOT NULL)
            BEGIN
                ROLLBACK TRAN
                RETURN 0
            END 
            IF NOT EXISTS (SELECT * FROM TAIXE WHERE MATX = @MATX)
            BEGIN
                ROLLBACK 
                RETURN 0
            END
            IF NOT EXISTS (SELECT * FROM DONHANG WHERE MADH = @MADH)
            BEGIN 
                ROLLBACK 
                RETURN 0
            END 
            IF ((SELECT NGAYLAP FROM DONHANG WHERE @MADH = @MADH) != NULL)
            BEGIN
                ROLLBACK TRAN
                RETURN 0
            END
            IF NOT EXISTS((SELECT TINHTRANG FROM DONHANG WHERE @MADH = MADH AND TINHTRANG =  N'Đã xác nhận'))
            begin 
                ROLLBACK TRAN 
                RETURN 0
            end 
            IF NOT EXISTS ((SELECT * FROM TAIXE WHERE @MATX = MATX AND TRANGTHAI = N'Chưa nhận đơn'))
            BEGIN
                RAISERROR('TAIXE DANG BAN IS FALSE!', 16, 1) 
                ROLLBACK TRAN
                RETURN 0
            END 
            UPDATE DONHANG SET TINHTRANG = N'Tài xế đang lấy hàng' WHERE MADH = @MADH
            UPDATE DONHANG SET MATX = @MATX WHERE MADH = @MADH
            UPDATE TAIXE SET TRANGTHAI = N'Đã nhận đơn' WHERE MATX = @MATX
        END TRY    

        BEGIN CATCH

            ROLLBACK  
            RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END 

--############################################################ ĐẶT HÀNG
GO
CREATE PROC KH_DATHANG 
    @PARA_MADH CHAR(6),
    @PARA_HINHTHUCTHANHTOAN NVARCHAR(20),
    @PARA_GHICHU NVARCHAR(100), 
    @PARA_THANHPHO NVARCHAR(50),
    @PARA_QUAN NVARCHAR(50),
    @PARA_DIACHI NVARCHAR(50)
AS 
BEGIN 
    BEGIN TRAN 
        BEGIN TRY 
            IF NOT EXISTS(SELECT 1 FROM DONHANG WHERE MADH = @PARA_MADH )
            BEGIN 
                RAISERROR('MADH IS FALSE!',1,16)   
                RETURN 0            
            END 

            UPDATE DONHANG
            SET HINHTHUCTHANHTOAN = @PARA_HINHTHUCTHANHTOAN, GHICHU = @PARA_GHICHU, THANHPHO = @PARA_THANHPHO, QUAN = @PARA_QUAN, DIACHI = @PARA_DIACHI, TINHTRANG = N'Đang chờ cửa hàng xác nhận', NGAYLAP = GETDATE()
            WHERE MADH = @PARA_MADH
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN 
            RETURN 0
        END CATCH 
    COMMIT TRAN 
    RETURN 1
END 

--############################################################ CẬP NHẬP TÌNH TRẠNG ĐƠN HÀNG PHÍA CHI NHÁNH
GO 
CREATE PROC CN_UPDATE_TINHTRANG_DH
    @MADH CHAR(6),
    @TINHTRANG NVARCHAR(50)
AS

BEGIN
    BEGIN TRAN 
        BEGIN TRY 
            IF NOT EXISTS(SELECT * FROM DONHANG WHERE MADH = @MADH)
            BEGIN
                ROLLBACK TRAN 
                RETURN 0            
            END
            IF ((SELECT TINHTRANG FROM DONHANG WHERE MADH = @MADH) IS NULL)
            BEGIN
                ROLLBACK TRAN
                RETURN 0
            END
            IF ((SELECT MATX FROM DONHANG WHERE MADH = @MADH) IS NOT NULL)
            BEGIN
                ROLLBACK TRAN 
                RETURN 2
            END 
            UPDATE DONHANG SET TINHTRANG = @TINHTRANG WHERE @MADH = MADH
        END TRY 

        BEGIN CATCH

        END CATCH

    COMMIT TRAN

    RETURN 1

END
--############################################################ CẬP NHẬP TÌNH TRẠNG ĐƠN HÀNG PHÍA TÀI XẾ
GO
CREATE PROC P_UPDATE_NHANVIEN
    @MANV CHAR(6),
    @TENNV NVARCHAR(50)
AS 

BEGIN
    BEGIN TRAN 
        IF NOT EXISTS (SELECT* FROM NHANVIEN NV WHERE MANV = @MANV)
        BEGIN 
             RAISERROR('MANV IS FALSE!', 16, 1)
             ROLLBACK TRAN 
             RETURN 0
        END 
        UPDATE NHANVIEN SET TENNV = @TENNV WHERE MANV = @MANV
    COMMIT  TRAN 
END 
GO

CREATE PROC TX_UPDATE_TINHTRANG_DH
    @MADH CHAR(6),
    @TINHTRANG NVARCHAR(50)

AS
BEGIN 
    BEGIN TRAN 
        BEGIN TRY 
        --Phải xác nhận xem nó có đúng là tài xế của đơn hàng này hay không nữa
            IF NOT EXISTS(SELECT * FROM DONHANG WHERE MADH = @MADH AND MATX IS NOT NULL)
            BEGIN
                ROLLBACK TRAN 
                RETURN 0            
            END
            
            IF EXISTS(SELECT * FROM DONHANG WHERE MADH =@MADH AND TINHTRANG = N'Giao hàng thành công')
            BEGIN 
                COMMIT TRAN 
                RETURN 2
            END             

            DECLARE @MATX CHAR(6) = (SELECT MATX FROM DONHANG WHERE MADH =@MADH)

            UPDATE DONHANG SET TINHTRANG = @TINHTRANG WHERE @MADH = MADH
            IF (@TINHTRANG = N'Giao hàng thành công')
            BEGIN
                UPDATE TAIXE SET TRANGTHAI = N'Chưa nhận đơn' WHERE @MATX = MATX
            END 
        END TRY 

        BEGIN CATCH 

        END CATCH
    COMMIT TRAN 

END 
GO
------------------------------- CẬP NHẬP KHU VỰC TÀI XẾ.
CREATE PROC TX_UPDATE_KHUVUC
    @PARA_MATX CHAR(6) ,
    @PARA_KV_TP NVARCHAR(50),
    @PARA_KV_QUAN NVARCHAR(50)
AS
BEGIN 
    BEGIN TRAN 
        BEGIN TRY 
            if NOT EXISTS( SELECT * FROM TAIXE WHERE MATX = @PARA_MATX)
            BEGIN
                RAISERROR('MADDK IS FALSE!', 16, 1) 
                ROLLBACK TRAN
                RETURN 0
            END 
            UPDATE TAIXE SET KV_TP = @PARA_KV_TP, KV_QUAN = @PARA_KV_QUAN WHERE MATX = @PARA_MATX
        END TRY
        
        BEGIN CATCH
                RAISERROR('TX_UPDATE_KHUVUC IS FALSE!', 16, 1) 
                ROLLBACK TRAN 
                RETURN 0
        END CATCH
    COMMIT TRAN 
    RETURN 1
END
GO
---------------------------------------GIA HẠN HD
CREATE PROC P_GIAHAN_DH
    @MAHD CHAR(6)
AS 
BEGIN 
    BEGIN TRAN
        BEGIN TRY
            DECLARE @HAN_HD DATETIME = (SELECT THOIGIANHIEULUC FROM HOPDONG WHERE MAHD = @MAHD)
            IF (@HAN_HD BETWEEN GETDATE() AND GETDATE() + 7)
            BEGIN
                UPDATE HOPDONG SET THOIGIANHIEULUC = THOIGIANHIEULUC + 365 WHERE MAHD = @MAHD
                UPDATE HOPDONG SET TRANGTHAI = N'Còn hiệu lực'
            END
            ELSE
            BEGIN
                ROLLBACK TRAN
                RAISERROR(' HOP DONG HET HIEU LUC!', 16, 1) 

            END 
        END TRY

        BEGIN CATCH
                ROLLBACK TRAN 
                RAISERROR('P_GIAHAN_DH IS FALSE!', 16, 1) 
                RETURN 0
        END CATCH 
    COMMIT TRAN
    RETURN 1
END

GO
CREATE PROC P_UPDATE_MONAN
        @TENMONAN NVARCHAR(50),
        @MAMA CHAR(6),
        @MATD_MA CHAR(6),
        @GIA CHAR(6)
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA)
        BEGIN
            ROLLBACK TRAN 
            RETURN 0
        END
        UPDATE MONAN SET TENMA = @TENMONAN, GIA = @GIA WHERE MAMA = @MAMA AND MATD_DA = @MATD_MA
    COMMIT TRAN 
    RETURN 1
END

GO
-----------------------------------
-- SELECT * FROM DANH_GIA_DON_HANG
-- SELECT * FROM DONHANG
-- SELECT * FROM DON_DK
-- SELECT * FROM HOPDONG

 SELECT * FROM MONAN

-----------------------------------------------------------------------RUNNING PROCEDURE AND FUNCTION

------------------------------------------------------------------------------- TẠO ĐƠN DK
-- DECLARE @V_MADDK CHAR(6)

-- EXEC P_DON_DK 

-- INSERT CHINHANH
-- EXEC P_CHINHANH 'DDK_03', 'TP HCM', N'Bình Tân', N'Bình Trị Đông', '8:00', '21:00'
-- EXEC P_CHINHANH 'DDK_03', 'TP HCM', N'Quận 1', N'Phường 1', '8:00', '21:00'
-- EXEC P_CHINHANH 'DDK_03', 'TP HCM', N'Quận 2', N'Phường 2', '8:00', '21:00'
-- EXEC P_CHINHANH 'DDK_03', 'TP HCM', N'Quận 3', N'Phường 3', '8:00', '21:00'
--INSERT HOPDONG
-- EXEC P_HOPDONG 'DDK_03', 'NV_03'
-- EXEC P_HOPDONG 'DDK_02', 'NV_01'

-- select * FROM CHINHANH
-- select * FROM CHITIET_DH_DA
-- select * FROM HOPDONG
-- SELECT * FROM KHACHHANG



-- -- INSERT DONHANG
-- EXEC P_THEM_CHITIET_DH_DA 'CN_02', 'KH_02' , 'TCA_01', 'TDA_01', 'MA_01',  N'Bánh Mì Phúc Long', 1, 35000
-- EXEC P_THEM_CHITIET_DH_DA 'CN_02', 'KH_02', 'TCA_02' , 'TDA_01', 'MA_02', N'Butter Chocolate croissant', 2, 15000

-- EXEC P_THEM_CHITIET_DH_DA 'CN_03', 'KH_04' , 'TCA_01', 'TDA_03', 'MA_01',  N'Khoai Tây Chiên', 1, 15000
-- EXEC P_THEM_CHITIET_DH_DA 'CN_03', 'KH_04', 'TCA_02' , 'TDA_04', 'MA_02', N'Buger Tôm', 2, 15000

EXEC P_THEM_CHITIET_DH_DA 'CN_04', 'KH_04', 'TDA_01', 'MA_01',  N'Bánh Mì Phúc Long', 1, 45000
EXEC P_THEM_CHITIET_DH_DA 'CN_04', 'KH_04', 'TDA_02', 'MA_01', N'Cream Dâu', 2, 15000


-- EXEC P_THEM_CHITIET_DH_DA 'CN_04', 'KH_03' , 'TCA_01', 'TDA_03', 'MA_01',  N'Khoai Tây Chiên', 1, 45000
-- EXEC P_THEM_CHITIET_DH_DA 'CN_04', 'KH_03', 'TCA_02' , 'TDA_03', 'MA_02', N'Phô Mai Viên', 2, 15000



-- EXEC P_THEM_CHITIET_DH_DU  'CN_02', 'KH_04','TCA_01','TDU_01', 'DU_01', N'Trà Tắc', 'L', 50, 50, 1, 15000
-- EXEC P_THEM_CHITIET_DH_DU 'CN_02', 'KH_04', 'TCA_02','TDU_01', 'DU_02', N'Trà Dâu', 'L', 30, 50, 2, 25000
-- -- EXEC P_TUYCHON_DU_DH 'TCU_01', @V_MADH, N'Trân Châu', 5000



SELECT * FROM CHITIET_DH_DA
-- SELECT * FROM TAIXE



-- ------------------------------------ QUY TRÌNHĐẶT HÀNG
-- -- KHÁCH HÀNG ĐẶT HÀNG
-- EXEC KH_DATHANG 'DH_010', N'Tiền mặt', N'', N'TP HCM', N'Quận 3', N'Phường 1'
-- -- CHI NHÁNH UPADTE TÌNH TRANG ĐƠN HÀNG, XÁC NHẬN ĐƠN
-- EXEC CN_UPDATE_TINHTRANG_DH 'DH_010', N'Đã xác nhận'
-- -- TÀI XÉ NHẬN ĐƠN HÀNG
-- EXEC TX_XAC_NHAN_DH 'TX_02', 'DH_010'
-- -- TÀI XẾ CẬP NHẬP TÌNH TRẠNG ĐƠN HÀNG
EXEC TX_UPDATE_TINHTRANG_DH 'DH_004', N'Đang giao hàng'
EXEC TX_UPDATE_TINHTRANG_DH 'DH_004', N'Giao hàng thành công'
-- -- KHÁCH HÀNG ĐÁNH GIÁ ĐƠN HÀNG
-- EXEC P_DANHGIA_DH 'KH_01', 'DH_001', 5, N'Hàng giống như mô tả'
-- SELECT * FROM TAIXE
SELECT * FROM DONHANG

-- GO

SELECT * FROM CHITIET_DH_DA
DECLARE @VMAHD CHAR(6)
EXEC TAO_MA_TCU 'DH_002', @VMAHD OUT
PRINT @VMAHD
GO


