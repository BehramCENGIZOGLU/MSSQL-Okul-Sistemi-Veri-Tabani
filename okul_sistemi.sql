-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 Kas 2020, 14:26:50
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `okul_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolum`
--

CREATE TABLE `bolum` (
  `ID` int(11) NOT NULL,
  `bolum_adi` text COLLATE utf8_turkish_ci NOT NULL,
  `kapasitesi` int(11) NOT NULL,
  `hocaID` int(11) NOT NULL,
  `okulID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisanlar`
--

CREATE TABLE `calisanlar` (
  `ID` int(11) NOT NULL,
  `ad` text COLLATE utf8_turkish_ci NOT NULL,
  `soyad` text COLLATE utf8_turkish_ci NOT NULL,
  `tcno` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `ev_adres` text COLLATE utf8_turkish_ci NOT NULL,
  `kan_grubu` text COLLATE utf8_turkish_ci NOT NULL,
  `e-mail` text COLLATE utf8_turkish_ci NOT NULL,
  `dogum_tarihi` date NOT NULL,
  `okulID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hoca`
--

CREATE TABLE `hoca` (
  `ID` int(11) NOT NULL,
  `ad` text COLLATE utf8_turkish_ci NOT NULL,
  `soyad` text COLLATE utf8_turkish_ci NOT NULL,
  `tcno` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `ev_adres` text COLLATE utf8_turkish_ci NOT NULL,
  `kan_grubu` text COLLATE utf8_turkish_ci NOT NULL,
  `e-mail` text COLLATE utf8_turkish_ci NOT NULL,
  `bolumID` int(11) NOT NULL,
  `doğum_tarihi` date NOT NULL,
  `okulID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notlar`
--

CREATE TABLE `notlar` (
  `ID` int(11) NOT NULL,
  `bolumID` int(11) NOT NULL,
  `ogrenciID` int(11) NOT NULL,
  `ogrenci_not_ortalaması` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenci`
--

CREATE TABLE `ogrenci` (
  `ID` int(11) NOT NULL,
  `ad` text COLLATE utf8_turkish_ci NOT NULL,
  `soyad` text COLLATE utf8_turkish_ci NOT NULL,
  `tcno` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `ev_adres` text COLLATE utf8_turkish_ci NOT NULL,
  `kan_grubu` text COLLATE utf8_turkish_ci NOT NULL,
  `e-mail` text COLLATE utf8_turkish_ci NOT NULL,
  `doğum_tarihi` date NOT NULL,
  `giris_puani` int(11) NOT NULL,
  `bolumID` int(11) NOT NULL,
  `notID` int(11) NOT NULL,
  `okulID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenci_isleri`
--

CREATE TABLE `ogrenci_isleri` (
  `ID` int(11) NOT NULL,
  `calisanlarID` int(11) NOT NULL,
  `bolumID` int(11) NOT NULL,
  `hocaID` int(11) NOT NULL,
  `ogrenciID` int(11) NOT NULL,
  `okulID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `okul`
--

CREATE TABLE `okul` (
  `ID` int(11) NOT NULL,
  `okul_adi` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bolum`
--
ALTER TABLE `bolum`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `hocaID` (`hocaID`),
  ADD KEY `okulID` (`okulID`);

--
-- Tablo için indeksler `calisanlar`
--
ALTER TABLE `calisanlar`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `okulID` (`okulID`);

--
-- Tablo için indeksler `hoca`
--
ALTER TABLE `hoca`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `bolumID` (`bolumID`),
  ADD KEY `okulID` (`okulID`);

--
-- Tablo için indeksler `notlar`
--
ALTER TABLE `notlar`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `bolumID` (`bolumID`),
  ADD KEY `ogrenciID` (`ogrenciID`);

--
-- Tablo için indeksler `ogrenci`
--
ALTER TABLE `ogrenci`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `bolumID` (`bolumID`),
  ADD KEY `okulID` (`okulID`),
  ADD KEY `notID` (`notID`);

--
-- Tablo için indeksler `ogrenci_isleri`
--
ALTER TABLE `ogrenci_isleri`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `calisanlarID` (`calisanlarID`),
  ADD KEY `bolumID` (`bolumID`),
  ADD KEY `hocaID` (`hocaID`),
  ADD KEY `ogrenciID` (`ogrenciID`),
  ADD KEY `okulID` (`okulID`);

--
-- Tablo için indeksler `okul`
--
ALTER TABLE `okul`
  ADD PRIMARY KEY (`ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bolum`
--
ALTER TABLE `bolum`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `calisanlar`
--
ALTER TABLE `calisanlar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `notlar`
--
ALTER TABLE `notlar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ogrenci`
--
ALTER TABLE `ogrenci`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ogrenci_isleri`
--
ALTER TABLE `ogrenci_isleri`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `okul`
--
ALTER TABLE `okul`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
