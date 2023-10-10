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
  `rating` int DEFAULT NULL
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

INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('FRUTO','2023/10/9','1', "El día de mi suerte, yeah
Sé que antes de mi muerte
Seguro que mi suerte cambiará

Soy el fruto del hustle del oeste
Y no niego extrañar un poco el ante'
Debo buscar la paz en quien no reste
Quien no me reste, yeah-eh

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

Right now
Mis manos si caen, se levantan
Vi hermanos mostrar cómo cambian
Aldana llorando en mi show
Abrazos que tocan el alma
Cuando no encontraba el color (yeah)
Mi mente pintó como un arma
Vi perra', rata' y larva'
Pero vi un destino mejor

Cuál hay si quisiera una vida sana
Y económicamente buena
Salir un rato de las mala'
A unos cuanto guacho' por sapos
Los hicieron saltar cual rana
Me cansé de escuchar los cortes
Los socorro y también las bala'

Cuál hay si quisiera una vida sana
Y económicamente buena
Salir un rato de las mala'
A unos cuanto guacho' por sapos
Los hicieron saltar cual rana
Me cansé de escuchar los cortes
Los socorro y también las bala'

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

(Bizarrap)

Soy el fruto del hustle del oeste
Y no niego extrañar un poco el ante'
Debo buscar la paz en quien no reste
Quien no me reste, yeah-eh");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('OTURF','2023/10/9','1', "El día de mi suerte, yeah
Sé que antes de mi muerte
Seguro que mi suerte cambiará

Soy el fruto del hustle del oeste
Y no niego extrañar un poco el ante'
Debo buscar la paz en quien no reste
Quien no me reste, yeah-eh

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

Right now
Mis manos si caen, se levantan
Vi hermanos mostrar cómo cambian
Aldana llorando en mi show
Abrazos que tocan el alma
Cuando no encontraba el color (yeah)
Mi mente pintó como un arma
Vi perra', rata' y larva'
Pero vi un destino mejor

Cuál hay si quisiera una vida sana
Y económicamente buena
Salir un rato de las mala'
A unos cuanto guacho' por sapos
Los hicieron saltar cual rana
Me cansé de escuchar los cortes
Los socorro y también las bala'

Cuál hay si quisiera una vida sana
Y económicamente buena
Salir un rato de las mala'
A unos cuanto guacho' por sapos
Los hicieron saltar cual rana
Me cansé de escuchar los cortes
Los socorro y también las bala'

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

Me cansé, odio tantas pregunta'
Cambié, pero no me disgusta
Sabía que iba a pasar desde los doce
Y, desde entonce', al gloria y hasta nunca

(Bizarrap)

Soy el fruto del hustle del oeste
Y no niego extrañar un poco el ante'
Debo buscar la paz en quien no reste
Quien no me reste, yeah-eh");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('TOY EN EL MIC','2023/10/9','1', "Y ahora 'toy en el mic
Paco y cocaine, ese no es el huss
Pero estuve al la'o siempre
Vida mala en los diente', pero tuve otro plan

Y ahora 'toy en el mic
Paco y cocaine, ese no es el huss
Pero estuve al la'o siempre
Vida mala en los dientes, pero tuve otro plan

Tengo el peso de mis ñeris en el barrio de colgantе
Por eso no hay espacio para la chain de diamantе'
Los guacho' terminaron siendo lo que vieron desde chico'
Por eso, conozco a más rastreros' que cantante'
Apenas tengo dieciséis, pero sé bien que los momentos
Más felices que pasé nada tienen que ver con plata
Hoy escribo esto en otro vuelo
Pero aún no olvido el suelo y menos jugar en pata

Perdóname, mami
No siempre fui sincero
Quería ser perfecto
Ni que ando con una forty

Perdóname, mami
No creo en lo correcto
Sueño con conciertos
No voy a andar de running

Y ahora 'toy en el mic
Paco y cocaine, ese no es el huss
Pero estuve al la'o siempre
Vida mala en los diente', pero tuve otro plan

Y ahora 'toy en el mic
Paco y cocaine, ese no es el huss
Pero estuve al la'o siempre
Vida mala en los dientes, pero tuve otro plan

'Toy en el top, dudo de mi alrededor
Pero mis reales la suben
Vivo mejor, pero aún no salí de Morón
Y mi mente está en las nube'
Pero es así, el tiempo me lo va decir
Quién se fue y quién se quedó
Vivo en el mood de vivir y antes de morirme

'Toy en el mic
Paco y cocaine, ese no es el huss
Pero estuve al la'o siempre
Vida mala en los diente', pero tuve otro plan

Y ahora 'toy en el mic
Paco y cocaine, ese no es el huss
Pero estuve al la'o siempre
Vida mala en los dientes, pero tuve otro plan");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('Bzrp music session','2023/10/9','1', "Miré mi tarifa, pasé de mil a cien mil
Aunque ahora lo mido en base a cuánto sufrí
Todavía falta ver, también descubrir
Escupo lo que antes no podía decir

Errores que logré corregir
Perra, me hice solo a bondi y dos pe
Antes de que me llame el Gonza, era fan del Bi (¡Biza!)

Hoy me voy al sol, porque Dios me llamó desde el downtown
Debo despertar, porque no se acalora mi alma
Pero me salvé, en la neblina logré ver el alba
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda

Hoy me voy al sol, porque Dios me llamó desde el downtown
Debo despertar, porque no se acalora mi alma
Pero me salvé, en la neblina logré ver el alba
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda

Mezclo flows, estilos y concepto'
Los pasé a plata y me pone contento
'Toy feliz, aunque parezca más muerto
Llamó la muerte, pero hoy no contesto

Le doy gracias a quien me traicionó
Y me vi en situaciones que espantan
Ahora, el negro catinga te canta
Y tuve suerte, el camino me apilló

Los flows no se desgastan
Entre caídas y astucia, me hice cabida de industria'
Y otras parecen de gangsta
Money maker, hit maker en punga

'Toy con mis reales ahora más que nunca
El tiempo de a poco respondió un par de preguntas
Sigo con quien, en las últimas, fue un buen segunda, je

Hoy me voy al sol, porque Dios me llamó desde el downtown
Debo despertar, porque no se acalora mi alma
Pero me salvé, en la neblina logré ver el alba
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda

Yo no soy rico ni me siento por salir del barrio
Me siento bien, mis dos abuelas siguen respirando
De niño, pensé que, a los dieciséis, iba a morirme
Y, con dieciséis, creo que llego a los veinte millonario

O por lo menos en paz, sabiendo por lo que pasé
Ojalá pudiera mostrarle a mis ángeles lo que logré
Por eso, un comentario no me afecta
Mi vida está perfecta, pero

Me pusieron de enemigo' a mis hermanos, cuando los que me robaron fueron ello'
Pegué un tema top global y todavía no veo un peso
Vi cómo lloró mamá, angustiada, por no haberse rescatado del puñal que me clavaron en mis ojo'
Ahora, por San José me miran de reojo
Porque lo logré antes de poder terminar el colegio
Sin tomar ni doparme, pagar ni plagiar o plaguiar me hice grande, por eso

Hoy me voy al sol, porque Dios me llamó desde el downtown
Debo despertar, porque no se acalora mi alma
Pero me salvé, en la neblina logré ver el alba
Le hice honor a la J en mi nombre, y mis valores me cubren la espalda

Hoy me voy al sol, porque Dios me llamó desde el downtown
Debo despertar, porque no se acalora mi alma
Pero me salvé, en la neblina logré ver el alba
Le hice honor a la J en mi nombre, y mis valore' me cubren la espalda

Hoy me voy al sol, porque Dios me llamó desde el downtown
Debo despertar, porque no se acalora mi alma
Pero me salvé, en la neblina logré ver el alba
Le hice honor a la J en mi nombre, y los valore' me cubren la espalda");
INSERT INTO `Songs`(`title`, `rel_date`, `album_id`, `lyrics`) VALUES ('21st century schizoid man','2023/10/9','3', "A-one, two, three, four
Two, two, three
Cat's foot, iron claw
Neurosurgeons scream for more
Paranoia's poison door
21st century schizoid man
Blood rack, barbed wire
Politicians funeral pyre
Innocents raped with napalm fire
21st century schizoid man
Death seed, blind man's greed
Poets starving, children bleed
Nothing he's got, he really needs
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
