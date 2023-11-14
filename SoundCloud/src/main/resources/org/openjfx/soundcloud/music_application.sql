-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 14, 2023 at 03:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_application`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `artistID` int(11) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `artist_management_company` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`artistID`, `artist_name`, `short_description`, `artist_management_company`, `birth_date`) VALUES
(0, 'HIEUTHUHAI', 'Trần Minh Hiếu, thường được biết đến với nghệ danh HIEUTHUHAI hay cách viết khác là hieuthuhai, là một nam rapper, ca sĩ kiêm sáng tác nhạc và diễn viên người Việt Nam. Anh hiện đang là thành viên của nhóm nhạc Gerdnang', 'Gerdnang', '1999-09-28'),
(1, 'Sia', 'Sia Kate Isobelle Furler, hay thường được biết đến với cái tên ngắn gọn là Sia, là một ca sĩ kiêm sáng tác nhạc, nhà sản xuất thu âm và đạo diễn video âm nhạc người Úc. ', 'No information', '1975-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genreID` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genreID`, `genre_name`) VALUES
(0, 'Pop'),
(1, 'Rock'),
(2, 'RAP');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `playlistID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`playlistID`, `userID`, `name`) VALUES
(0, 0, 'My Playlist'),
(2, 0, 'RNB'),
(3, 0, 'Rap'),
(4, 1, 'Ai Cũng Phải Bắt Đầu Từ Đâu Đó'),
(5, 1, 'Everyday Is Christmas'),
(6, 1, 'LOVE6'),
(7, 1, 'Luv(sic) Hexalogy'),
(8, 1, 'Her Loss'),
(9, 1, 'American Teen');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `songID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `length_minutes` int(11) DEFAULT NULL,
  `released_date` date DEFAULT NULL,
  `lyrics` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`songID`, `name`, `length_minutes`, `released_date`, `lyrics`) VALUES
(0, 'Ai Cũng Phải Bắt Đầu Từ Đâu Đó', 2, '2023-10-16', '[Lời bài hát \"Ai Cũng Phải Bắt Đầu Từ Đâu Đó\" bởi HIEUTHUHAI]\r\n\r\n[Intro: Kewtiie]\r\n(Hey, Kewtiie)\r\n\r\n[Verse]\r\nTụi nó nói là tao muốn tiền và name\r\nĐúng rồi tao đó, chắc mày thì không?\r\nTao còn cần nhiều hơn cả quyền và fame, mài nhọn cây viết và tạo kì công\r\nĐành phải buông bàn tay em đi để mà cầm lái AMG\r\nĐâu còn cái giá 12 tiếng trước, nếu muốn thì pay thêm fee\r\n\r\nTao đi từ \"Thằng này, mày là ai?\" cho tới \"Đâu cần phải giới thiệu chú\"\r\nTừng là dấu chấm hỏi của cả Việt Rap, giờ là câu trả lời cho ai là triệu phú\r\nDẫm ga, tao chỉ phóng và phóng, chân tao chưa từng nhùn\r\nKhông ai có thể cản, phanh tao chưa từng dùng\r\nĐừng có nhận người quen nếu mình chưa mừng cùng\r\nCuộc hẹn với chiến thắng tao vẫn chưa từng bùng\r\n\r\nQua năm 23 tao vẫn cao dần (cao dần), xem ở trong tương lai tao còn bao lần (Bao lần)\r\nTụi nó nói tao nằm mơ khi tao nói, mỗi ngày viết thêm một verse là tao có thứ mà tao cần\r\nThời gian mà tao bỏ ra để mà giết vài con beat thì nó đang nằm ngay ngắn ở trên Cartier\r\nVà những gì tao nói cũng đã thành sự thật, không cần ai tin giống như Galileo, yeah, hold up\r\n\r\nTụi mày có mấy thằng anh chống lưng mà vẫn muốn so sánh mong là ta bằng nhau\r\nTao chỉ có cả tương lai phía trước cộng thêm rất nhiều tỉ đang nằm ở đằng sau (huh)\r\nMục tiêu của tao ở trong top (trong top), mục tiêu của mày chính là tao\r\nNó chỉ mong là tao sẽ ăn phốt, nghe album tao drop thì bao thằng thi lo (Thi lo)\r\nYou might also like\r\nSiêu Sao\r\nHIEUTHUHAI\r\nGiờ Thì Ai Cười\r\nHIEUTHUHAI\r\nSắp Nổi Tiếng\r\nHIEUTHUHAI\r\nKewtiie trên beat và we on (we on), Prada và Christian Dior (Dior)\r\nSố một đứng cạnh cùng số hai thì nó vẫn là tao khi after before (Before)\r\nSẽ không bao giờ tao dừng lại, tao không hề ngủ quên những lúc mà khi no\r\nNên chỉ có đeo thêm vài cọng dây chuyền sẽ là cách duy nhất tăng thêm vài ki-lô (ki-lô)\r\n\r\nVà tao chỉ thua khi tự cắn vào đuôi như là rắn săn mồi\r\nTụi nó đâu biết tao lớn lên ở Hóc Môn, đêm nằm dưới căn chòi\r\nChỉ biết rockstar lifestyle nhưng mà đâu ai thấy tất cả thứ sau nó (No one)\r\nCô đơn, phòng tối và chiếc bóng, ai cũng phải bắt đầu từ đâu đó\r\n\r\n[Chorus]\r\nThrowing dirt on my fucking name, wanna try me out? (Try me out)\r\nĐã bao năm, thời gian cũng trôi qua, mày vẫn ở đó sao?\r\nĐứng trên show mà sao ở bên tai toàn là tên của tao?\r\nTên của tao, ao-ao-ao'),
(1, 'Giờ Thì Ai Cười', 3, '2023-10-16', '[Lời bài hát \"Giờ Thì Ai Cười\" bởi HIEUTHUHAI]\n\n[Intro: Kewtiie]\n(Hey, Kewtiie)\n\n[Verse 1: HIEUTHUHAI]\nShow khi xưa chỉ có hai người\nStage outdoor, giờ thì chẳng thấy ai ngồi\nBa năm thôi mà tao đứng headline rồi\nTrí kế toán nó vừa gọi tao, nói đống tiền trong bank của tao đang sắp có thai òi\nGia đình mày còn trong fandom của tao, đâu chỉ là underground\nNhững thành tựu mày mơ còn nằm dưới chân của tao\nGiờ nhìn tao làm sao, vậy mày nói thử ai cười? (Ai?)\n\nVà nhiều em đi theo coi show, DM cho tao, nói muốn tình một đêm\nTao thì đi chung năm anh em, nhưng đây không phải là 2 Ngày 1 Đêm\nNhiều thằng trong RV bao năm qua đu fame tao, nó đang chờ đọc tên\nRa hai con A nên anh đâu cần bọt thêm\n\nTụi nó phì cười khi bắt gặp tao trong chợ bàn cờ và đi mua hàng si\nGiờ nó đâu biết là bốn chai, hai lít, một ngày là số tiền tao kiếm được từ việc không làm gì\nKhông cần bling hay là tee camo bape, giờ tao chỉ repping lại cho cái khăn rằn ri\nGiờ là thời đại nào rồi? Tao không mặc skinny jeans\nTụi mày làm tao cười, ướt cả hai hàng mi (Ha-ha-ha)\n\nGhi thêm chap khi tụi tao càng đi\nChỉ cần nghe tao rap là em bung hàng khuy\nMột lần taking shot là bay nguyên hàng ly\nNhìn tụi tao quăng miếng xong rồi gom vàng đi\nVậy mà không bay à?\nNgoài show Nam Bắc, bây giờ Đông Tây\nNhìn tụi tao jetlag vậy mà không cay à?\nKhi mày không thể cười những lần không có bóng nằm ở trong tay\nYou might also like\nExit Sign\nHIEUTHUHAI\nIs It Over Now? (Taylor’s Version) [From The Vault]\nTaylor Swift\nTừng Quen\nWren Evans\n[Hook: HIEUTHUHAI]\nVậy mà show khi xưa của tao hôm đó chỉ có hai người (Let\'s go! Let\'s go!)\nGiờ thì stage outdoor, full ghế, nhìn mãi chẳng thấy ai ngồi (Ooh)\nChỉ cần ba năm thôi, tên tao đã đứng trên headline rồi (Hah-hah)\nTiền tao sắp có thai rồi, ha-ha-ha, giờ thì ai cười?\n\nVậy mà show khi xưa của tao hôm đó chỉ có hai người (Chỉ là hai người thôi)\nGiờ thì stage outdoor, full ghế, nhìn mãi chẳng thấy ai ngồi (Oh, V)\nChỉ cần ba năm thôi, tên tao đã đứng trên headline rồi (Tap-ta)\nTiền tao sắp có thai rồi, ha-ha-ha, giờ thì ai cười?\n\n[Verse 2: HIEUTHUHAI]\nCộng đồng fan của tụi tao có ở ba miền\nTừ bà con tới anh em giống như gia truyền\nMột ngày dẫn cả RV như là A Xìn\nCòn lại thời gian lên TV quăng miếng ra tiền\nMiệng mày chê nhưng thâm tâm thì lại ước\nNhìn thằng nào cũng đang phải cố để hài hước\nMà dù làm nhạc hay tỏ ra mình hài hước\nKhi năm giây thì đã lướt thì tao cá là tụi mày đều chẳng thể kiếm được ra tiền\n\nĐã bao nhiêu lâu tao phải nghe mỗi một câu là rapper thì chỉ nên tập trung rap?\nHay là bây giờ cần phải sống đa nhân cách và đặt thêm nghệ danh khác mỗi khi tao cầm mic hát?\nNói toàn là fact nên không cần phải vào vai, ở đây không có Idecaf\nNhìn tao cà hẩy, em nói nhớ về Eiffel trong khi xưa nay tao chưa bao giờ đi Pháp (Woah)\nNghe trong nhạc tao không cần đọc, toàn độ hiệu rồi ở ngoài mua đồ fake về đâu? Ay\nCho nên đừng trách sao không còn nhìn mặt mày chỉ bởi vì chẳng có mắt đằng sau\nTao chỉ biết kiếm cho gia đình nhiều tiền và vừa rồi cầm được cùng vài lô, ay\nBằng bài nhạc không chiều sâu, ay, bằng vài bài rap một màu\n\n[Hook: HIEUTHUHAI]\nVậy mà show khi xưa của tao hôm đó chỉ có hai người (Let\'s go! Let\'s go!)\nGiờ thì stage outdoor, full ghế, nhìn mãi chẳng thấy ai ngồi (Ooh)\nChỉ cần ba năm thôi, tên tao đã đứng trên headline rồi (Hah-hah)\nTiền tao sắp có thai rồi, ha-ha-ha, giờ thì ai cười?\n\nVậy mà show khi xưa của tao hôm đó chỉ có hai người (Chỉ là hai người thôi)\nGiờ thì stage outdoor, full ghế, nhìn mãi chẳng thấy ai ngồi (Oh, V)\nChỉ cần ba năm thôi, tên tao đã đứng trên headline rồi (Tap-ta)\nTiền tao sắp có thai rồi, ha-ha-ha, giờ thì ai cười?'),
(2, 'Không Phải Gu', 3, '2023-10-16', '[Lời bài hát \"Không Phải Gu\" bởi HIEUTHUHAI, B Ray, TAGE]\r\n\r\n[Intro: Kewtiie]\r\n(Hey, Kewtiie)\r\n\r\n[Hook: HIEUTHUHAI]\r\nKhông phải gu (gu)\r\n11 giờ tối là là lên Lounge hút bóng thì chắc chắn đó là không phải gu\r\nFanpage quán bar nào em cũng có ảnh cười với hàm răng sứ thì là không phải gu (sorry, hah)\r\nTrên bio ghi no Twitter (no), không phải gu\r\nKhó để anh phải hit dù nhắm mắt, uhm\r\nVì là không phải gu\r\n\r\n[Verse 1: HIEUTHUHAI]\r\nAnh này không hôn và cũng không go down nếu như không phải su\r\nComment toàn nói nhạc đẹp trai thì anh không cãi luôn vì ông trời bắt anh trông phải cool\r\nĐường cong này, anh cua mượt (cool), all in vào là vua cược (Let\'s go!)\r\nĐua coi ai tới đỉnh trước thì anh thua cuộc và cảm giác như không có ai anh không thể cua được, uhm-mm\r\n\r\nDiễn viên hay người mẫu Venus? (Venus), em còn lớn hơn anh, đoán y hệt (Yeah)\r\nVậy mà muốn kêu anh là ba đường, mỗi lần anh rock full cây Adidas\r\nChuyện tình trước của em nhiều đắng cay nên giờ cần tìm đến anh để thử nếm vị ngọt\r\nVậy mình không cùng gu vì nhà em không hề khó nhưng mà em quen anh, em sẽ bị đòn (Ah)\r\n\r\nVà anh thích những người business, kinh doanh, làm ăn, nhập hàng về buôn nà\r\nGu của anh là mấy cô khó đoán chứ không phải nhìn phát là biết làm nghề gì luôn nà\r\nHình em gửi trên mạng cũng có đầy rồi mà xem một lần rồi thôi, không phải lưu (No, no, no, no)\r\nLần đầu gặp, em muốn đi ăn gì? (Anh) là điển hình của việc không phải gu (Woh)\r\n\r\n[Hook: HIEUTHUHAI]\r\n11 giờ tối là là lên Lounge hút bóng thì chắc chắn đó là không phải gu\r\nFanpage quán bar nào em cũng có ảnh cười với hàm răng sứ thì là không phải gu (sorry, hah)\r\nTrên bio ghi no Twitter (no), không phải gu\r\nKhó để anh phải hit dù nhắm mắt, uhm\r\nVì là không phải gu (let\'s go!)\r\n\r\n11 giờ tối là là lên Lounge hút bóng thì chắc chắn đó là không phải gu (for sure)\r\nFanpage quán bar nào em cũng có ảnh cười với hàm răng sứ thì là không phải gu (nah)\r\nTrên bio ghi no Twitter (woh), không phải gu\r\nKhó để anh phải hit dù nhắm mắt\r\nVì là không phải gu\r\n\r\n[Verse 2: B Ray]\r\nNa-na-na-nah, không phải gu đâu (Cool)\r\nCười cười, lấy tay vịn vịn là đang bị thân quá mức mình nhu cầu\r\nNói chuyện chữ được, chữ có do hút bóng tới mức nó hư đầu (Na-na-na-nah)\r\nVẫn dây dưa với bạn trai cũ, motherfucker, một thằng ngu lâu\r\n\r\nBut I can take you down mặc dù anh biết em chẳng phải gu anh\r\nKhông có một đường cong nào mà anh lái không rành\r\nNếu muốn hôn anh thì phải khéo, biết nhìn phải, trái, xung quanh (Watch out!)\r\nCòn nếu thương anh thì phải thương luôn cả bạn gái của anh (Anh thương bạn gái)\r\n\r\nGu anh girl ít nói, đang lạc lối đi kiếm tình yêu (Em)\r\nGu anh không thích xài tiền thối, cần thì gọi để có tiền tiêu\r\nCái gì cũng có giá cả nhưng lời nào trả thì cũng phải kiêu\r\nAnh biết trông anh thì khá giả nhưng anh vẫn luôn luôn keep it real\r\nĐó là không phải\r\n[Hook: HIEUTHUHAI]\r\nKhông phải gu (Gu)\r\n11 giờ tối là là lên Lounge hút bóng thì chắc chắn đó là không phải gu\r\nFanpage quán bar nào em cũng có ảnh cười với hàm răng sứ thì là không phải gu (Hah)\r\nTrên bio ghi no Twitter (man), không phải gu\r\nKhó để anh phải hit dù nhắm mắt, uhm\r\nVì là không phải gu (Let\'s go!)\r\n\r\n11 giờ tối là là lên Loungе hút bóng thì chắc chắn đó là không phải gu (For sure)\r\nFanpage quán bar nào em cũng có ảnh cười với hàm răng sứ thì là không phải gu (Nah)\r\nTrên bio ghi no Twittеr, không phải gu\r\nKhó để anh phải hit dù nhắm mắt, uhm\r\nVì là không phải (Tage) gu\r\n\r\n[Verse 3: TAGE]\r\nTiếng bước chân ai nhẹ tiến thêm gần lại và ngồi riêng một góc trên tầng hai\r\nHé đôi môi ngoan, em khẽ gọi bồi bàn đang vội tay cầm bóng tay cầm chai rượu\r\nBuccellati luôn đeo trên ngực, chuông reo liên tục như là số máy tổng đài (Reng)\r\nCombo after combo, keep comin\', hit \'em up \'til sunrise\r\n\r\nFacebook, Instagram đăng single status như thể là chưa ai chinh phục em được, ah\r\nBar club quanh thủ đô này booking đều quen mặt cô nàng sinh hoạt đêm muộn, ah\r\nLia đôi mắt xem thường all the girls with \'em fast fashion, ah\r\nAston Martin thường rinh về dinh thự nhưng mà claiming Independent\r\n\r\nĐóa hồng phai tàn, walkin\' hai hàng, that\'s a long night (Ooh)\r\nSunglasses Versace, tay che mặt, yeah, phong thái (Ooh)\r\nViên nhộng xanh, đỏ đặt trên bàn, chọn một trong hai\r\nKhuyên em rằng take that red one để mà biết là không phải gu'),
(3, 'Siêu Sao', 3, '2023-10-16', '[Lời bài hát \"Siêu Sao\" bởi HIEUTHUHAI]\r\n\r\n[Intro: HIEUTHUHAI, Kewtiie]\r\n(Ah)\r\nTao đã, tao đã, tao đã trở nên siêu sao\r\n(Hey, Kewtiie)\r\n\r\n[Verse 1]\r\nTao đã trở nên siêu sao nên chẳng bao giờ xuề xòa\r\nVà phải cắt móng tay tao đây khi cô ta mời về nhà\r\nChỉ vài phút trong studio, Kewtiie thốt lên là \"Eureka\"\r\nNó nói lại hít giồi, hít giồi, ay\r\n\r\nFangirl đừng DM, đừng send nude, anh không có nhu cầu\r\nTelesale giới thiệu đất vì nó biết thứ mà anh mưu cầu\r\nAnh chỉ cần một tin nhắn có thể biến baby thành model\r\nAnh chỉ cần một tin nhắn em cũng có thể quay về như lúc đầu, for reeal, ay\r\n\r\nLiếc qua nhưng mà sao đây? Ta không quen (Không quen)\r\nĐừng nhìn rồi viết y chang, thôi đi, tao đâu cho chép (No)\r\nTụi mày toàn cheating thôi, yeah, boy, we\'re not the same (Same)\r\nTao phải có tới năm em, ay, nếu baby cho phép, ah\r\n\r\nBây giờ tao đi lên mainstream nhưng đâu có ngán ai\r\nThằng hề này khai ra đi, mày chi bao nhiêu cho mấy trang bán like?\r\nTao chán với việc phải nghe nhạc một flow mà tụi mày khoe\r\nLàm tao nghi mày và ngu si cùng một phe\r\nYou might also like\r\nĐánh Đổi\r\nObito (VNM)\r\nKhông Phải Gu\r\nHIEUTHUHAI\r\nHit Me Up\r\nBinz Da Poet\r\n[Hook]\r\nKhi tao chính là siêu sao (sao), chính là siêu sao (Sao)\r\nCứ có tên tao thì mày biết nó view cao (Tất nhiên rồi)\r\nShowbiz, underground, nhiều thằng muốn thủ tiêu tao\r\nNhưng mà hit vẫn nghêu ngao, tao cần cố chứng minh sao?\r\n\r\nKhi tao chính là siêu sao (sao), chính là siêu sao (Sao)\r\nI do it for my city vì thành phố rất yêu tao (They love me)\r\nChẳng phải tung hint đầy mặt báo lúc yêu nhau\r\nNhưng mà hit vẫn nghêu ngao, tao cần cố chứng minh sao?\r\n\r\n[Verse 2]\r\nLời viết ra toàn chung chung, đừng nhắn tin tao mà xin feat, man\r\nKhông xăm mã vạch lên đầu, nhìn vô tên tao tụi nó biết hit, man\r\nFilter giá cao đến thấp, đó là cách mà tao hay mua hàng\r\nĐể lại một dấu chấm, đó là cách tao đã cua nàng\r\n\r\nLà bạn gái của tụi mày chứ còn là ai?\r\nĐâu phải là một người nổi tiếng thì lên nhạc tao sẽ phải nice\r\nNhạc bạn xàm thì cho xin lỗi, nhưng tôi không biết bạn là ai, ay\r\n\r\nTrong phòng thu ngồi nháp mấy câu vậy thôi, nhạc tao trending hàng loạt (Hàng loạt)\r\nNên không cần phải diễn nữa đâu dù bây giờ như ngôi sao màn bạc (Màn bạc)\r\nTao được lòng đại chúng thì mấy nhóc con kêu nhạc tao không được art\r\nCòn mấy thằng hip-hop lắm luôn sao không trả tiền produce bài nhạc?\r\nTất cả là fake từ view, comment và lyrics mày cũng là fake\r\nBệnh ngôi sao đi sau gameshow hiện nguyên hình ngay (Ha-ha)\r\nNhìn tao đi xa, bao nhiêu đêm cũng tới được đây\r\nChỉ để quay về dạy cho mày biết rap sao là bay\r\n\r\n[Hook]\r\nKhi tao chính là siêu sao (sao), chính là siêu sao (Huh, huh)\r\nCứ có tên tao thì mày biết nó view cao (Tất nhiên rồi)\r\nShowbiz, underground, nhiều thằng muốn thủ tiêu tao\r\nNhưng mà hit vẫn nghêu ngao, tao cần cố chứng minh sao?\r\n\r\nKhi tao chính là siêu sao (hả?), chính là siêu sao (Hả?)\r\nI do it for my city vì thành phố rất yêu tao (Ok, ok)\r\nChẳng phải tung hint đầy mặt báo lúc yêu nhau\r\nNhưng mà hit vẫn nghêu ngao, tao cần cố chứng minh sao?\r\n\r\n[Outro]\r\nDo that Southside creed, fire, fire the Southside creed\r\nWho needs the Southside creed?\r\nWe\'d wait for Southside creed\r\nAnd then we- 12, nào, put your hands up (Put your hands up)\r\nYou\'re fuckin\' bitch, you, put your hands up'),
(4, 'Đi Họp Lớp', 3, '2023-10-16', '[Lời bài hát \"Đi Họp Lớp\" bởi HIEUTHUHAI]\r\n\r\n[Intro]\r\nAy\r\n\r\n[Verse 1]\r\nVừa có thêm KPI sau khi mà em bước về nhà\r\nCăn phòng 20m vuông mà em đi thuê ở thành phố lạ\r\nSau hơn mười tiếng tăng ca, không cầm tay ai ngoài trừ tay lái\r\nEm còn không đủ thời gian suy nghĩ ai sẽ chăm sóc em khi về già\r\nYeah, yeah, I feel, yah\r\n\r\nĐã lâu rồi em không còn cười khi em có nhiều ca\r\nEm chạnh lòng khi 8/3 đồng nghiệp nhận nhiều hoa\r\nNhưng mà lại từ người em vừa chia tay chính thức vào chiều qua\r\nYeah, baby, I feel, yah\r\n\r\nNăm 16, em xa gia đình\r\nEm hiểu nước mắt của mẹ khi em có người cha đa tình\r\nVà nhiều vết sẹo trong tim nhưng không hằn nó lên da mình\r\nEm luôn phải che khuyết điểm ngay cả khi không một ai nhìn\r\n\r\nNên em vẫn luôn có thể sẵn sàng nhận thêm nhiều job (Job, job)\r\nĐể mà viện cớ, lấy lý do không đi họp lớp (Lớp, lớp)\r\nPhải ngồi nghe đứa thành đạt vừa đi du lịch nơi lạnh nhất\r\nVậy mà nói về những triết lý là tiền không mua được hạnh phúc\r\nYou might also like\r\nNgười Miền Núi Chất\r\nDouble2T\r\nĐánh Đổi\r\nObito (VNM)\r\nSimp Gái 808\r\nLow G (VNM)\r\n[Hook]\r\nEm có thể ngồi tới mai, nhưng chẳng thể cười với ai\r\nNhìn bạn bè làm mấy chai, so cuộc đời ai vui\r\nVà ngày họp chẳng thiếu ai, chỉ ngoài trừ hai người\r\nNghĩ là mọi chuyện tốt hơn vào một ngày khi ta lớn\r\nGiờ thì chỉ cần có ai ôm mình vào ngay vai\r\nLà đủ đề bật khóc ngay hết cả một đêm dài, oh-oh-oh\r\n\r\n[Verse 2]\r\nVà tao vừa được trở về nhà sau 10 ngày quay\r\nMỗi một ngày chỉ ngủ bốn tiếng và ba tao nói là \"Thằng này hay\"\r\nVấn đề lớn nhất của tao là không hài lòng được đâu\r\nNhiều lần chân tao đã chạm đáy nhưng nó nói như thể là thằng này may\r\n\r\nYeah, my man, tao đi từ runway (runway), leo lên xe, họp fan ở sân bay (Sân bay)\r\nStay up late, can\'t see my Sunday (Sunday)\r\nLuôn đưa tay và ăn cùng no say nhưng mà lâu nay trong showbiz bao nhiêu người thân đây?\r\nI don\'t know\r\nBao comment và bao lời chê có thể làm tao đau\r\nFan của tao còn sẽ làm fan của tao được bao lâu?\r\nĐến tận sau này, đứng ở trên sân khấu này thêm được bao lâu? Yeah\r\n\r\nTao vẫn luôn có thể sẵn sàng nhận thêm nhiều job (Job, job)\r\nĐể mà viện cớ, lấy lý do không đi họp lớp (Lớp, lớp)\r\nKhông muốn là thằng thành đạt vừa đi du lịch nơi lạnh nhất\r\nVậy mà nói về những triết lý là tiền không mua được hạnh phúc\r\n[Hook]\r\nEm có thể ngồi tới mai, nhưng chẳng thể cười với ai\r\nNhìn bạn bè làm mấy chai, so cuộc đời ai vui\r\nVà ngày họp chẳng thiếu ai, chỉ ngoài trừ hai người\r\nNghĩ là mọi chuyện tốt hơn vào một ngày khi ta lớn\r\nGiờ thì chỉ cần có ai ôm mình vào ngay vai\r\nLà đủ đề bật khóc ngay hết cả một đêm dài, oh-oh-oh\r\n\r\n[Bridge]\r\nNgoài những khi gặp fan, được đứng trên sân khấu và hát\r\nĐi diễn về và ngồi trên xe, xem story mà tao được tag\r\nThì tao khó kiếm được niềm vui, chẳng thấy hạnh phúc, and that\'s a fact\r\nTao không biết làm mình cười nhưng lại rất giỏi làm cho người khác\r\nĐừng so sánh, chẳng có gì đâu mà so\r\nNghĩ tao có tất cả, tao chỉ có âu và lo\r\nHunger tao có vấn đề, nó chẳng biết đâu là no\r\nVà tao mong cũng sẽ tới một ngày chẳng có lý do mà tao không đi họp lớp\r\n\r\n[Outro]\r\nEm có thể ngồi tới mai, yeah, yeah\r\nChẳng cười với ai, yeah, yeah, yeah\r\nHọp chẳng thiếu ai, uh-oh\r\nNhưng mà nhìn ở trong ta chính là hai người'),
(5, 'Không Thể Say', 4, '2023-10-16', '[Lời bài hát \"Không Thể Say\" bởi HIEUTHUHAI]\r\n\r\n[Intro: Kewtiie]\r\n(Hey, Kewtiie)\r\n\r\n[Chorus: HIEUTHUHAI]\r\nĐã hơn một năm trôi qua mà mẹ vẫn thế, cứ tiếc đôi ta\r\nXoá cả hình xăm trên da, chuyện tình mình cũng chẳng thể phôi pha\r\nChắc cũng đã lâu anh không muốn say mà\r\nCuối cùng là hôm nay anh lại nhớ tới em\r\nCó thể sẽ phone cho em và sẽ lại nói \"anh vẫn yêu em\"\r\nBấm chuông nhà em trong đêm và hàng ngàn thứ biết chắc không nên\r\nHứa trong lòng anh sẽ không uống thêm được\r\nVì em là lý do số một làm cho anh không thể say\r\n\r\n[Verse 1: HIEUTHUHAI]\r\nAnh giờ đây thì vẫn đang cố quên những ngày ta còn được nằm ở bên\r\nCó thêm thành công hay kiếm thêm nhiều tiền\r\nĐược biết tên bởi nhiều người chẳng giúp anh nở nụ cười được nữa đâu (đâu, đâu, đâu)\r\nBởi vì đằng sau ánh đèn, ở cạnh anh thì chẳng có ai\r\nVà cũng đã cố gắng để yêu thêm rất nhiều, mặc dù biết là điều đó sai\r\nCó lẽ anh chẳng thể yêu thêm\r\nGiờ mọi thông báo anh luôn mong là của em\r\n\r\n[Pre-Chorus: HIEUTHUHAI]\r\nƯớt ở trên mi\r\nMỗi lần qua từng nơi dấu chân ta đi\r\nGiờ còn đâu tình yêu lúc không là gì\r\nUống thêm là vì nước mắt anh rơi vào tận trong ly\r\nChúng ta không sai\r\nNhưng giờ đây làm sao để em quay lại?\r\nNhà và xe làm chi ngóng trông em hoài\r\nThức cả đêm dài, muốn em bên anh phải gọi thêm chai\r\nYou might also like\r\nNOLOVENOLIFE\r\nHIEUTHUHAI\r\nExit Sign\r\nHIEUTHUHAI\r\nHit Me Up\r\nBinz Da Poet\r\n[Chorus: HIEUTHUHAI]\r\nĐã hơn một năm trôi qua mà mẹ vẫn thế, cứ tiếc đôi ta\r\nXoá cả hình xăm trên da, chuyện tình mình cũng chẳng thể phôi pha\r\nChắc cũng đã lâu anh không muốn say mà\r\nCuối cùng là hôm nay anh lại nhớ tới em\r\nCó thể sẽ phone cho em và sẽ lại nói \"anh vẫn yêu em\"\r\nBấm chuông nhà em trong đêm và hàng ngàn thứ biết chắc không nên\r\nHứa trong lòng anh sẽ không uống thêm được\r\nVì em là lý do số một làm cho anh không thể say\r\n\r\n[Verse 2: HIEUTHUHAI]\r\nBiết chắc chắn chẳng thể nào lại gặp nhau ở trên đường đời\r\nVà chỉ muốn ước mai sau em sẽ gặp thêm một ai tuyệt vời\r\nAnh cũng sẽ đi tiếp tục, chẳng tổn thương người đến sau nhiều như em\r\nVì anh đã từng thấy em đây phải đau, khóc khi ta cãi nhau\r\nChẳng thể ngủ được đâu\r\nVà mắt sưng qua ngày sau cũng chẳng thể níu thêm chi\r\nChỉ bằng hãy giữ lấy nước mắt em đi\r\n\r\n[Pre-Chorus: HIEUTHUHAI]\r\nƯớt ở trên mi\r\nMỗi lần qua từng nơi dấu chân ta đi\r\nGiờ còn đâu tình yêu lúc không là gì\r\nUống thêm là vì nước mắt anh rơi vào tận trong ly\r\nChúng ta không sai\r\nNhưng giờ đây làm sao để em quay lại?\r\nNhà và xe làm chi ngóng trông em hoài\r\nThức cả đêm dài, muốn em bên anh phải gọi thêm chai\r\n[Bridge: HIEUTHUHAI]\r\nTừng hứa bao nhiêu câu, giờ cũng không bên nhau\r\nChẳng biết hôm chia tay em đã ngồi khóc trong bao lâu\r\nLúc đó đủ can đảm đâu mà nhìn lại\r\nCố gắng hết bao nhiêu và cũng xa nhau mãi\r\n\r\n[Chorus: HIEUTHUHAI]\r\nĐã hơn một năm trôi qua mà mẹ vẫn thế, cứ tiếc đôi ta\r\nXoá cả hình xăm trên da, chuyện tình mình cũng chẳng thể phôi pha\r\nChắc cũng đã lâu anh không muốn say mà\r\nCuối cùng là hôm nay anh lại nhớ tới em\r\nCó thể sẽ phone cho em và sẽ lại nói \"anh vẫn yêu em\"\r\nBấm chuông nhà em trong đêm và hàng ngàn thứ biết chắc không nên\r\nHứa trong lòng anh sẽ không uống thêm được\r\nVì em là lý do số một làm cho anh không thể say'),
(6, 'Exit Sign', 3, '2023-10-16', '[Lời bài hát \"Exit Sign\" bởi HIEUTHUHAI, marzuz]\r\n\r\n[Intro: Kewtiie]\r\n(Hey, Kewtiie)\r\n\r\n[Verse 1: HIEUTHUHAI]\r\nAnh không nhớ nổi lần cuối cùng anh nhìn vào mắt em đó là từ bao giờ\r\nEm từng trách anh chỉ ôm ước mơ, còn không sợ mất em thì làm sao chờ?\r\nLúc đó anh có xin lỗi hay không thì kết quả nó cũng như nhau mà\r\nCuối cùng thì hai ta đều ích kỷ, nông nổi, tự trong cao mà\r\n\r\nTa từng bắt gặp nhau ở khắp Sài Gòn, chắc là lúc còn yêu thì muốn tránh cũng khó\r\nKhông thể tin là mình chưa từng gặp lại sau khi mà anh bước qua cánh cửa đó\r\nTình yêu mình từng là ánh lửa đỏ, từng là chim sẻ cố đập cánh giữa gió\r\nCố gắng sống hai cuộc đời, chắc là thằng nhóc này muốn làm thần thánh nữa đó\r\n\r\nSao giờ em xuất hiện tại đây vậy? Cuối hàng khán giả với cánh tay vẫy\r\nEm từng cùng anh đứng ở hậu trường và cùng anh về nhà sau khi mà bay nhảy\r\nCũng từng nói \"Em không có gạt anh, em thích nhạc anh\", and you know the vision\r\nAnh từng hứa là mình không nhạt đâu, sẽ không lạc nhau, cùng bên nhau vào khi cần\r\n\r\nNgay lúc đó anh chỉ muốn lao xuống, anh thật sự tò mò, em dạo này khỏe không?\r\nNhưng mà sao hôm nay em đi khuya vậy? Ba mẹ em biết là ba mẹ sẽ trông\r\nAnh từng mong em hạnh phúc, tới khi em nở nụ cười, anh như bị đâm mười nhát\r\nKhi anh đứng trên sân khấu một mình, còn em đứng cạnh cùng với một người khác\r\nYou might also like\r\nĐánh Đổi\r\nObito (VNM)\r\nSimp Gái 808\r\nLow G (VNM)\r\nHit Me Up\r\nBinz Da Poet\r\n[Chorus: marzuz]\r\nEm hiểu rằng chúng ta không ai là sai (Hah-ah-ah-ah)\r\nChỉ là em không muốn em mãi sẽ là lựa chọn thứ hai\r\nMãi sau những điều anh cho là lý do để anh tồn tại\r\nVậy đâu còn lý do để em ở lại?\r\nĐây sẽ là lý do em sẽ thôi đắn đo, cứ ôm mộng hoài\r\nSo thanks for showing me the exit sign\r\n\r\n[Verse 2: HIEUTHUAI]\r\nChưa nói tới đúng sai nhưng chuyến xe dừng lại là do chân anh đặt trên phanh\r\nAnh đã không ngần ngại chia con đường làm hai vì anh nghĩ là anh quên nhanh\r\nGặp một cô gái mới coi là cả thế giới, viết tên cả hai lên tranh\r\nKhông dễ nhiều đêm trắng để chờ lên nắng, giờ thì kí ức gọi tên anh\r\nNên là cứ rót đi, bàn vẫn ướt mặc dù có lót ly\r\nƯớc gì có thể paste nỗi đau này qua chỗ khác, nhưng không, nó nhân lên, nó chỉ copy\r\nThật khó để nhìn xung quanh khi chỉ trông ngóng vì sao như Xi-ôn-cốp-xki\r\nĐể bây giờ em đi, mất liên kết, còn lại tồn tại giữa anh và em là chung một tài khoản Shopee\r\n\r\nGom hết tất cả về em xong rồi thiêu nhanh\r\nGiọng em vang lên trước khi môi em mở, găm thẳng vào anh như là siêu thanh\r\nKhông cần phải là người giỏi toán, đủ biết đây không phải đổi ngang\r\nEm chỉ mất đi một thằng thất bại, anh mất đi một người yêu anh\r\n\r\n8515 lần nói \"Anh yêu em\" ở trong Mess nếu mà em search\r\nCũng tới lúc mình phải quên đi thôi dù từng có với nhau là rất nhiều cam kết\r\nTiếc nhất không phải chia tay mà là không yêu em nhiều hơn trước lúc tình yêu chết\r\nCó lẽ phải ghi tên em vào credit vì bài nhạc nào anh cũng viết về em hết\r\n[Chorus: marzuz]\r\nEm hiểu rằng chúng ta không ai là sai (Hah-ah-ah-ah)\r\nChỉ là em không muốn em mãi sẽ là lựa chọn thứ hai\r\nMãi sau những điều anh cho là lý do để anh tồn tại\r\nVậy đâu còn lý do để em ở lại? (Đâu cần một lý do là...)\r\nĐây sẽ là lý do em sẽ thôi đắn đo, cứ ôm mộng hoài\r\nSo thanks for showing me thе exit sign\r\n\r\n[Outro: marzuz]\r\nHah-ah-ah-hooh\r\nHãy giữ gìn nhau trong những kỉ niệm\r\nI thank you for finally showing me the еxit sign\r\nUhm-mm-mm, mm\r\nThanks for showing me the exit sign'),
(7, 'Visa Interlude', 1, '2023-10-16', '[Lời bài hát \"Visa Interlude\" bởi HIEUTHUHAI]\r\n\r\n[Intro]\r\nOkay, be real (Be real)\r\nVậy mà họ nói tao không lên top được (No, no)\r\nFuck that shit, tao có cả visa (Hah)\r\nMelody trong túi cùng với cả đống vần (Ooh-ooh)\r\nSungha Jung cùng cây đàn guitar\r\n\r\nChỉ cần D, S xong C, D, ta sút vào (Goal!)\r\nJust a game như là FIFA (Just a game)\r\nThật lòng mà nói tao không thể cook được (Cook)\r\nTao đây không phải Doge càng không phải Shiba'),
(8, 'Sắp Nổi Tiếng', 4, '2023-10-16', '[Lời bài hát \"Sắp Nổi Tiếng\" bởi HIEUTHUHAI]\r\n\r\n[Intro: HIEUTHUHAI, Kewtiie]\r\nKilling the game, ai có thể nói tao sai?\r\nBảo an ở xung quanh, tao chẳng cố ra oai\r\nĐứng ngay ở chân tường vẫn phải ngoái ra sau\r\nHaving paranoid, nhiều giọng nói trong đầu\r\n80 trên freeway, bật ghế ra sau\r\nChẳng có thời gian để mà tao ngủ ngon đâu\r\nChẳng biết thành như này cũng được đã bao lâu (Hey, Kewtiie)\r\nPray for my soul\r\n\r\n[Verse 1]\r\nVẫn là công việc đó giống như là mọi ngày, cố gắng để viết thêm một verse thôi\r\nNếu mà hay có thể bỏ vào album, viết vần và để cho thơ trôi\r\nTrước mắt của tao là quá nhiều cơ hội, như là Cobb, tao đang sống ở trong mơ, boy\r\nKhông cần hỏi là \"Thằng nào work hard?\", cánh tay này sinh ra nó chỉ để giơ thôi\r\nTao cũng từng là một thằng lạc lối, âm nhạc là tất cả thứ mà tao biết\r\nTrong tay thì chỉ có mỗi giấy và bút, nên beat là thứ duy nhất mà tao giết\r\nCon tim này cũng đã từng yêu rất nhiều, love song là tất cả thứ mà tao viết\r\nThành công với tao là một người lạ, tụi tao đang cố gắng học cách giao tiếp\r\n\r\nTao nghiện chiến thắng và đây là giờ vô cơn\r\nĐi càng xa, mất những mối quan hệ và trong lời họ nói tao thành thằng vô ơn\r\nCứ thêm một bước là câu từ thô hơn, give no fuck because life goes on\r\nNhưng trước giờ đâu có ai từng nói, nói với tao đây là hành trình cô đơn\r\nYou might also like\r\nNOLOVENOLIFE\r\nHIEUTHUHAI\r\nExit Sign\r\nHIEUTHUHAI\r\nĐi Họp Lớp\r\nHIEUTHUHAI\r\nYup, okay, để dành tia nắng sau mây\r\nTham vọng của tao quá lớn, tao đã thành con sói lâu nay\r\nBởi vì tao muốn, okay? Tao sẽ đánh đổi, okay?\r\nỞ đây không có chim sẻ nên là tao không phải dâu tây\r\n\r\nTụi nó nói tao nổi tiếng chỉ nhờ đẹp trai, trong khi đó là thứ tụi nó mong có\r\nĐi thử một cây, mang giày của tao nếu như mày nói rap như tao không khó\r\nMột vài năm nữa quay lại kiểm chứng, những lời tao nói sẽ không bay trong gió\r\nVà top 5 cũng không còn phải là top nữa, nếu không có tên tao trong đó\r\nFuck (Fuck)\r\n\r\nNhìn những người ở top đầu trong ngành với con ngoan, vợ xinh\r\nTao biết là họ cũng phải bắt đầu từ đâu đó trước khi có một căn penthouse bự kinh\r\nĐó cũng là thứ mà tao nhắm tới, paranoid và stress nó nằm ngoài dự tính\r\nTiếp nhận đánh giá từ người tao tôn trọng, tụi mày chưa hề làm cho tao mất tự tin\r\n\r\n[Hook]\r\nKilling the game, ai có thể nói tao sai? (Killing game)\r\nBảo an ở xung quanh, tao chẳng cố ra oai (Cố ra oai)\r\nĐứng ngay ở chân tường vẫn phải ngoái ra sau\r\nHaving paranoid, nhiều giọng nói trong đầu\r\n80 trên freeway, bật ghế ra sau\r\nChẳng có thời gian để mà tao ngủ ngon đâu\r\nChẳng biết thành như này cũng được đã bao lâu\r\nPray for my soul\r\n[Verse 2]\r\nTao vẫn luôn là tao mà, từ thời Soundcloud tới lúc almost famous\r\nThức trắng năm ngày còn chẳng sao mà, giảng đường, hai jobs là lý do mà hay mệt\r\nBuy-in sức khỏe là lao đầu vô game, trò chơi âm nhạc này là tao all-in\r\nNên là mỗi lần đặt bút chính xác là thâu đêm\r\n\r\nNói chuyện với mic còn nhiều hơn với mẹ chỉ vì cố đi xa, vỗ lên ngực như là gorilla\r\nTrong khi đám bạn thì tụi nó đi bar, còn tao viết nhạc cho tụi nó đi bar\r\nThứ tụi nó hit trong đó có shisha, tao hit từ track trong bài có guitar\r\nChỉ với suy nghĩ tao chịu khó ghi ra, ai cũng muốn bằng, tao cần bodyguard\r\nGiờ ai cũng muốn bằng, tao cần bodyguard\r\n\r\nCho tiền vào bao, bước xuống sân khấu, cả hoa hậu đang chào tao\r\nTao biết với đà này thì tao sẽ giàu mau nhưng tao không bán linh hồn để mà viết thứ tào lao\r\n\'Cause I\'m better than that, đi qua màn khác, bây giờ tự biết mình giỏi nên không còn cần lời khen\r\nNgười ta thương nói càng chăm chỉ càng gặp may, tao sẽ trên đỉnh rất lâu, khuyên tụi mày nên làm quen\r\n\r\nDòng nước ngược xiết\r\nTất cả cột mốc được sinh ra cũng chỉ để cho tao vượt tiếp\r\nKhông thể tin là mọi người hoài nghi, không biết thằng này liệu có còn viết được hit?\r\nTao đã làm quá nhiều lần để có thể gọi là may mắn, fuck that shit\r\n\r\n[Hook]\r\nKilling the game, ai có thể nói tao sai? (Killing game)\r\nBảo an ở xung quanh, tao chẳng cố ra oai (Cố ra oai)\r\nĐứng ngay ở chân tường vẫn phải ngoái ra sau\r\nHaving paranoid, nhiều giọng nói trong đầu\r\n80 trên freeway, bật ghế ra sau\r\nChẳng có thời gian để mà tao ngủ ngon đâu\r\nChẳng biết thành như này cũng được đã bao lâu\r\nPray for my soul (My soul, my soul)'),
(9, 'KPI', 4, '2023-10-16', 'Lời bài hát KPI – HIEUTHUHAI\r\nNăm sau có nhiều KPI\r\nMua con xe hay là thêm cái nhà\r\nToàn hit, cho ra thêm mấy bài\r\nEverybody yeah we go go go\r\nTao siêng khi mày xay tí xoài\r\nEy one two three\r\nNhư mọi năm lại làm new plan\r\nLúc mùa thu sang\r\nNếu như mày, then too bad\r\nLàm việc theo cảm xúc\r\n*** I don’t do that\r\nTiền vào new bank\r\nSố 0 tao đông như băng nhạc Wu-tang\r\nHọ nói tao giết con beat\r\nThì mày nên biết\r\nĐó không phải vu oan\r\nNhư bệnh nhân phẫu thuật\r\nTao có rất nhiều chỉ tiêu\r\nLuôn đội lên đầu\r\nKhông phải để quăn/quăng giống như là durag\r\nHater nói ít thôi vì anh là Catona\r\nAnh chỉ đấu với người giỏi nhất\r\nNhư anh là Barbosa\r\nTừng trực đêm hết cả ca tối\r\nVà kiếm được ba đô la\r\nGiờ tài khoản như đang trên sàn\r\nVà nhảy điệu Cha-cha-cha\r\nVà mục tiêu là bán cổ phiếu\r\nRồi về báo hiếu cho mommy\r\nTất cả show có dàn đồng ca\r\nVà fan hét to như ponzi\r\nXe hai cửa chạy V12\r\nNhư nó là ba của Henry\r\nKpi trải đầy ra bàn\r\nSo you know I’m hungry\r\nFirst class bay trên boeing\r\nChất xám trên con Rollie\r\nNhắm bắn and reloading\r\nChính xác Lewandowski\r\nFirst class bay trên boeing\r\nChất xám trên con Rollie\r\nNhắm bắn and reloading\r\nChính xác Lewandowski\r\nNăm sau có nhiều KPI\r\nMua con xe hay là thêm cái nhà\r\nToàn hit, cho ra thêm mấy bài\r\nEverybody\r\nYeah we go go go go go go go\r\nKhi mày xay tí xoài\r\nAnh đạt tất cả KPI, easy\r\nTrường phát như là eighty-nine\r\nCho anh thấy cánh tay mày\r\nĐâu đâu đâu đâu đâu\r\nVà chưa được xi nhê\r\nHay tương lai\r\nĐóng thêm vài ba bộ xi-nê\r\nKiếm người đẹp như Shakira\r\nGọi anh là Piqué\r\nVà lúc nào anh cũng băng giá\r\nBởi vì quần bò ở trong ngăn đá\r\nCòn nhiều hơn fillet\r\nCầm lên cây bút và như tính toán\r\nNăm sau sẽ có một album\r\nĐưa chất xám tạo ra output\r\nVà hút thêm fan là outcome\r\nNên ăn mừng bằng mục tiêu mới\r\nTreo lên pinãta\r\nVung một gậy mọi thứ rơi ra, Balenciaga\r\nDanh hão hay gái gú càng không\r\nNhắm tới một chỗ đứng\r\nNiềm tự hào đàng trong\r\nVì như Thành Long mỗi khi lên đấu\r\nVà tao luôn chiến thắng\r\nBị bắt quả tang yêu sự cố gắng\r\nNhưng mà ngoại tình với thành công\r\nFirst class bay trên boeing\r\nChất xám trên con Rollie\r\nNhắm bắn and reloading\r\nChính xác Lewandowski\r\nFirst class bay trên boeing\r\nChất xám trên con Rollie\r\nNhắm bắn and reloading\r\nChính xác Lewandowski\r\nGo go go go\r\nToàn là KPI\r\nMua con xe hay là thêm cái nhà\r\nToàn hit, cho ra thêm mấy bài\r\nEverybody\r\nYeah we go go go go go go go\r\nKhi mày xay tí xoài\r\nAnh đạt tất cả KPI, easy\r\nTrường phát như là eighty-nine\r\nCho anh thấy cánh tay mày\r\nĐâu đâu đâu đâu đâu'),
(10, 'Everything Will Be Okay', 3, '2023-10-16', '[Lời bài hát \"Everything Will Be Okay\" bởi HIEUTHUHAI]\r\n\r\n[Intro]\r\nNo matter the pain I cause you\r\nI know your love remains the same\r\nYou\'ll be fine without me\r\nDon\'t think that I could say the same\r\nNo matter the pain I cause you\r\nI know your love remains the same\r\nKnow you\'ll be fine without me\r\nDon\'t know if I could say the same\r\n\r\n[Verse 1: HIEUTHUHAI]\r\nĐôi khi tao hay nhắm mắt và nghĩ về những thứ xung quanh\r\nNhững kí ức tao đã đi qua và những vết thương cần được chữa lành\r\nNhững tối ghế đá nằm ngoài đêm lạnh\r\nVà tao tự hào về hết tất cả mà con người tao bây giờ trở thành\r\nBên cạnh thằng Hiếu vui vẻ ngày xưa giờ là thằng Hiếu rất hay phát bực\r\nLuôn luôn tự hỏi \"Đã đủ đầy chưa?\", đôi khi khó thở bởi những áp lực\r\nNhưng mỗi lần nhìn vào gia đình không bao giờ thiếu một thứ gì\r\nThì tao biết là mình đi đúng đường và không chấp nhận mình thứ nhì\r\n\r\nTao có nhiều fan, tới show mỗi tháng\r\nChỉ vì có một bức hình mà chấp nhận đứng để tới trời sáng\r\nCảm ơn tao nhiều rất nhiều vì dòng lyrics giúp họ phải ráng\r\nVà có thể hét to, đọc theo từng chữ làm tao chẳng muốn rời quán\r\nMà ngờ nhóc con ngày đó đứng ngã tư để phát tờ rơi\r\nCó một tâm hồn trong vắt nhưng nhiều clo giống như hồ bơi\r\nGiờ thì đứng ở trên sân khấu, bài nhạc vang hết khắp vùng trời\r\nVà được gọi là một sao có nhiều người trân quý trong cuộc đời\r\nYou might also like\r\nCUA\r\nHIEUTHUHAI\r\nIs It Over Now? (Taylor’s Version) [From The Vault]\r\nTaylor Swift\r\n“Slut!” (Taylor’s Version) [From The Vault]\r\nTaylor Swift\r\n[Hook: HIEUTHUHAI]\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\n\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\nEverything will be o-okay\r\nEverything will be o-okay\r\n\r\n[Verse 2: HIEUTHUHAI]\r\nBức tranh cuộc đời tao vẽ cùng đã được đầy màu, ay\r\nVẫn còn những màu đen trắng của mấy anh em tao từ những ngày đầu, ay\r\nỞ đó hết những ngày sầu và đã đi chung với nhau thật lâu\r\nVà vài câu nói tao vẫn không quên, \"Nếu mai sau lỡ có thằng này giàu\"\r\n\"Sẽ đi từng nhà và hú, khoang thương gia và nhiều kì thú\"\r\nGiữ lấy một lời thề là biến đám nerd này thành một bầy tỉ phú, ah\r\nNgười ta nói mày giàu làm gì khi gia đình mày thì không?\r\nNgười ta nói mày giàu làm gì khi gia đình mày thì không?\r\n\r\nTừ cố gắng lắp đầy được hết tủ đông\r\nGiờ cũng không biết album đứng đầu vầy thì có đủ không?\r\nNhắm chặt mi cho qua ngày mai, ay, and you will be fine, ay\r\nCho bản thân vài giây khi đã thu mình trong stu- many nights, ay\r\nKhi mà ta chưa lớn, ta quên nhìn quanh, toàn nghĩ về sau này\r\nGià đi, chỉ còn nhìn quá khứ khi những hạt cát thời gian đã mau đầy\r\nChẳng biết tương lai sẽ tốt hơn hay là còn gì trong tay?\r\nChỉ muốn nói \"Biết ơn\", tao sẽ nhớ nhiều về ngày hôm nay\r\n\r\n[Hook: HIEUTHUHAI]\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\n\r\nEverything will be o-o-okay\r\nEverything will be o-o-okay\r\nEverything will be o-okay\r\nEverything will be o-okay\r\n\r\n[Outro]\r\nNo matter the pain I cause you\r\nI know your love remains the same\r\nKnew you\'ll be fine without me\r\nDon\'t think that I could say the same\r\nNo matter the pain I cause you\r\nI know your love remains the same\r\nKnow you\'ll be fine without me\r\nDon\'t know if I could say the same'),
(11, 'Cho Em An Toàn', 4, '2023-10-16', 'Lời bài hát Cho Em An Toàn – HIEUTHUHAI\r\nHọ thường nói\r\nAi khi xem tình yêu quý hơn vàng\r\nNhững buổi hẹn hò anh nô nức\r\nTa nắm tay đi và nô đùa\r\nSuy nghĩ về nhau trong vô thức\r\nĐinh hương sao nở rộ\r\nNhư đang vô mùa\r\nAnh luôn tỏ ra vui vẻ\r\nVới câu chuyện em đang cười\r\nVà dù nhạt nhẽo anh phải đảm bảo\r\nLà cái độ hài hước\r\nCùng trên thang mười\r\nVà rồi này xuân sang, bên nàng\r\nCảm xúc này được em trang hoàng\r\nThư tay trên bàn\r\nVà lời hứa giữ em an toàn\r\nBảo vệ khỏi bầy sói mỗi đêm\r\nNhững chuyện xấu mà bầy người thổi lên\r\nCắm luôn một vị trí\r\nMãi trong tim em không hề đổi bên\r\nĐiều anh ghét nhất phải nói lên\r\nLà anh nhớ em\r\nNgay cả khi em ở bên\r\nGiữ lấy cho chúng ta\r\nHọ thường nói\r\nAi khi xem tình yêu quý hơn vàng\r\nĐem cho ta những cảm giác an toàn\r\nKhông cần lo xa\r\nVì không ai đổi thay\r\nChỉ cần nhớ\r\nAi luôn ngay phía sau\r\nAi cho em vòng tay êm ái\r\nKhông cho ai làm em phải đau\r\nCho cho em an toàn\r\nCho cho em an toàn\r\nTừ trong tim này đây\r\nMình cùng song ca như Leessang\r\nAin’t nothing but a G Thang\r\nNhiều điều nuối tiếc mình viết lên trời\r\nCòn chuyện không vui mình phi tang\r\nHai ta luôn bên cạnh\r\nKhi bao cô đang vây quanh\r\nBao nhiêu an toàn\r\nCho em luôn cảm thấy được yêu\r\nTrái tim đầy những vết thương\r\nMà nó không vơi\r\nNhưng chân thành\r\nLà thứ duy nhất chảy ra\r\nHứa là mọi chuyện sẽ xứng đáng với\r\nTất cả những điều\r\nMà em đã trải qua\r\nGiữ riêng cho ta những bí mật\r\nYeah we are both playing for keeps\r\nTương lai mình giống như Doublelift\r\nBởi vì hai ta hòa làm một nè\r\nEm ơi\r\nĐiều anh ghét nhất phải nói lên\r\nLà anh nhớ em\r\nNgay cả khi em ở bên\r\nGiữ lấy cho chúng ta\r\nHọ thường nói\r\nAi khi xem tình yêu quý hơn vàng\r\nĐem cho ta những cảm giác an toàn\r\nKhông cần lo xa\r\nVì không ai đổi thay\r\nChỉ cần nhớ\r\nAi luôn ngay phía sau\r\nAi cho em vòng tay êm ái\r\nKhông cho ai làm em phải đau\r\nVì mình đã đôi khi cãi nhau\r\nVà nhiều lúc đôi mi phải lau\r\nChỉ cần ta luôn ở bên\r\nHọ thường nói\r\nAi khi xem tình yêu quý hơn vàng\r\nĐem cho ta những cảm giác an toàn\r\nKhông cần lo xa\r\nVì không ai đổi thay\r\nChỉ cần nhớ\r\nAi luôn ngay phía sau\r\nAi cho em vòng tay êm ái\r\nKhông cho ai làm em phải đau\r\nCho cho em an toàn\r\nCho cho em an toàn\r\nTừ trong tim này đây\r\nCho em an toàn\r\nCho em an toàn\r\nTừ trong tim này đây'),
(12, 'NOLOVENOLIFE', 3, '2023-10-16', '[Chorus]\r\nMình hãy cứ sống thế đi, ta cứ mãi ước mơ\r\nTa cứ luôn mong chờ điều tuyệt vời nhé em\r\nCầm tay nhau mãi bước đi, sẽ cứ thế mỉm cười\r\nTa sẽ quên đi bao nhiêu tình yêu tan vỡ như là giấc mơ\r\n\r\nNo love, no life, no love, no life\r\nAnh chẳng còn muốn quay về nơi ấy\r\nNo love, no life, no love, no life (Hey, Kewtiie) (What\'s up?)\r\nSẽ mãi thuộc về nơi đây với em\r\n\r\n[Verse 1]\r\nEm biết anh là một thằng rapper rót mật vào tai bằng dây thanh\r\nChỉ xuất hiện là họ đã say nhanh\r\nMang tiếp trap và trăm cái red flag là bởi vì luôn luôn có phụ nữ vây quanh\r\nCó một ngàn lý do để phải ghen nhưng em không\r\nEm up hình, biết chắc anh phải xem và đặc biệt phải khen sau mỗi lần xem xong\r\n\r\nAnh luôn muốn cài cho em thêm cúc khi có thằng con trai nào đi qua\r\nVì em và anh luôn muốn chuyện mình nghiêm túc, không phải just a game như FIFA\r\nEm làm cho mọi bài nhạc chia tay mà anh đã từng viết nó trở nên vô nghĩa\r\nHai bờ môi chạm nhau vào khuya nay, mình ăn cho thật bốc nên chẳng cần tô nĩa, yeah, ah\r\n\r\nEm luôn tự tin, thu hút, điểm số luôn nằm ở top đầu\r\nLần đầu gặp thì anh đã nhìn thấu và cũng chẳng cần giấu là hai ta khớp màu\r\nEm vẫn hay còn giận anh khi mà xem qua về những gì mà anh nói ở trên camera\r\nHứa là với em, anh có thể đảm bảo tất cả thứ có thể ghen đều trên camera\r\nYou might also like\r\nHit Me Up\r\nBinz Da Poet\r\nĐánh Đổi\r\nObito (VNM)\r\nExit Sign\r\nHIEUTHUHAI\r\nBên nhau, ta còn không một giây do dự nào, ay\r\nBởi vì là yeah, girl, em vẫn luôn làm cho anh tự hào, hah\r\nAnh ghét nhất mỗi lần đi phỏng vấn, họ lại hỏi câu hỏi đó mà xem\r\nHọ hỏi anh về hình mẫu lý tưởng nhưng không thể trả lời đó là em\r\n\r\nVà đó là lý do mà anh hay trả lời là gu của anh là thông minh và tinh tế\r\nBởi vì à...\r\n\r\nBởi vì em tinh tế và em thông minh, đặt niềm tin hết vào anh khi anh không tin\r\nVà tặng em cả rừng hoa thật là lung linh, là vì em với đẹp luôn là cặp song sinh\r\nLàm anh thốt lên là \"Damn\" như là KDOT, là lý do mà đàn ông ngoài kia hay khóc\r\nLà lý do anh không sợ fan nữ unfan, và phải là nói mình độc thân như idol K-Pop\r\nAnd it pays off\r\n\r\nVà cuộc sống, sự nổi tiếng anh đã quen rồi, cũng không hay ra ngoài nên là I don\'t mind\r\nEm thì rất ghét là phải tránh mấy nơi đông người, cố luôn phải che mặt dù ta không sai\r\nAnh biết là em vẫn hay hình dung ngày đứng chung một khung hình và ta công khai\r\nVì mình luôn hiểu ý nhau, vì có chung chữ cái đầu, ngoài mình ra thì không ai\r\n\r\n[Chorus]\r\nMình hãy cứ sống thế đi, ta cứ mãi ước mơ\r\nTa cứ luôn mong chờ điều tuyệt vời nhé em\r\nCầm tay nhau, mãi bước đi, sẽ cứ thế mỉm cười\r\nTa sẽ quên đi bao nhiêu tình yêu tan vỡ như là giấc mơ\r\n\r\nNo love, no lifе, no love, no life\r\nAnh chẳng còn muốn quay về nơi ấy\r\nNo love, no lifе, no love, no life\r\nSẽ mãi thuộc về nơi đây với em\r\n[Outro]\r\nNo love, no life, no love, no life\r\nAnh chẳng còn muốn quay về nơi ấy\r\nNo love, no life, no love, no life\r\nSẽ mãi thuộc về nơi đây với em'),
(13, 'Santa’s Coming for Us', 3, '2017-11-17', '[Verse 1]\r\nNights are getting shorter now, hot chocolate\r\nFills the air and Christmas cheer does too\r\nPickin\' out your Christmas tree, so lovely\r\nThe joy this time it brings to you\r\n\r\n[Refrain]\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\nSanta\'s coming to town\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\nSanta\'s coming to town\r\n\r\n[Pre-Chorus]\r\nSing it to the deer in the sky\r\nSing it as they jingle, jingle, jingle tonight\r\nSing it to the moon, set it free\r\nYou\'re the angel on the top of my tree\r\nSing it to the spirit above\r\nSing your heart out with all of your love\r\nSanta\'s coming for us\r\n\r\n[Chorus]\r\nSanta\'s coming for us, Santa\'s coming for us\r\nSanta\'s coming for us, Santa\'s coming for us\r\nSanta\'s coming for us\r\nOh, Santa\'s coming for us\r\n\r\nYou might also like\r\nCandy Cane Lane\r\nSia\r\nSunshine\r\nSia\r\nJingle Bells\r\nChristmas Songs\r\n[Verse 2]\r\nSend your letters off to Santa, baby\r\nTell him all your secret wishes too\r\nSend your letters off to Santa, baby\r\nHopin\' all your wildest dreams come true\r\n\r\n[Refrain]\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\nSanta\'s coming to town\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\nSanta\'s coming to town\r\n\r\n[Pre-Chorus]\r\nSing it to the deer in the sky\r\nSing it as they jingle, jingle, jingle tonight\r\nSing it to the moon, set it free\r\nYou\'re the angel on the top of my tree\r\nSing it to the spirit above\r\nSing your heart out with all of your love\r\nSanta\'s coming for us\r\n\r\n[Chorus]\r\nSanta\'s coming for us, Santa\'s coming for us\r\nSanta\'s coming for us, Santa\'s coming for us\r\nSanta\'s coming for us\r\nOh, Santa\'s coming for us\r\n[Refrain]\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\nSanta\'s coming to town\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\nSanta\'s coming to town\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\n(Oh, do-do-do, oh, do-do-do)\r\nSanta\'s coming to town\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\n(Oh, da-da-da, oh, da-da-da)\r\nSanta\'s coming to town'),
(14, 'Candy Cane Lane', 3, '2017-11-17', '[Verse 1]\r\nTake a trip down Candy Cane Lane with me\r\nIt\'s the cutest thing I swear you\'ll ever see\r\nIt\'s the best, so get dressed, I\'ll impress\r\nYou with the colors of the rainbow\r\nTake a trip down Candy Cane Lane with me\r\nIt\'s so magical, let\'s go there in your dreams\r\nIt\'s the best, so get dressed, I\'ll impress\r\nYou with the lights in all their windows\r\n\r\n[Pre-Chorus]\r\nRed and yellow and pink and green\r\nOrange and purple and blue\r\nChristmas is waiting for you\r\nChristmas is waiting for you\r\nRed and yellow and pink and green\r\nOrange and purple and blue\r\nChristmas is waiting for you\r\nChristmas is waiting for you\r\n\r\n[Chorus]\r\nCandy Cane Lane, bring a friend this holiday\r\nBring a friend who loves to play, we\'ll eat all the candy canes\r\nOh, Candy Cane Lane, bring a friend this holiday\r\nBring a friend who loves to play, we\'ll eat all the candy canes\r\nYou might also like\r\nSanta’s Coming for Us\r\nSia\r\nUnderneath the Christmas Lights\r\nSia\r\nEveryday Is Christmas\r\nSia\r\n[Post-Chorus]\r\nCandy canes\r\nWe\'ll eat candy canes\r\n\r\n[Verse 2]\r\nTake a trip down Candy Cane Lane with me\r\nI\'ll call Rudolph down to meet us in the street\r\nWe can dance, he can prance\r\nThere\'s no can\'t\'s, \'cause here, everything is possible\r\nTake a trip down Candy Cane Lane with me\r\nLet\'s get Santa out and get him on his feet\r\nWe can dance, holding hands\r\nAin\'t no can\'t\'s, \'cause here, everything is possible\r\n\r\n[Pre-Chorus]\r\nRed and yellow and pink and green\r\nOrange and purple and blue\r\nChristmas is waiting for you\r\nChristmas is waiting for you\r\nRed and yellow and pink and green\r\nOrange and purple and blue\r\nChristmas is waiting for you\r\nChristmas is waiting for you\r\n\r\n[Chorus]\r\nCandy Cane Lane, bring a friend this holiday\r\nBring a friend who loves to play, we\'ll eat all the candy canes\r\nOh, Candy Cane Lane, bring a friend this holiday\r\nBring a friend who loves to play, we\'ll eat all the candy canes\r\n[Post-Chorus]\r\nCandy canes\r\nWe\'ll eat candy canes'),
(15, 'Snowman', 3, '2017-11-17', '[Verse 1]\r\nDon\'t cry, snowman, not in front of me\r\nWho\'ll catch your tears if you can\'t catch me, darling?\r\nIf you can\'t catch me, darling\r\nDon\'t cry, snowman, don\'t leave me this way\r\nA puddle of water can\'t hold me close, baby\r\nCan\'t hold me close, baby\r\n\r\n[Chorus]\r\nI want you to know that I\'m never leaving\r\n\'Cause I\'m Mrs. Snow, \'til death we\'ll be freezing\r\nYeah, you are my home, my home for all seasons\r\nSo come on, let\'s go\r\nLet\'s go below zero and hide from the sun\r\nI\'ll love you forever where we\'ll have some fun\r\nYes, let\'s hit the North Pole and live happily\r\nPlease don\'t cry no tears now, it\'s Christmas, baby\r\n\r\n[Post-Chorus]\r\nMy snowman and me, eh\r\nMy snowman and me\r\nBaby\r\n\r\n[Verse 2]\r\nDon\'t cry, snowman, don\'t you fear the sun\r\nWho\'ll carry me without legs to run, honey?\r\nWithout legs to run, honey\r\nDon\'t cry, snowman, don\'t you shed a tear\r\nWho\'ll hear my secrets if you don\'t have ears, baby?\r\nIf you don\'t have ears, baby\r\nYou might also like\r\nO Holy Night\r\nChristmas Songs\r\nSpecial\r\nSZA\r\nDid you know that there’s a tunnel under Ocean Blvd\r\nLana Del Rey\r\n[Chorus]\r\nI want you to know that I\'m never leaving\r\n\'Cause I\'m Mrs. Snow, \'til death we\'ll be freezing\r\nYeah, you are my home, my home for all seasons\r\nSo come on, let\'s go\r\nLet\'s go below zero and hide from the sun\r\nI\'ll love you forever where we\'ll have some fun\r\nYes, let\'s hit the North Pole and live happily\r\nPlease don\'t cry no tears now, it\'s Christmas, baby\r\n\r\n[Post-Chorus]\r\nMy snowman and me, eh\r\nMy snowman and me\r\nBaby'),
(16, 'Snowflake', 4, '2017-11-17', '[Verse 1]\r\nSnowflake, I\'ll catch you tonight\r\nCatch you and keep you on ice, my love\r\nSnowflake, you know you\'re the only one\r\nThere\'s no one like you, so I\'m gonna hide you\r\nMy sweet\r\nKeep you \'til winter when you won\'t be needing me\r\n\r\n[Verse 2]\r\nSnowflake, I\'m tryin\' to keep you safe\r\nYou gave me your trust and I want you safe\r\nSnowflake, you know I\'ve got your back\r\nThere\'s no one like you, so I\'m gonna hide you\r\nMy sweet\r\nKeep you \'til winter when you won\'t be needing me\r\n\r\n[Chorus]\r\nChristmas day your freedom comes\r\nUnprotected from the sun\r\nBy then you\'ll be cold enough\r\nFor me to send you off with love\r\nSnowflake, don\'t forget us\r\nSnowflake, don\'t forget us\r\nSnowflake, don\'t forget us\r\nIf I were a betting man, I\'d bet a million on you\r\nBut there\'s no way around this, the only way now is through\r\nYou might also like\r\nA Winter’s Tale\r\nQueen\r\nAfterglow\r\nEd Sheeran\r\nWinter Bird\r\nAURORA\r\n[Verse 3]\r\nSnowflake, now you\'re on your own\r\nI love you, I know you\'re just here on loan\r\nYou blessed us and soon, you\'ll be on your way\r\nThere\'s no one like you, so I\'ll cry myself here to sleep\r\nI kept you \'til winter, now you won\'t be needing me\r\n\r\n[Chorus]\r\nChristmas day your freedom comes\r\nUnprotected from the sun\r\nBy then you\'ll be cold enough\r\nFor me to send you off with love\r\nSnowflake, don\'t forget us\r\nSnowflake, don\'t forget us\r\nSnowflake, don\'t forget us\r\nIf I were a betting man, I\'d bet a million on you\r\nBut there\'s no way around this, the only way now is through');
INSERT INTO `songs` (`songID`, `name`, `length_minutes`, `released_date`, `lyrics`) VALUES
(17, 'Ho Ho Ho', 3, '2017-11-17', '[Verse 1]\r\nHo ho ho, bring a bottle of rum\r\nHo ho ho, cream and whiskey bourbon\r\nHo ho ho, bring a bottle of booze\r\nWe got nothing to lose, ho ho ho\r\nHo ho ho, bring a friend if you please\r\nHo ho ho, Santa\'s hoping to meet\r\nHo ho ho, all the misfits and us\r\nI hope the misfits show up, ho ho ho\r\n\r\n[Chorus]\r\nHo ho ho, it don\'t get better than this\r\nHo ho ho, in the land of misfits\r\nHo ho ho, we\'re all losin\' our lids\r\nWe got nothing but this, ho ho ho\r\nHo ho ho, gon\' be our family\r\nHo ho ho, this is Christmas, baby\r\nHo ho ho, bring a friend if you please\r\nBring them all to their knees, ho ho ho\r\n\r\n[Verse 2]\r\nHo ho ho, bring a bottle of rum\r\nHo ho ho, cream and whiskey bourbon\r\nHo ho ho, bring a bottle of booze\r\nWe got nothing to lose, ho ho ho\r\nHo ho ho, bring a friend if you please\r\nHo ho ho, Santa\'s hoping to meet\r\nHo ho ho, all the misfits and us\r\nI hope the misfits show up, ho ho ho\r\nYou might also like\r\nSnowflake\r\nSia\r\nPuppies Are Forever\r\nSia\r\nSunshine\r\nSia\r\n[Chorus]\r\nHo ho ho, it don\'t get better than this\r\nHo ho ho, in the land of misfits\r\nHo ho ho, we\'re all losin\' our lids\r\nWe got nothing but this, ho ho ho\r\nHo ho ho, gon\' be our family\r\nHo ho ho, this is Christmas, baby\r\nHo ho ho, bring a friend if you please\r\nBring them all to their knees, ho ho ho\r\n\r\nHo ho ho, it don\'t get better than this\r\nHo ho ho, in the land of misfits\r\nHo ho ho, we\'re all losin\' our lids\r\nWe got nothing but this, ho ho ho\r\nHo ho ho, gon\' be our family\r\nHo ho ho, this is Christmas, baby\r\nHo ho ho, bring a friend if you please\r\nBring them all to their knees, ho ho ho'),
(18, 'Puppies Are Forever', 4, '2017-11-17', '[Verse 1]\r\nOh how much, oh how much\r\nFor the puppy in the window?\r\nI can see him playing so alone\r\nI believe he sees a friend in me\r\nOh how much, oh how much\r\nFor the puppy in the window?\r\nHow I love his little pink nose\r\nI think he\'s waiting to come home with me\r\n\r\n[Pre-Chorus]\r\nFound my best friend down the old dog pound\r\nThe old dog pound\r\nThe old dog pound\r\nFound my best friend down the old dog pound\r\nThe old dog pound\r\nThe old dog pound\r\n\r\n[Chorus]\r\nBut puppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\n\'Cause they\'re so cute and fluffy with shiny coats\r\nBut will you love \'em when they\'re old and slow?\r\nPuppies are forever, not just for Christmas\r\nPuppies are forever, puppies are forever\r\nYou might also like\r\nDid you know that there’s a tunnel under Ocean Blvd\r\nLana Del Rey\r\nGhost in the Machine\r\nSZA\r\nLET GO\r\nCentral Cee\r\n[Verse 2]\r\nOh, oh my sweet, oh my sweet\r\nLittle puppy from the window\r\nI will never let you go-o\r\n\'Cause now you are my family\r\nOh my cute, oh my cute\r\nLittle puppy from the window\r\nI been waiting for you so long\r\nI\'ll never let you down, baby\r\n\r\n[Pre-Chorus]\r\nFound my best friend down the old dog pound\r\nThe old dog pound\r\nThe old dog pound\r\n\r\n[Chorus]\r\nBut puppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\n\'Cause they\'re so cute and fluffy with shiny coats\r\nBut will you love \'em when they\'re old and slow?\r\nBut puppies are forever, not just for Christmas\r\nPuppies are forever, puppies are forever\r\nOh, oh\r\n[Bridge]\r\nFound my best friend down the old dog pound\r\nThe old dog pound\r\nThe old dog pound\r\n\r\n[Outro]\r\nBut puppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\nPuppies are forever, not just for Christmas\r\nPuppies are forever, puppies are forever\r\nPuppies are forever'),
(19, 'Sunshine', 3, '2017-11-17', '[Verse 1]\r\nMy sweet, I know that you feel weak\r\nMy sweet, I swear you got this beat\r\nAnd my love, I know that it\'s been tough\r\nMy love, I know you\'ve had it rough\r\n\r\n[Pre-Chorus]\r\nTell me your secrets tonight\r\nI\'ll take \'em with me\r\nAnd I\'ll get the elves workin\' on them\r\nIn the workshop\r\nWe\'ll take your problems apart\r\nPut \'em back using our hearts\r\nGet the elves working so hard\r\nMake your pain stop\r\n\r\n[Chorus]\r\nI\'m Santa\'s helper and I\'ve got your back\r\nAll my love is gift-wrapped\r\nDon\'t be scared, I\'m by your side\r\nI\'m Santa\'s helper, give your fears to me\r\nI\'ll take them home, baby\r\nAnd return them as sunshine\r\n\r\n[Post-Chorus]\r\nI\'ll bring you sunshine, yeah\r\nI\'ll bring you sunshine, yeah\r\nYou might also like\r\nColdest Winter\r\nKanye West\r\nSnowman\r\nSia\r\nSnowflake\r\nSia\r\n[Verse 2]\r\nDarling, I know you want to sing, darling\r\nBut you\'ve gotta stop running, baby\r\nYou know that I\'ll carry you, baby\r\nYour heart is safe with me\r\n\r\n[Pre-Chorus]\r\nTell me your secrets tonight\r\nI\'ll take \'em with me\r\nAnd I\'ll get the elves workin\' on them\r\nIn the workshop\r\nWe\'ll take your problems apart\r\nPut \'em back using our hearts\r\nGet the elves working so hard\r\nMake your pain stop\r\n\r\n[Chorus]\r\nI\'m Santa\'s helper and I\'ve got your back\r\nAll my love is gift-wrapped\r\nDon\'t be scared, I\'m by your side\r\nI\'m Santa\'s helper, give your fears to me\r\nI\'ll take them home, baby\r\nAnd return them as sunshine\r\n\r\n[Post-Chorus]\r\nI\'ll bring you sunshine, yeah\r\nI\'ll bring you sunshine, yeah\r\n[Instrumental Bridge]\r\n\r\n[Chorus]\r\nI\'m Santa\'s helper and I\'ve got your back\r\nAll my love is gift-wrapped\r\nDon\'t be scared, I\'m by your side\r\nI\'m Santa\'s helper, give your fears to me\r\nI\'ll take them home, baby\r\nAnd return them as sunshine\r\n\r\n[Post-Chorus]\r\nI\'ll bring you sunshine, yeah\r\nI\'ll bring you sunshine, yeah\r\nI\'ll bring you sunshine, yeah\r\nI\'ll bring you sunshine, yeah'),
(20, 'Underneath the Mistletoe\r\n', 4, '2017-11-17', '[Verse 1]\r\nI\'ve got a crush, la la la la la la\r\nLike a school girl\r\nAnd I wanna rush, la la la la la la\r\nLike a fool would\r\nSo, step on the gas, la la la la la la\r\nCome on over\r\n\'Cause babe it\'s Christmas, la la la la la la\r\nI wanna know ya\r\n\r\n[Pre-Chorus]\r\nRun to me, run to me through the white night\r\n\'Cause I adore ya\r\nRun to me, run to me through the white night\r\nI\'m waiting for ya\r\n\r\n[Chorus]\r\nIt\'s Christmas time, so run for your life\r\nOh, Hallelujah\r\nA snowy night, a woman on fire\r\nI\'m waiting for ya\r\nSo, here we go under the mistletoe\r\nOh, I adore ya\r\nA snowy night, a woman on fire\r\nOh, Hallelujah\r\nYou might also like\r\nSanta’s Coming for Us\r\nSia\r\nLet It Go\r\nIdina Menzel\r\nSnowflake\r\nSia\r\n[Post-Chorus]\r\nOh, you and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nUnder the mistletoe\r\nOh, you and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nUnder the mistletoe\r\n\r\n[Verse 2]\r\nKiss me \'til dawn, la la la la la la\r\nHold me close now\r\nYou\'ll keep me warm, la la la la la la\r\nKeep the ghosts out\r\n\r\n[Pre-Chorus]\r\nRun to me, run to me through the white night\r\n\'Cause I adore ya\r\nRun to me, run to me through the white night\r\nI\'m waiting for ya\r\n\r\n[Chorus]\r\nIt\'s Christmas time, so run for your life\r\nOh, Hallelujah\r\nA snowy night, a woman on fire\r\nI\'m waiting for ya\r\nSo, here we go under the mistletoe\r\nOh, I adore ya\r\nA snowy night, a woman on fire\r\nOh, Hallelujah\r\n[Post-Chorus]\r\nOh, you and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nUnder the mistletoe\r\nOh, you and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nYou and me here, underneath the mistletoe (Oh)\r\nUnder the mistletoe'),
(21, 'Everyday Is Christmas', 3, '2017-11-17', '[Verse 1]\r\nOh, father time\r\nYou and me and holiday wine\r\nWait for the snow\r\nI will read the list that I wrote\r\n\r\n[Refrain]\r\nSitting by the open fire\r\nLovin\' you\'s a gift tonight\r\nLovin\' you for all my life\r\nLovin\' you is a gift tonight\r\n\r\n[Chorus]\r\nOh, everyday is Christmas when you\'re here with me\r\nI\'m safe in your arms, you\'re my angel, baby\r\nEveryday is Christmas when you\'re by my side\r\nYou\'re the gift that keeps givin\', my angel for life\r\nEveryday is Christmas, everyday is Christmas\r\nEveryday is Christmas with you by my side\r\nEveryday is Christmas, everyday is Christmas\r\nEveryday is Christmas with you by my side\r\n\r\n[Verse 2]\r\nOh, you\'re my love\r\nYou\'re the joy in my holiday song\r\nAnd when you smile, I can\'t breathe\r\nCan\'t believe that you\'re mine\r\nYou might also like\r\nDid you know that there’s a tunnel under Ocean Blvd\r\nLana Del Rey\r\nSnowman\r\nSia\r\nLET GO\r\nCentral Cee\r\n[Refrain]\r\nSitting by the open fire\r\nLovin\' you\'s a gift tonight\r\nLovin\' you for all my life\r\nLovin\' you is a gift tonight\r\n\r\n[Chorus]\r\nOh, everyday is Christmas when you\'re here with me\r\nI\'m safe in your arms, you\'re my angel, baby\r\nEveryday is Christmas when you\'re by my side\r\nYou\'re the gift that keeps givin\', my angel for life\r\nEveryday is Christmas, everyday is Christmas\r\nEveryday is Christmas with you by my side\r\nEveryday is Christmas, everyday is Christmas\r\nEveryday is Christmas with you by my side\r\n\r\n[Outro]\r\nOh-oh-oh-oh-oh\r\nOh-oh-oh-oh\r\nOh-oh-oh-oh-oh\r\nOh-oh-oh-oh-oh\r\nOh-oh-oh-oh\r\nOh-oh-oh-oh-oh\r\nOh-oh-oh-oh-oh\r\nOh-oh-oh-oh\r\nOh-oh-oh-oh-oh\r\nWith you by my side\r\nOh-oh-oh-oh-oh\r\nOh-oh-oh-oh\r\nOh-oh-oh-oh-oh\r\nWith you by my side\r\nOh-oh-oh-oh-oh\r\nOh-oh-oh-oh\r\nOh-oh-oh-oh-oh\r\nWith you by my side\r\nOh-oh-oh-oh\r\nOh-oh-oh-oh'),
(22, 'Underneath the Christmas Lights', 3, '2017-11-17', '[Verse 1]\r\nWill the snow fall for me?\r\nChristmas night, oh love\r\nFeel the warmth set by the Christmas fire\r\nLa la la la la la la\r\n\r\n[Pre-Chorus]\r\nOh, oh\r\nYou are all I need tonight\r\nOh, oh\r\nHere by the Christmas lights\r\n\r\n[Chorus]\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\n\r\n[Verse 2]\r\nWrapping presents for the ghosts who cry\r\nLa la la la la la la\r\nHappiness is ours until we die\r\nLa la la la la la la\r\nYou might also like\r\nCandy Cane Lane\r\nSia\r\nSunshine\r\nSia\r\nForever Winter (Taylor’s Version) [From The Vault]\r\nTaylor Swift\r\n[Pre-Chorus]\r\nOh, oh\r\nYou are all I need tonight\r\nOh, oh\r\nHere above the Christmas lights\r\n\r\n[Chorus]\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights\r\nUnderneath the Christmas lights');

-- --------------------------------------------------------

--
-- Table structure for table `songs_artists`
--

CREATE TABLE `songs_artists` (
  `songID` int(11) DEFAULT NULL,
  `artistID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs_artists`
--

INSERT INTO `songs_artists` (`songID`, `artistID`) VALUES
(0, 0),
(2, 0),
(3, 0),
(4, 0),
(1, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `songs_genres`
--

CREATE TABLE `songs_genres` (
  `songID` int(11) DEFAULT NULL,
  `genreID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs_genres`
--

INSERT INTO `songs_genres` (`songID`, `genreID`) VALUES
(0, 2),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0);

-- --------------------------------------------------------

--
-- Table structure for table `song_playlist`
--

CREATE TABLE `song_playlist` (
  `songID` int(11) DEFAULT NULL,
  `playlistID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `song_playlist`
