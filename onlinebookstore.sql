-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2023 at 11:05 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinebookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`) VALUES
(1, 0, 9, 0, '2023-03-08 09:30:15'),
(2, 0, 8, 0, '2023-03-08 09:30:15'),
(3, 0, 10, 0, '2023-03-08 09:30:15'),
(4, 3, 8, 0, '2023-03-08 09:30:15'),
(5, 2, 9, 0, '2023-03-08 09:30:15'),
(6, 2, 10, 3, '2023-03-08 09:32:31'),
(9, 2, 1, 6, '2023-03-10 10:06:49'),
(10, 2, 11, 1, '2023-03-10 10:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`) VALUES
(1, 'Adventure stories ', 'Adventure stories', 'all adventures books', 0, 1, '1676635451.jpg', 'Adventure stories books', 'all adventures books', 'all adventures books', '2023-02-16 14:24:25'),
(2, ' Classics', ' Classics', 'Classics encompass a range of genres — but they always stand the test of time. Classics include centuries-old stories like Homer’s Odyssey, but also more modern novels that have drawn significant acclaim and attention, such Margaret Atwood’s The Handmaid’s Tale and George Orwell’s 1984.', 0, 0, '1677167497.jpg', ' Classics', 'Number of classic books available on Amazon: 60,000+\r\n\r\nAverage word count: 96,000 words\r\n\r\nAverage price for a paperback classics book: £6.88', ' Classics', '2023-02-23 15:51:37'),
(3, 'Crime', 'Crime', 'From murder mysteries to true crime stories, crime is an enduringly popular genre. It tells terrifying stories of wrongdoing, and the search for justice. This genre can be very lucrative, with many authors becoming household names, such as Agatha Christie, Val McDermid, and Harlan Coben.', 0, 1, '1677174407.jpg', 'Books', 'Number of crime novels available on Amazon: 70,000+\r\n\r\nAverage word count: 89,000 words\r\n\r\nAverage price for a paperback crime novel: £8.94', 'Crime', '2023-02-23 17:46:47'),
(4, 'Fairy tales and folk tales', 'Fairy tales, fables, and folk tales', 'Folk tales date back to ancient times, with Aesop being perhaps the most famous curator of these short-form stories. Many fairy tales are actually of unknown origin, but have survived through retellings down the generations. Modern fairy tale writers like Angela Carter often put a contemporary spin on traditional tales.', 0, 0, '1677174608.jpg', 'Books', '‍Number of fairy and folk tale anthologies available on Amazon: 3,000+\r\n\r\nAverage word count: 30,000 words\r\n\r\nAverage price for a paperback book of fairy tales: £10.66', 'Fairy tales, fables, and folk tales', '2023-02-23 17:50:08'),
(5, 'Fantasy', 'Fantasy', 'Fantasy books are probably the most popular modern book genre. Thanks to series like Harry Potter and Percy Jackson, it’s particularly popular with young adult readers, although more and more fantasy novels are written for adults (George RR Martin, we’re looking at you). These stories take readers on a journey beyond the known world, to places conjured in the author’s imagination.', 0, 0, '1677174855.jpg', 'Books', 'Number of fantasy books available on Amazon: 60,000+\r\n\r\nAverage word count: 109,000 words\r\n\r\nAverage price for a paperback fantasy book: £10.44', 'Fantasy', '2023-02-23 17:54:15'),
(6, 'Historical fiction', 'Historical fiction', 'Authors like Hilary Mantel and Toni Morrison have popularised the historical fiction genre in recent years. These books give readers a glimpse into the past, with many stories set in times of great conflict and change.', 0, 0, '1677175183.jpg', 'Books', 'Number of historical fiction books available on Amazon: 70,000+\r\n\r\nAverage word count: 102,000 words\r\n\r\nAverage price for a paperback historical fiction book: £8.99', 'Historical fiction', '2023-02-23 17:59:43'),
(7, 'Horror', 'Horror', 'People never tire of being terrified — so horror novels remain some of the bestselling books in the world. While the genre has origins in Gothic stories like Mary Shelley’s Frankenstein, authors like Stephen King and R L Stine have modernised horror for adults and children alike. The genre has also spawned hundreds of popular horror movies.', 0, 0, '1677175417.jpg', 'Books', '‍Number of horror books available on Amazon: 70,000+\r\n\r\nAverage word count: 102,000 words\r\n\r\nAverage price for a paperback horror novel: £8.89', 'Horror', '2023-02-23 18:03:37'),
(8, 'Humour and satire', 'Humour and satire', 'From dark dystopian satire like A Clockwork Orange to comedic memoirs, the humour genre spans a range of titles. Comedy writing is a real art, so this genre can be hard to pull off for new writers — but a funny book is truly unputdownable.', 0, 0, '1677175659.jpg', 'Books', 'Humour bestsellers:\r\nAnimal Farm — George Orwell\r\nAdventures of Huckleberry Finn — Mark Twain\r\nThe Good Soldier Švejk — Jaroslav Hašek', 'Humour and satire', '2023-02-23 18:07:39'),
(9, 'Literary fiction', 'Literary fiction', 'Literary fiction is reserved for books that don’t slot neatly into more traditional genres, although it can also be used to differentiate from lighter fiction. Most literary fiction books are character-driven rather than plot-driven, so they tend to be more introspective and meandering', 0, 0, '1677176358.jpg', 'Books', 'Literary fiction bestsellers:\r\nThe Catcher in the Rye — JD Salinger\r\nTo Kill a Mockingbird — Harper Lee\r\nWar and Peace — Leo Tolstoy', 'Literary fiction', '2023-02-23 18:19:18'),
(10, 'Romance', 'Romance', 'RomanceRomanceRomanceRomance', 0, 0, '1677176718.jpg', 'Romance', 'RomanceRomanceRomance', 'Romance', '2023-02-23 18:25:18'),
(11, 'Science fiction', 'Science fiction', 'Science fictionScience fictionScience fictionScience fiction', 0, 0, '1677176845.jpg', 'Science fiction', 'Science fictionScience fictionScience fiction', 'Science fiction', '2023-02-23 18:27:25'),
(12, 'Thrillers', 'Thrillers', 'ThrillersThrillersThrillersThrillersThrillers', 0, 0, '1677176956.jpg', 'Books', 'ThrillersThrillersThrillers', 'ThrillersThrillersThrillersThrillers', '2023-02-23 18:29:16'),
(13, 'Biography', 'Biography', 'BiographyBiographyBiographyBiographyBiography', 0, 0, '1677177060.jpg', 'Biography', 'BiographyBiographyBiography', 'Biography', '2023-02-23 18:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` mediumtext NOT NULL,
  `pincode` int(191) NOT NULL,
  `total_price` int(191) NOT NULL,
  `payment_mode` varchar(191) NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_no`, `user_id`, `name`, `email`, `phone`, `address`, `pincode`, `total_price`, `payment_mode`, `payment_id`, `status`, `comments`, `created_at`) VALUES
(1, 'jhilikcoder7213jhh', 4, 'njfg', 'gfnh', 'fnjhh', 'fjjjjjjjjjjjjjj', 0, 66, 'COD', '', 0, NULL, '2023-03-13 08:59:50'),
(2, 'jhilikcoder9469jhh', 4, 'njfg', 'gfnh', 'fnjhh', 'fjjjjjjjjjjjjjj', 0, 66, 'COD', '', 0, NULL, '2023-03-13 09:00:41'),
(3, 'jhilikcoder4716jhh', 4, 'njfg', 'gfnh', 'fnjhh', 'fjjjjjjjjjjjjjj', 0, 66, 'COD', '', 0, NULL, '2023-03-13 09:02:03'),
(4, 'jhilikcoder1376606106745', 4, 'Jhilik', 'rokshana.jhilik2016@gmail.com', '15606106745', 'testing adress', 1200, 66, 'COD', '', 0, NULL, '2023-03-13 09:04:10'),
(5, 'jhilikcoder3465606106745', 4, 'abc', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 66, 'COD', '', 0, NULL, '2023-03-13 09:14:08'),
(6, 'jhilikcoder5644606106745', 4, 'abc', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 66, 'COD', '', 0, NULL, '2023-03-13 09:15:15'),
(7, 'jhilikcoder2671606106745', 4, 'abc', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 66, 'COD', '', 1, NULL, '2023-03-13 09:16:35'),
(8, 'jhilikcoder7452606106745', 4, 'Rokshana Akter Jhilik', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 39, 'COD', '', 0, NULL, '2023-03-14 10:47:13'),
(9, 'jhilikcoder8848606106745', 4, 'Rokshana Akter Jhilik', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 40, 'Paid by PayPal', '3S1078095H661680V', 0, NULL, '2023-03-20 12:31:02'),
(10, 'jhilikcoder1924df', 4, 'asdf', 'asdf', 'asdf', 'asdf', 0, 13, 'Paid by PayPal', '36Y201947Y663340A', 0, NULL, '2023-03-20 12:45:03'),
(11, 'jhilikcoder8378606106745', 4, 'Rokshana Akter Jhilik', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 10, 'Paid by PayPal', '79J16923KY944245S', 0, NULL, '2023-03-20 12:47:36'),
(12, 'jhilikcoder1367606106745', 4, 'Rokshana ', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 15, 'Paid by PayPal', '6TM66401WB5474625', 0, NULL, '2023-03-20 12:50:13'),
(13, 'jhilikcoder7673df', 4, 'Akter ', 'rokshana11@gmail.com', 'asdf', 'dantu', 2011, 10, 'Paid by PayPal', '0XH00105GB2191604', 0, NULL, '2023-03-20 12:52:50'),
(14, 'jhilikcoder4734', 4, 'abcd', 'rokshana11@gmail.com', '1', 'dantu', 2011, 12, 'Paid by PayPal', '50370449JK6122819', 0, NULL, '2023-03-20 13:00:14'),
(15, 'jhilikcoder8487606106745', 4, 'Rokshana Akter Jhilik', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 27, 'COD', '', 0, NULL, '2023-03-26 16:40:12'),
(16, 'jhilikcoder8645606106745', 4, 'Rokshana Akter Jhilik', 'rokshana11@gmail.com', '15606106745', 'dantu', 2011, 7, 'Paid by PayPal', '4SN23059C6430542V', 0, NULL, '2023-04-05 18:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(191) NOT NULL,
  `prod_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` int(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`) VALUES
