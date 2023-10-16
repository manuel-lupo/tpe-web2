SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_albums`
--

-- --------------------------------------------------------

--
-- Table structure for table `Albums`
--

CREATE TABLE `Albums` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `rel_date` date DEFAULT NULL,
  `review` text NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Songs`
--

CREATE TABLE `Songs` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `rel_date` date DEFAULT NULL,
  `album_id` int NOT NULL,
  `lyrics` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Albums`
--
ALTER TABLE `Albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Albums`
--
ALTER TABLE `Albums`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Songs`
--
ALTER TABLE `Songs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Songs`
--
ALTER TABLE `Songs`
  ADD CONSTRAINT `Songs_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`id`);

INSERT INTO `Users`(`name`, `password`, `role`) VALUES ('webadmin','$2y$10$480tQnUpv7QrZgkJLwS2MO73HPcSDrdMPIRBD/dC1Bk4jiI4rc9Uy','admin');

INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('milo j x bzrp','2023/10/9','asasdsd','milo j and bzrp','rap','5');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('oktubre','1985/10/9','asassddsd','patricio rey y sus redonditos de ricota','rock','5');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('In the court of the crimson king','1969/10/9','asasdsddsd','king crimson','progressive rock','5');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('ruido de lluvia en el bosque','2006/10/9','asaxdxdxdsdsd','henry macdonald','ambient','4');
INSERT INTO `Albums`(`title`, `rel_date`, `review`, `artist`, `genre`, `rating`) VALUES ('delicate steve','2022/10/9','asasdsdsfsd','steve delicate','r&b','3');

INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('FRUTO','2023/10/9','1', "El día de mi suerte, yeah <br>
Sé que antes de mi muerte<br>
Seguro que mi suerte cambiará<br>
<br>
Soy el fruto del hustle del oeste<br>
Y no niego extrañar un poco el ante'<br>
Debo buscar la paz en quien no reste<br>
Quien no me reste, yeah-eh<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Right now<br>
Mis manos si caen, se levantan<br>
Vi hermanos mostrar cómo cambian<br>
Aldana llorando en mi show<br>
Abrazos que tocan el alma<br>
Cuando no encontraba el color (yeah)<br>
Mi mente pintó como un arma<br>
Vi perra', rata' y larva'<br>
Pero vi un destino mejor<br>
<br>
Cuál hay si quisiera una vida sana<br>
Y económicamente buena<br>
Salir un rato de las mala'<br>
A unos cuanto guacho' por sapos
Los hicieron saltar cual rana<br>
Me cansé de escuchar los cortes<br>
Los socorro y también las bala'<br>
<br>
Cuál hay si quisiera una vida sana<br>
Y económicamente buena<br>
Salir un rato de las mala'<br>
A unos cuanto guacho' por sapos<br>
Los hicieron saltar cual rana<br>
Me cansé de escuchar los cortes<br>
Los socorro y también las bala'<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
(Bizarrap)<br>
<br>
Soy el fruto del hustle del oeste<br>
Y no niego extrañar un poco el ante'<br>
Debo buscar la paz en quien no reste<br>
Quien no me reste, yeah-eh");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('OTURF','2023/10/9','1', "El día de mi suerte, yeah<br>
Sé que antes de mi muerte<br>
Seguro que mi suerte cambiará<br>
<br>
Soy el fruto del hustle del oeste<br>
Y no niego extrañar un poco el ante'<br>
Debo buscar la paz en quien no reste<br>
Quien no me reste, yeah-eh<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Right now<br>
Mis manos si caen, se levantan<br>
Vi hermanos mostrar cómo cambian<br>
Aldana llorando en mi show<br>
Abrazos que tocan el alma<br>
Cuando no encontraba el color (yeah)<br>
Mi mente pintó como un arma<br>
Vi perra', rata' y larva'<br>
Pero vi un destino mejor<br>
<br>
Cuál hay si quisiera una vida sana<br>
Y económicamente buena<br>
Salir un rato de las mala'<br>
A unos cuanto guacho' por sapos<br>
Los hicieron saltar cual rana<br>
Me cansé de escuchar los cortes<br>
Los socorro y también las bala'<br>
<br>
Cuál hay si quisiera una vida sana<br>
Y económicamente buena<br>
Salir un rato de las mala'<br>
A unos cuanto guacho' por sapos<br>
Los hicieron saltar cual rana<br>
Me cansé de escuchar los cortes<br>
Los socorro y también las bala'<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
Me cansé, odio tantas pregunta'<br>
Cambié, pero no me disgusta<br>
Sabía que iba a pasar desde los doce<br>
Y, desde entonce', al gloria y hasta nunca<br>
<br>
(Bizarrap)<br>
<br>
Soy el fruto del hustle del oeste<br>
Y no niego extrañar un poco el ante'<br>
Debo buscar la paz en quien no reste<br>
Quien no me reste, yeah-eh");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('TOY EN EL MIC','2023/10/9','1', "Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los diente', pero tuve otro plan<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los dientes, pero tuve otro plan<br>
<br>
Tengo el peso de mis ñeris en el barrio de colgantе<br>
Por eso no hay espacio para la chain de diamantе'<br>
Los guacho' terminaron siendo lo que vieron desde chico'<br>
Por eso, conozco a más rastreros' que cantante'<br>
Apenas tengo dieciséis, pero sé bien que los momentos<br>
Más felices que pasé nada tienen que ver con plata<br>
Hoy escribo esto en otro vuelo<br>
Pero aún no olvido el suelo y menos jugar en pata<br>
<br>
Perdóname, mami<br>
No siempre fui sincero<br>
Quería ser perfecto<br>
Ni que ando con una forty<br>
<br>
Perdóname, mami<br>
No creo en lo correcto<br>
Sueño con conciertos<br>
No voy a andar de running<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los diente', pero tuve otro plan<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los dientes, pero tuve otro plan<br>
<br>
'Toy en el top, dudo de mi alrededor<br>
Pero mis reales la suben<br>
Vivo mejor, pero aún no salí de Morón<br>
Y mi mente está en las nube'<br>
Pero es así, el tiempo me lo va decir<br>
Quién se fue y quién se quedó<br>
Vivo en el mood de vivir y antes de morirme<br>
<br>
'Toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los diente', pero tuve otro plan<br>
<br>
Y ahora 'toy en el mic<br>
Paco y cocaine, ese no es el huss<br>
Pero estuve al la'o siempre<br>
Vida mala en los dientes, pero tuve otro plan");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('Bzrp music session','2023/10/9','1', "Miré mi tarifa, pasé de mil a cien mil<br>
Aunque ahora lo mido en base a cuánto sufrí<br>
Todavía falta ver, también descubrir<br>
Escupo lo que antes no podía decir<br>
<br>
Errores que logré corregir<br>
Perra, me hice solo a bondi y dos pe<br>
Antes de que me llame el Gonza, era fan del Bi (¡Biza!)<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Mezclo flows, estilos y concepto'<br>
Los pasé a plata y me pone contento<br>
'Toy feliz, aunque parezca más muerto<br>
Llamó la muerte, pero hoy no contesto<br>
<br>
Le doy gracias a quien me traicionó<br>
Y me vi en situaciones que espantan<br>
Ahora, el negro catinga te canta<br>
Y tuve suerte, el camino me apilló<br>
<br>
Los flows no se desgastan<br>
Entre caídas y astucia, me hice cabida de industria'<br>
Y otras parecen de gangsta<br>
Money maker, hit maker en punga<br>
<br>
'Toy con mis reales ahora más que nunca<br>
El tiempo de a poco respondió un par de preguntas<br>
Sigo con quien, en las últimas, fue un buen segunda, je<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Yo no soy rico ni me siento por salir del barrio<br>
Me siento bien, mis dos abuelas siguen respirando<br>
De niño, pensé que, a los dieciséis, iba a morirme<br>
Y, con dieciséis, creo que llego a los veinte millonario<br>
<br>
O por lo menos en paz, sabiendo por lo que pasé<br>
Ojalá pudiera mostrarle a mis ángeles lo que logré<br>
Por eso, un comentario no me afecta<br>
Mi vida está perfecta, pero<br>
<br>
Me pusieron de enemigo' a mis hermanos, cuando los que me robaron fueron ello'<br>
Pegué un tema top global y todavía no veo un peso<br>
Vi cómo lloró mamá, angustiada, por no haberse rescatado del puñal que me clavaron en mis ojo'<br>
Ahora, por San José me miran de reojo<br>
Porque lo logré antes de poder terminar el colegio<br>
Sin tomar ni doparme, pagar ni plagiar o plaguiar me hice grande, por eso<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valores me cubren la espalda<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda<br>
<br>
Hoy me voy al sol, porque Dios me llamó desde el downtown<br>
Debo despertar, porque no se acalora mi alma<br>
Pero me salvé, en la neblina logré ver el alba<br>
Le hice honor a la J en mi nombre, y los valore' me cubren la espalda");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('21st century schizoid man','2023/10/9','3', "A-one, two, three, four<br>
Two, two, three<br>
Cat's foot, iron claw<br>
Neurosurgeons scream for more<br>
Paranoia's poison door<br>
21st century schizoid man<br>
Blood rack, barbed wire<br>
Politicians funeral pyre<br>
Innocents raped with napalm fire<br>
21st century schizoid man<br>
Death seed, blind man's greed<br>
Poets starving, children bleed<br>
Nothing he's got, he really needs<br>
21st century schizoid man");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('THE COURT OF THE CRIMSON KING','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('epitaph','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('moonchild','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('POWER','2023/10/9','3');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Jijiji','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('fuegos de oktubre','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('noticias de ayer','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('vamos los redo','2023/10/9','2');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Ruido de lluvia en el bosque','2023/10/9','4');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('Delicate steve','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('scooby galletas','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('outro','2023/10/9','5');
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`) VALUES ('THE END','2023/10/9','5');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