--

INSERT INTO `song_playlist` (`songID`, `playlistID`) VALUES
(0, 0),
(2, 0),
(3, 0),
(4, 0),
(0, 4),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 5),
(14, 5),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(22, 5),
(0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `email`) VALUES
(0, 'john123', 'password123', 'john@example.com'),
(1, 'admin', 'password', 'admin@example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artistID`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genreID`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`playlistID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`songID`);

--
-- Indexes for table `songs_artists`
--
ALTER TABLE `songs_artists`
  ADD KEY `songID` (`songID`),
  ADD KEY `artistID` (`artistID`);

--
-- Indexes for table `songs_genres`
--
ALTER TABLE `songs_genres`
  ADD KEY `songID` (`songID`),
  ADD KEY `genreID` (`genreID`);

--
-- Indexes for table `song_playlist`
--
ALTER TABLE `song_playlist`
  ADD KEY `songID` (`songID`),
  ADD KEY `playlistID` (`playlistID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `artistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `playlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `songID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON UPDATE CASCADE;

--
-- Constraints for table `songs_artists`
--
ALTER TABLE `songs_artists`
  ADD CONSTRAINT `songs_artists_ibfk_1` FOREIGN KEY (`songID`) REFERENCES `songs` (`songID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `songs_artists_ibfk_2` FOREIGN KEY (`artistID`) REFERENCES `artists` (`artistID`) ON UPDATE CASCADE;

--
-- Constraints for table `songs_genres`
--
ALTER TABLE `songs_genres`
  ADD CONSTRAINT `songs_genres_ibfk_1` FOREIGN KEY (`songID`) REFERENCES `songs` (`songID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `songs_genres_ibfk_2` FOREIGN KEY (`genreID`) REFERENCES `genres` (`genreID`) ON UPDATE CASCADE;

--
-- Constraints for table `song_playlist`
--
ALTER TABLE `song_playlist`
  ADD CONSTRAINT `song_playlist_ibfk_1` FOREIGN KEY (`songID`) REFERENCES `songs` (`songID`),
  ADD CONSTRAINT `song_playlist_ibfk_2` FOREIGN KEY (`playlistID`) REFERENCES `playlists` (`playlistID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