(1, 3, 13, 2, 15, '2023-03-13 09:02:03'),
(2, 3, 11, 3, 12, '2023-03-13 09:02:03'),
(3, 4, 13, 2, 15, '2023-03-13 09:04:10'),
(4, 4, 11, 3, 12, '2023-03-13 09:04:10'),
(5, 5, 13, 2, 15, '2023-03-13 09:14:08'),
(6, 5, 11, 3, 12, '2023-03-13 09:14:08'),
(7, 6, 13, 2, 15, '2023-03-13 09:15:15'),
(8, 6, 11, 3, 12, '2023-03-13 09:15:15'),
(9, 7, 13, 2, 15, '2023-03-13 09:16:35'),
(10, 7, 11, 3, 12, '2023-03-13 09:16:35'),
(11, 8, 12, 3, 13, '2023-03-14 10:47:13'),
(12, 9, 8, 1, 14, '2023-03-20 12:31:02'),
(13, 9, 9, 2, 13, '2023-03-20 12:31:02'),
(14, 10, 9, 1, 13, '2023-03-20 12:45:03'),
(15, 11, 10, 1, 10, '2023-03-20 12:47:36'),
(16, 12, 13, 1, 15, '2023-03-20 12:50:13'),
(17, 13, 10, 1, 10, '2023-03-20 12:52:50'),
(18, 14, 11, 1, 12, '2023-03-20 13:00:14'),
(19, 15, 13, 1, 15, '2023-03-26 16:40:12'),
(20, 15, 11, 1, 12, '2023-03-26 16:40:12'),
(21, 16, 14, 1, 7, '2023-04-05 18:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `small_description` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`) VALUES
(1, 2, 'She', 'She Kindle Edition', 'by Henry Rider Haggard (Author)  l   Format: Kindle Edition', 'This book was converted from its physical edition to the digital format by a community of volunteers. You may find it for free on the web. Purchase of the Kindle edition includes wireless delivery.', 20, 17, '1676813970.jpg', 0, 0, 1, 'She', 'She', 'SheSheSheSheSheSheShe', '2023-02-19 13:39:30'),
(8, 1, 'Don Quixote', 'Don Quixote', 'by Miguel De Cervantes Saavedra  (Author), John Rutherford (Editor, Translator), & 1 more', 'Nominated as one of America’s best-loved novels by PBS’s The Great American Read\r\nDon Quixote has become so entranced reading tales of chivalry that he decides to turn knight errant himself. In the company of his faithful squire, Sancho Panza, these exploits blossom in all sorts of wonderful ways. ', 16, 14, '1677318182.jpg', 4, 0, 1, 'Books', 'Don Quixote', 'Don QuixoteDon QuixoteDon Quixote', '2023-02-25 09:43:02'),
(9, 2, 'A Tale of Two Cities', 'A Tale of Two Cities', 'by Charles Dickens  (Author), Frederick Busch (Introduction), A.N. Wilson (Afterword)', 'by Charles Dickens  (Author), Frederick Busch (Introduction), A.N. Wilson (Afterword)by Charles Dickens  (Author), Frederick Busch (Introduction), A.N. Wilson (Afterword)by Charles Dickens  (Author), Frederick Busch (Introduction), A.N. Wilson (Afterword)by Charles Dickens  (Author), Frederick Busch (Introduction), A.N. Wilson (Afterword)', 20, 13, '1677318842.jpg', 7, 0, 1, 'Books', 'A Tale of Two Cities', 'A Tale of Two CitiesA Tale of Two Cities', '2023-02-25 09:54:02'),
(10, 3, 'And Then There Were Non', 'And Then There Were Non', 'by Agatha Christie  (Author)', 'yshdgafjhgkljsdhbflkjasdhfkkkkkkkkkklhgggggggggggggggggggggggggggggggggggggggggggggggggggg................\r\nggggggggggggggggg.....gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg.....\r\nggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggvklgfuhkcsdglkghjkhflkjlhsdlkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiiiiiiiiiiwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqlllllllllllllllllllllllllllllllllllllllllllllllllllllllllllbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbiuiiiiiiuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', 15, 10, '1677318970.jpg', 13, 0, 0, 'Books', 'by Agatha Christie  (Author)by Agatha Christie  (Author)by Agatha Christie  (Author)', 'by Agatha Christie  (Author)', '2023-02-25 09:56:10'),
(11, 1, 'Amezing girls', 'Amezing girls', 'by Sophie Potter  (Author)', 'In this book, you’ll meet seven girls who all face different challenges.\r\n\r\nEveryone reacts in the wrong way sometimes and makes bad decisions. But everyone also reacts in the right way sometimes and makes amazing decisions. We don’t always make the right call but by learning from our mistakes we’re able to grow into the good.', 25, 12, '1678268968.jpg', 13, 0, 1, 'Books', 'In this book, you’ll meet seven girls who all face different challenges.\r\nIn this book, you’ll meet seven girls who all face different challenges.\r\nIn this book, you’ll meet seven girls who all face different challenges.\r\nIn this book, you’ll meet seven girls who all face different challenges.\r\n', 'In this book, you’ll meet seven girls who all face different challenges.\r\n', '2023-03-08 09:49:28'),
(12, 1, 'Amons Adventure', 'Amons Adventure', 'by Arnold Ytreeide  (Author)\r\n', 'From the bestselling author of Lent and Advent children’s books, Arnold Ytreeide!\r\nFollowing in the footsteps of his widely popular Advent series--Jotham’s Journey, Bartholomew’s Passage, and Tabitha’s Travels--well-known author Arnold Ytreeide presents a captivating story to take families through the season of Lent, culminating on Easter Sunday.\r\n\r\nThirteen-year-old Amon, the son of Jotham and Tabitha, enjoys playing with his friends but is also ready to join his father in the temple court where only men are allowed. Eager to be considered a man, Amon struggles to divide his time betweenhis friends and his duties to family and faith. But when Jotham is falsely accused of a terrible crime, Amon willingly sacrifices his childhood ways in order to save his father’s life. Along the way, he sees the jubilant crowds that gathered on Palm Sunday, outwits the Roman soldiers that planned to kill both his father and Jesus, hears the Messiah address the angry crowds, is present during the daring betrayal of Judas Iscariot, and witnesses the ultimate sacrifice made on Good Friday.', 19, 13, '1678269417.jpg', 17, 0, 0, 'Books', 'From the bestselling author of Lent and Advent children’s books, Arnold Ytreeide!From the bestselling author of Lent and Advent children’s books, Arnold Ytreeide!', 'From the bestselling author of Lent and Advent children’s books, Arnold Ytreeide!', '2023-03-08 09:56:57'),
(13, 1, 'If I Live Until Morning', 'If I Live Until Morning', 'A True Story of Adventure, Tragedy and Transformation Paperback – March 18, 2018\r\nby Jean Muenchrath  (Author)', 'Best Book Awards Finalist (Travel & Essays Category).\r\nA story of courage, the author’s drive to survive, to heal, to manifest a new reality. If you are looking for an inspiring memoir, this is it!Reader Favorite Book Reviews.\r\nHer wilderness adventure turned into a nightmare. After skiing more than 200 miles along California s John Muir Trail, Jean faces death from a mountaineering accident on Mount Whitney. Broken and bleeding on the highest peak in the continental United States, she vows to realize her greatest dreams if she lives until morning. Her escape from the Sierra Nevada Mountains turns into an amazing five day survival story. Jean s recovery is equally daunting. In this outdoor adventure memoir, her three-decade journey takes her from the depths of despair and chronic pain, to the heights of the Himalayas and on travels around the world. When the specter of Mount Whitney continues to shatter her life, Jean befriends Tibetan Buddhist lamas. Their ancient wisdom guides her on a path beyond her wildest dreams.\r\n', 18, 15, '1678269683.jpg', 8, 0, 1, 'Books', 'Best Book Awards Finalist (Travel & Essays Category).Best Book Awards Finalist (Travel & Essays Category).Best Book Awards Finalist (Travel & Essays Category).', 'Best Book Awards Finalist (Travel & Essays Category).', '2023-03-08 10:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`id`, `prod_id`, `user_id`, `rating`, `title`, `description`, `added_on`) VALUES
(2, 9, 1, 'Good', 'asAS', '0', '2021-05-05 08:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` int(15) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role_as`, `created_at`) VALUES
(2, 'user', 'user@gmail.com', 2147483647, '3456', 0, '2023-02-13 19:48:57'),
(3, 'user', 'user@gamil.com', 216545766, '1234', 0, '2023-02-13 20:08:44'),
(4, 'Jhilik', 'rokshana.jhilik2016@gmail.com', 2147483647, '1132', 1, '2023-02-15 16:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(1, 1, 12, '2021-04-08 01:53:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
