USE [mfskyk]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[kullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[kullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grup]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grup](
	[grupID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gruplar] PRIMARY KEY CLUSTERED 
(
	[grupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HaftaninEnleri]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HaftaninEnleri](
	[enlerID] [int] IDENTITY(1,1) NOT NULL,
	[haftaninOyuncusu] [nvarchar](50) NOT NULL,
	[haftaninOrtasahasi] [nvarchar](50) NOT NULL,
	[haftaninForveti] [nvarchar](50) NOT NULL,
	[haftaninDefansi] [nvarchar](50) NOT NULL,
	[haftaninKalecisi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Enler] PRIMARY KEY CLUSTERED 
(
	[enlerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[kullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[isAdmin] [int] NOT NULL,
	[kullaniciAdi] [nvarchar](50) NOT NULL,
	[kullaniciSifre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[kullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OynanacakMac]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OynanacakMac](
	[oynanacakmacID] [int] IDENTITY(1,1) NOT NULL,
	[birincitakimismi] [nvarchar](50) NOT NULL,
	[ikincitakimismi] [nvarchar](50) NOT NULL,
	[mactarihi] [datetime] NOT NULL,
	[grupID] [int] NOT NULL,
 CONSTRAINT [PK_OynanacakMaclar] PRIMARY KEY CLUSTERED 
(
	[oynanacakmacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OynanmisMac]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OynanmisMac](
	[oynanmismacID] [int] IDENTITY(1,1) NOT NULL,
	[birinciTakimID] [int] NOT NULL,
	[ikinciTakimID] [int] NOT NULL,
	[tarih] [datetime] NOT NULL,
	[birinciTakimSkor] [int] NOT NULL,
	[ikinciTakimSkor] [int] NOT NULL,
	[ad] [nvarchar](100) NOT NULL,
	[birinciTakimAdi] [nvarchar](50) NOT NULL,
	[ikinciTakimAdi] [nvarchar](50) NOT NULL,
	[grupID] [int] NOT NULL,
 CONSTRAINT [PK_Maclar] PRIMARY KEY CLUSTERED 
(
	[oynanmismacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oyuncu]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncu](
	[oyuncuID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
	[golSayisi] [int] NOT NULL,
	[asistSayisi] [int] NOT NULL,
	[takimID] [int] NOT NULL,
	[sariKartSayisi] [int] NOT NULL,
	[kirmiziKartSayisi] [int] NOT NULL,
	[formaNo] [int] NOT NULL,
 CONSTRAINT [PK_Oyuncular] PRIMARY KEY CLUSTERED 
(
	[oyuncuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsor]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsor](
	[sponsorID] [int] IDENTITY(1,1) NOT NULL,
	[sponsorAdi] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Sponsor] PRIMARY KEY CLUSTERED 
(
	[sponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Takim]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Takim](
	[takimID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
	[toplamPuan] [int] NOT NULL,
	[attigiGol] [int] NOT NULL,
	[yedigiGol] [int] NOT NULL,
	[averaj] [int] NOT NULL,
	[galibiyet] [int] NOT NULL,
	[maglubiyet] [int] NOT NULL,
	[grupID] [int] NOT NULL,
	[beraberlik] [int] NOT NULL,
	[oynananMac] [int] NULL,
 CONSTRAINT [PK_Takimlar] PRIMARY KEY CLUSTERED 
(
	[takimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakimSponsor]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakimSponsor](
	[takimID] [int] NOT NULL,
	[sponsorID] [int] NOT NULL,
 CONSTRAINT [PK_TakimSponsor] PRIMARY KEY CLUSTERED 
(
	[takimID] ASC,
	[sponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[yorumID] [int] IDENTITY(1,1) NOT NULL,
	[yorumIcerigi] [nvarchar](100) NOT NULL,
	[kullaniciID] [int] NOT NULL,
	[oynanmismacID] [int] NOT NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[yorumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OynanacakMac] ADD  CONSTRAINT [DF_OynanacakMaclar_mactarihi]  DEFAULT (getdate()) FOR [mactarihi]
GO
ALTER TABLE [dbo].[OynanmisMac] ADD  CONSTRAINT [DF_Maclar_tarih]  DEFAULT (getdate()) FOR [tarih]
GO
ALTER TABLE [dbo].[OynanmisMac] ADD  CONSTRAINT [DF_Maclar_birinciTakimSkor]  DEFAULT ((0)) FOR [birinciTakimSkor]
GO
ALTER TABLE [dbo].[OynanmisMac] ADD  CONSTRAINT [DF_Maclar_ikinciTakimSkor]  DEFAULT ((0)) FOR [ikinciTakimSkor]
GO
ALTER TABLE [dbo].[Oyuncu] ADD  CONSTRAINT [DF_Oyuncular_golSayisi]  DEFAULT ((0)) FOR [golSayisi]
GO
ALTER TABLE [dbo].[Oyuncu] ADD  CONSTRAINT [DF_Oyuncular_asistSayisi]  DEFAULT ((0)) FOR [asistSayisi]
GO
ALTER TABLE [dbo].[Oyuncu] ADD  CONSTRAINT [DF_Oyuncular_sariKartSayisi]  DEFAULT ((0)) FOR [sariKartSayisi]
GO
ALTER TABLE [dbo].[Oyuncu] ADD  CONSTRAINT [DF_Oyuncular_kirmiziKartSayisi]  DEFAULT ((0)) FOR [kirmiziKartSayisi]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_toplamPuan]  DEFAULT ((0)) FOR [toplamPuan]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_attigiGol]  DEFAULT ((0)) FOR [attigiGol]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_yedigiGol]  DEFAULT ((0)) FOR [yedigiGol]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_averaj]  DEFAULT ((0)) FOR [averaj]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_galibiyet]  DEFAULT ((0)) FOR [galibiyet]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_maglubiyet]  DEFAULT ((0)) FOR [maglubiyet]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_beraberlik]  DEFAULT ((0)) FOR [beraberlik]
GO
ALTER TABLE [dbo].[Takim] ADD  CONSTRAINT [DF_Takimlar_oynadıgıMac]  DEFAULT ((0)) FOR [oynananMac]
GO
ALTER TABLE [dbo].[OynanacakMac]  WITH CHECK ADD  CONSTRAINT [FK_OynanacakMaclar_Gruplar] FOREIGN KEY([grupID])
REFERENCES [dbo].[Grup] ([grupID])
GO
ALTER TABLE [dbo].[OynanacakMac] CHECK CONSTRAINT [FK_OynanacakMaclar_Gruplar]
GO
ALTER TABLE [dbo].[OynanmisMac]  WITH CHECK ADD  CONSTRAINT [FK_Maclar_Gruplar] FOREIGN KEY([grupID])
REFERENCES [dbo].[Grup] ([grupID])
GO
ALTER TABLE [dbo].[OynanmisMac] CHECK CONSTRAINT [FK_Maclar_Gruplar]
GO
ALTER TABLE [dbo].[Oyuncu]  WITH CHECK ADD  CONSTRAINT [FK_Oyuncular_Takimlar] FOREIGN KEY([takimID])
REFERENCES [dbo].[Takim] ([takimID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Oyuncu] CHECK CONSTRAINT [FK_Oyuncular_Takimlar]
GO
ALTER TABLE [dbo].[Takim]  WITH CHECK ADD  CONSTRAINT [FK_Takimlar_Gruplar] FOREIGN KEY([grupID])
REFERENCES [dbo].[Grup] ([grupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Takim] CHECK CONSTRAINT [FK_Takimlar_Gruplar]
GO
ALTER TABLE [dbo].[TakimSponsor]  WITH CHECK ADD  CONSTRAINT [FK_TakimSponsor_Sponsor] FOREIGN KEY([sponsorID])
REFERENCES [dbo].[Sponsor] ([sponsorID])
GO
ALTER TABLE [dbo].[TakimSponsor] CHECK CONSTRAINT [FK_TakimSponsor_Sponsor]
GO
ALTER TABLE [dbo].[TakimSponsor]  WITH CHECK ADD  CONSTRAINT [FK_TakimSponsor_Takim] FOREIGN KEY([takimID])
REFERENCES [dbo].[Takim] ([takimID])
GO
ALTER TABLE [dbo].[TakimSponsor] CHECK CONSTRAINT [FK_TakimSponsor_Takim]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Kullanici] FOREIGN KEY([kullaniciID])
REFERENCES [dbo].[Kullanici] ([kullaniciID])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Kullanici]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_OynanmisMac] FOREIGN KEY([oynanmismacID])
REFERENCES [dbo].[OynanmisMac] ([oynanmismacID])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_OynanmisMac]
GO
/****** Object:  StoredProcedure [dbo].[SP_KullaniciEkle]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KullaniciEkle]
@isAdmin int,
@kullaniciAdi nvarchar(50),
@kullaniciSifre nvarchar(50)
AS
BEGIN
INSERT INTO Kullanici (isAdmin,kullaniciAdi, kullaniciSifre) VALUES (@isAdmin,@kullaniciAdi, @kullaniciSifre)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_KullaniciGuncelle]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KullaniciGuncelle]
@kullaniciID int,
@isAdmin int,
@kullaniciAdi nvarchar(50),
@kullaniciSifre nvarchar(50)
AS
BEGIN
UPDATE Kullanici SET isAdmin = @isAdmin WHERE kullaniciID = @kullaniciID
UPDATE Kullanici SET kullaniciAdi = @kullaniciAdi WHERE kullaniciID = @kullaniciID
UPDATE Kullanici SET kullaniciSifre = @kullaniciSifre WHERE kullaniciID = @kullaniciID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MacEkle]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MacEkle]
@birinciTakimID int,
@ikinciTakimID int,
@tarih datetime,
@birinciTakimSkor int,
@ikinciTakimSkor int,
@grupID int
AS
DECLARE @ad nvarchar(100)
DECLARE @birinciTakimAdi nvarchar(50)
DECLARE @ikinciTakimAdi nvarchar(50)

BEGIN
SET @birinciTakimAdi = (SELECT Takim.ad FROM Takim WHERE takimID = @birinciTakimID) 
SET @ikinciTakimAdi = (SELECT Takim.ad FROM Takim WHERE takimID = @ikinciTakimID)
SET @ad = @birinciTakimAdi + ' ' + CAST(@birinciTakimSkor AS NVARCHAR) + '-' + CAST(@ikinciTakimSkor AS NVARCHAR) + ' ' +@ikinciTakimAdi

IF (@birinciTakimSkor > @ikinciTakimSkor) BEGIN
UPDATE Takim SET Takim.galibiyet+=1 FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.maglubiyet+=1 FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.attigiGol+=@birinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol+=@ikinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.yedigiGol+=@ikinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.yedigiGol+=@birinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
END
IF (@birinciTakimSkor < @ikinciTakimSkor) BEGIN
UPDATE Takim SET Takim.galibiyet+=1 FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.maglubiyet+=1 FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol+=@birinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol+=@ikinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.yedigiGol+=@ikinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.yedigiGol+=@birinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
END
IF (@birinciTakimSkor = @ikinciTakimSkor) BEGIN
UPDATE Takim SET Takim.beraberlik+=1 FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.beraberlik+=1 FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol+=@birinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol+=@ikinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.yedigiGol+=@ikinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.yedigiGol+=@birinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
END

INSERT INTO OynanmisMac (birinciTakimID, ikinciTakimID,tarih, birinciTakimSkor, ikinciTakimSkor, ad, birinciTakimAdi, ikinciTakimAdi,grupID)
VALUES (@birinciTakimID, @ikinciTakimID,@tarih, @birinciTakimSkor, @ikinciTakimSkor, @ad, @birinciTakimAdi, @ikinciTakimAdi,@grupID)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MacSil]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MacSil]
@oynanmismacID int
AS
DECLARE @birinciTakimID int
DECLARE @ikinciTakimID int
DECLARE @tarih int
DECLARE @birinciTakimSkor int
DECLARE @ikinciTakimSkor int
DECLARE @grupID int

BEGIN
SET @birinciTakimSkor = (SELECT OynanmisMac.birinciTakimSkor FROM OynanmisMac WHERE oynanmismacID = @oynanmismacID)
SET @ikinciTakimSkor = (SELECT OynanmisMac.ikinciTakimSkor FROM OynanmisMac WHERE oynanmismacID = @oynanmismacID)
SET @birinciTakimID = (SELECT OynanmisMac.birinciTakimID FROM OynanmisMac WHERE oynanmismacID = @oynanmismacID)
SET @ikinciTakimID = (SELECT OynanmisMac.ikinciTakimID FROM OynanmisMac WHERE oynanmismacID = @oynanmismacID)

IF (@birinciTakimSkor > @ikinciTakimSkor) BEGIN
UPDATE Takim SET Takim.galibiyet-=1 FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.maglubiyet-=1 FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.attigiGol-=@birinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol-=@ikinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.yedigiGol-=@ikinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.yedigiGol-=@birinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
END
IF (@birinciTakimSkor < @ikinciTakimSkor) BEGIN
UPDATE Takim SET Takim.galibiyet-=1 FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.maglubiyet-=1 FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol-=@birinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol-=@ikinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.yedigiGol-=@ikinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.yedigiGol-=@birinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
END
IF (@birinciTakimSkor = @ikinciTakimSkor) BEGIN
UPDATE Takim SET Takim.beraberlik-=1 FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.beraberlik-=1 FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol-=@birinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.attigiGol-=@ikinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
UPDATE Takim SET Takim.yedigiGol-=@ikinciTakimSkor FROM Takim WHERE takimID = @birinciTakimID
UPDATE Takim SET Takim.yedigiGol-=@birinciTakimSkor FROM Takim WHERE takimID = @ikinciTakimID
END
DELETE FROM OynanmisMac WHERE oynanmismacID = @oynanmismacID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SponsorEkle]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SponsorEkle]
@sponsorAdi nvarchar(50)
AS
BEGIN
INSERT INTO Sponsor(sponsorAdi) VALUES (@sponsorAdi)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SponsorGuncelle]    Script Date: 16.12.2019 16:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SponsorGuncelle]
@sponsorID int,
@sponsorAdi nvarchar(50)
AS
BEGIN
INSERT INTO Sponsor(sponsorID, sponsorAdi) VALUES (@sponsorID, @sponsorAdi)
END
GO
