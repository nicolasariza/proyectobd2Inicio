drop database if exists biblioteca;
create database biblioteca;
 biblioteca;	

create table tipo_doc
(
	id_tipo_doc int(10) not null auto_increment,
	nombre_tipo_doc varchar(30) not null,
	primary key(id_tipo_doc)
)engine=InnoDB;

create table tipo_usuario
(
	id_tipo_usuario int(10) not null auto_increment,
	nombre_tipo_usuario varchar(15) not null,
	primary key(id_tipo_usuario)
)engine=InnoDB;

create table persona
(
	id_persona int(10) not null auto_increment,
	id_tipo_doc_fk int(10) not null,
	num_documento bigint(20) not null,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	telefono int(10) not null,
	direccion varchar(40) not null,
	id_tipo_usuario_fk int(10) not null,
	primary key(id_persona),
	foreign key(id_tipo_doc_fk) references tipo_doc(id_tipo_doc),
	foreign key(id_tipo_usuario_fk) references tipo_usuario(id_tipo_usuario)
)engine=InnoDB;

create table genero_lit
(
	id_genero_lit int(10) not null auto_increment,
	nombre_genero_lit varchar(20) not null,
	primary key(id_genero_lit)
)engine=InnoDB;

create table autor
(
	id_autor int(10) not null auto_increment,
	nombre_autor text not null,
	primary key(id_autor)
)engine=InnoDB;	

create table editorial
(
	id_editorial int(10) not null auto_increment,
	nombre_editorial varchar(30) not null,
	primary key(id_editorial)
)engine=InnoDB;

create table idioma
(
	id_idioma int(10) not null auto_increment,
	nombre_idioma varchar(30) not null,
	primary key(id_idioma)
)engine=InnoDB;	

create table libro
(
	id_libro int(10) not null auto_increment,
	titulo varchar(40) not null,
	id_autor_fk int(10) not null,
	id_editorial_fk int(10) not null,
	id_genero_lit_fk int(10) not null,
	año int(5) not null,
	edicion int(10) not null,
	id_idioma_fk int(10) not null, 
	primary key(id_libro),
	foreign key(id_autor_fk) references autor(id_autor),
	foreign key(id_editorial_fk) references editorial(id_editorial),
	foreign key(id_genero_lit_fk) references genero_lit(id_genero_lit),
	foreign key(id_idioma_fk) references idioma(id_idioma)
)engine=InnoDB;

create table accion
(
	id_accion int(10) not null auto_increment,
	nom_accion varchar(15) not null,
	primary key(id_accion)
)engine=InnoDB;

create table estado_libro
(
	id_estado_libro int(10) not null auto_increment,
	nom_estado_libro varchar(15) not null,
	primary key(id_estado_libro)
)engine=InnoDB;

create table libro_persona
(
	id_libro_persona int(10) not null auto_increment,
	id_persona_fk int(10) not null,
	id_libro_fk int(10) not null,
	id_estado_libro_fk int(10) not null,
	id_accion_fk int(10) not null,
	fecha_prestamo date not null,
	fecha_devolucion date not null,
	tiempo_limite int(10) not null,
	observaciones varchar(100),
	bibliotecario_prestamo int(10) not null,
	bibliotecario_devolucion int(10) not null,
	primary key (id_libro_persona),
	foreign key(id_persona_fk) references persona(id_persona),
	foreign key(id_libro_fk) references libro(id_libro),
	foreign key(id_estado_libro_fk) references estado_libro(id_estado_libro),
	foreign key(id_accion_fk) references accion(id_accion),
	foreign key(bibliotecario_prestamo) references persona(id_persona),
	foreign key(bibliotecario_devolucion) references persona(id_persona)
)engine=InnoDB;	

insert into tipo_doc(nombre_tipo_doc) values("Cedula de ciudadania");
insert into tipo_doc(nombre_tipo_doc) values("Cedula de extranjeria");
insert into tipo_doc(nombre_tipo_doc) values("Registro civil");
insert into tipo_doc(nombre_tipo_doc) values("Tarjeta de identidad");
insert into tipo_doc(nombre_tipo_doc) values("NIT");

insert into tipo_usuario(nombre_tipo_usuario) values("Administrador");	
insert into tipo_usuario(nombre_tipo_usuario) values("Bibliotecario");
insert into tipo_usuario(nombre_tipo_usuario) values("Visitante");

INSERT INTO `persona` (`id_tipo_doc_fk`, `num_documento`, `nombre`, `apellido`, `telefono`, `direccion`, `id_tipo_usuario_fk`) VALUES
(1, 795184308, 'Jeronimo', 'Burgos', 1850091, 'calle 90 #13-63', 2),
(1, 856114389, 'Estefania', 'Villegas', 3222015, 'calle 60 a sur carrera 105', 2),
(1, 722708628, 'Guillermo', 'Fernandez', 2048742, 'cra 5 no. 30-51', 2),
(1, 682335343, 'Eliana', 'Ramirez', 2176886, 'transversal 18 numero 78 80', 2),
(1, 340356920, 'Jose', 'Carmona', 2309776, 'calle 71 a no 6-30 piso 17  ', 2),
(2, 432000202, 'Marcela', 'De santis', 4885391, 'pie del cerro calle 30 no. 17-206', 3),
(3, 459030586, 'Daniela', 'Franco', 4859508, 'calle 11 35-36  ', 3),
(5, 920468730, 'Rafael', 'Cortes', 6918845, 'calle 98 no. 22 64 piso 11', 3),
(5, 65620981, 'Camilo', 'Berrio', 9596200, 'b/grande cra.3 edif.ejecutivo of.702', 3),
(5, 951106024, 'Francisco', 'Arias', 9984228, 'cra 42 a # 1 sur 16', 3),
(3, 85094571, 'Antonio', 'Merizalde', 3248056, 'calle 103 no. 23-32', 3),
(1, 724929699, 'Karen', 'Restrepo', 7009914, 'transversal 3 no. 56-19', 3),
(4, 372536347, 'David', 'Lemus', 8534138, 'calle 22 127 51 in 4 bg 2 ps 2', 3),
(5, 506282424, 'Javier', 'Santana', 7788591, 'carrera 8a n. 99-51 torre a ofic.60', 3),
(3, 31616554, 'Virginia', 'Saldarriaga', 2714090, 'carrera 8a no.99-51 of.405', 3),
(2, 768721872, 'Sergio', 'Posada', 9129096, 'calle 83 n0 12-26', 3),
(5, 308667114, 'Jorge', 'Zea ', 7192560, 'calle 36 n.17-56 local 3-2', 3),
(4, 199459656, 'Mariana', 'Diaz ', 8874197, 'carrera 5 no. 30-61', 3),
(5, 440351329, 'Esteban', 'Giraldo', 3633330, 'calle 17 #43f-122', 3),
(2, 716574845, 'Jorge', 'Idarraga', 6274923, 'carrera 42 no. 29 a 71', 3),
(1, 199977870, 'Alejandro', 'Simanca', 8686561, 'carrera 50 nro 52-22 of 902', 3),
(3, 539313483, 'Angelina', 'Pulgarin', 8090506, 'cra 40 no 105-25 ', 3),
(4, 344628729, 'Brenda', 'Aguirre', 1690243, 'carrera 17e  59-57', 3),
(5, 860577335, 'Gloria', 'Tamayo', 5503853, 'carrera 43 a # 7-50 a of. 304', 3),
(1, 263514382, 'Andrea', 'Carmona ', 3826244, 'calle 8 nro 43 a 48 ', 3),
(2, 30245731, 'Lucero', 'Diaz ', 4779294, 'calle 23a no.68 d 46 z.i. montevideo', 3),
(2, 922467952, 'Angela', 'Alzate', 9620528, 'cl. 94 no. 21-59', 3),
(5, 419808042, 'Felipe', 'Arango', 4671888, 'calle 72 no. 10-07 piso 14', 3),
(3, 265475381, 'Elena', 'Garces', 5858790, 'calle 93 no 11-19', 3),
(3, 760636217, 'Carmen', 'Uribe', 6923427, 'carrera 8a # 123 - 41', 3),
(3, 429319778, 'Daniel', 'Ospina', 2239698, 'calle 87 no. 20-27 oficina 202', 3),
(2, 354063453, 'Alberto', 'Peláez', 2190761, 'carrera 20 # 90-12', 3),
(4, 462293152, 'Elena', 'Perez', 8398926, 'calle 86 no.11-14', 3),
(3, 541920909, 'Sebastian', 'Carmona', 2038929, 'avd.15 # 124 / 49 ofc. 206', 3),
(3, 108648009, 'Oscar', 'Cifuentes', 7581642, 'calle 86 # 11 16', 3),
(2, 549306823, 'Santiago', 'Jaramillo', 3941789, 'calle 37 n. 16 - 46', 3),
(3, 419047869, 'Luis', 'Melano', 6760509, 'carrera 5 # 12-16 oficina 607', 3),
(4, 133813551, 'Tammy', 'Mendez', 2610108, 'carrera 10 no.96-25 of.303', 3),
(5, 566586883, 'Tomas', 'Ramirez', 7043977, 'diagonal 41 no. 94 51 fontibon', 3),
(3, 651754658, 'Felipe', 'Girando', 5503892, 'avda san martin # 4-41,bocagrande de', 3),
(4, 624783214, 'Patricia', 'Diez', 6174847, 'calle 92 no 30-25', 3),
(1, 76213856, 'Luisa', 'Sierra', 7389224, 'calle 38a parque industr bloq b bod.28', 3),
(2, 713643139, 'Sara', 'Vallejo', 4524343, 'carrera 1 no. 46-84 piso 2', 3),
(2, 881227667, 'Alexandra', 'Guerrero', 3908282, 'transversal 6 no. 12-117 z.ind.cazuca', 3),
(4, 16521056, 'Lisa', 'Guerra', 9572447, 'carrera 90 no. 44 a - 72', 3),
(1, 686605005, 'Ana Maria', 'Rodríguez ', 4176581, 'calle 10 n.8-27 ', 3),
(3, 60656057, 'Sofia', 'Marulanda', 8361866, 'carrera 86 no 23-40 sur ', 3),
(3, 292677098, 'Paula', 'Palacio', 6120764, 'calle 10 no. 37 a 51 ', 3),
(1, 969770365, 'Jesus', 'Bermudez', 6874089, 'carrera 42 #10a-68 ', 3),
(2, 369658358, 'Roberta', 'Toledo', 9038055, 'cra.25 no.13-43', 3),
(1, 953215228, 'Tatiana', 'Arango', 4991669, 'calle 93 no.20-45', 3),
(4, 540968062, 'Melina', 'Acevedo', 4958035, 'calle 12 no. 38 - 62', 3),
(1, 995140532, 'Cristina', 'Cock', 6707056, 'calle 72 26-10', 3),
(4, 925046798, 'Manuela', 'Casadiegos', 9660332, 'calle 14 #15-46', 3),
(3, 862809129, 'Isabel', 'Salamanca', 9579761, 'carrera 25 #15-73 ', 3),
(4, 792326691, 'Juan', 'Arango', 6393761, 'carrera 61 no 32 07 sur', 3),
(1, 295880222, 'Luisa', 'Granda', 2134753, 'carrera 11 # 41 - 46', 3),
(2, 408314251, 'Monica', 'Arango ', 8648681, 'carrera 6 # 18 - 18', 3),
(2, 591979356, 'Federico', 'Arroyave', 8112229, 'calle 44n no.2fn-28', 3),
(4, 939151594, 'Dalia', 'Lemos', 1313443, 'avenida pedro de heredia # 22-88', 3),
(4, 97905803, 'Ana', 'Jaramillo', 8634742, 'calle 48 no 77-78', 3),
(1, 205646100, 'Maria', 'Lema', 6002548, 'central mayorista bloque 6 local 12', 3),
(5, 53362196, 'Diana', 'Caro', 4243011, 'avenida 30 de agosto no.28-53', 3),
(5, 804864876, 'Amalia', 'Vergara', 5301284, 'calle 10 no. 10 - 45', 3),
(4, 645307577, 'Julian', 'Duque', 8054018, 'calle 81 # 30-12', 3),
(2, 384593811, 'Maritza', 'Muñoz', 1952820, 'carrera 10 no 4-43', 3),
(4, 810002464, 'Andrés', 'Peláez', 2455530, 'kra 70 no. 75-40', 3),
(2, 495243461, 'Miguel', 'Sanchez', 5352349, 'carrera 15a no. 14-06', 3),
(3, 751529798, 'Carolina', 'Cano', 9863620, 'cra 22 nro 15-38', 3),
(1, 826681509, 'Jessica', 'Marquez', 9848043, 'avenida 13 no. 120-34', 3),
(2, 878827468, 'Samuel', 'Rico', 6011527, 'carrera 58 n. 62 - 74', 3),
(1, 515834474, 'Gustavo', 'Mendez', 4502582, 'calle 90 no. 21 32', 3),
(2, 564573181, 'Karina', 'Jimenez', 9267211, 'avenida quebrada seca 13-07', 3),
(3, 90859905, 'Julieth', 'Osorio', 4171762, 'calle 118 no.7-76', 3),
(4, 773634870, 'Lina', 'Villamizar', 8459192, 'avenida 3 norte no 33-22', 3),
(3, 955990938, 'Carlos', 'Gomez', 2506126, 'av. 6a no.0-102 la merced', 3),
(2, 83381584, 'Simón', 'Gracía', 9073052, 'calle 72 nro.13-49 piso 3', 3),
(5, 719004324, 'Monica', 'Castro', 6322820, 'calle 7 # 15a-21', 3),
(1, 638262489, 'Melisa', 'Uribe', 2417203, 'carrera 15 no. 9 23', 3),
(3, 526808937, 'Alejandra', 'Florez', 8992282, 'carrera 5a numero 37-55', 3),
(1, 106784579, 'Amalia', 'Gutierrez', 9001853, 'calle 81 n 4 12', 3),
(4, 501422968, 'Raquel', 'Medina', 3371077, 'carrera 43 a no. 7 50 ofc.1008 torre emp', 3),
(5, 589955786, 'Gonzalo', 'Betancur', 5278457, 'cra 9 # 74-08 p7', 3),
(4, 726453065, 'Santiago', 'Betancurt', 9109982, 'carrera 7 no. 74-21 piso 6', 3),
(2, 617484019, 'Isabella', 'Marquez', 6707566, 'avenida corpas # 157 a 60 - suba', 3),
(4, 247307535, 'Karla', 'Molina', 2160331, 'calle 21 no. 16 - 11 oficina 5c', 3),
(4, 966290951, 'Hilda', 'Rodriguez', 6651345, 'carrera 16 n- 79-20 of-906', 3),
(1, 970322261, 'Victoria', 'Hincapie', 4531000, 'calle 78 no.9-27', 3),
(5, 989639075, 'Pablo', 'Rojas ', 1776361, 'transv. 19 no. 59-54', 3),
(5, 84047115, 'Pamela', 'Serna', 7864022, 'calle 33 n. 16-37', 3),
(4, 486466239, 'Stepania', 'Zapata', 9431674, 'calle 75 no. 7-30', 3),
(5, 349921965, 'Manuel', 'Toro', 6459887, 'carrera 15 101 47', 3),
(5, 714090402, 'Barbara', 'Henao', 9138497, 'diagonal 24 no. 42 b 25', 3),
(4, 894876125, 'Leonardo', 'Vasquez', 1179542, 'calle  44 no. 34-54', 3),
(2, 277129385, 'Juliana', 'Castrillón', 3113215, 'calle 7 # 33-22', 3),
(5, 484289816, 'Dinara', 'Lopez', 1348823, 'carrera 8a n.99-51 torre a ofic.602', 3),
(1, 256759542, 'Elisa', 'Mota', 4282655, 'calle 34 no. 43-69', 3),
(4, 141379215, 'Alicia', 'Perez', 8464379, 'avenida 82 no. 11 - 50 int. 3', 3),
(5, 166580040, 'Carlos', 'Posada', 5776620, 'carrera 17 # 89-32', 3),
(4, 664523683, 'Mauricio', 'Arango', 6675865, 'calle 56  n. 5n-114 flora industrial',3),
(2, 924916508, 'Adriana', 'Hoyos', 7304039, 'parque industrial',3),
(3, 236562349, 'Miguel', 'Suarez', 5682350, 'carrera 7 no.74-21 piso 10',3),
(1, 124663897, 'Natalia', 'Aristizabal', 8326754, 'carrera 67 no. 58-31 sur',3),
(2, 790347978, 'Camila', 'Dominguez ', 7694367, 'cra.65b no.14-80',3),
(1, 585170345, 'Susana', 'Ruiz', 9989927, 'carrera 60 n. 12-63',3);

insert into genero_lit (nombre_genero_lit) values
("épica"),
("epopeya"),
("cuento"),
("novela"),
("fábula"),
("Romance"),
("Soneto"),
("Madrigal"),
("Tragedia"),
("Comedia"),
("Melodrama"),
("Tragicomedia"),
("Farsa"),
("Ensayo"),
("Bibliografia"),
("Cronica"),
("Fabula");

INSERT INTO `autor` (`nombre_autor`) VALUES
('Gabriel Garcia Marquez'),
('Amy C. Valenciano DVM MS DACV'),
('Charles Landry'),
('Craig E. Greene DVM MS DACVIM'),
('Derek Richards, Jan Clarkson,'),
('J. Gopal and S. M. Paul Khura'),
('Jiro Jerry Kaneko (Editor), J'),
('Johnson, M. / Bulechek, G.M. '),
('Rose E. Raskin DVM PhD DACVP '),
( 'Terry W. Campbell (Author)'),
( 'A.A.B.B.'),
( 'Abdaloff, W.'),
( 'Adriana Aubert, Ainhoa Flecha,'),
( 'Aires Mateus'),
( 'ALAN COLQUHOUN'),
( 'Alan Schatzberg, Charles Nemer'),
( 'Alex Ross'),
( 'Alexander R. Cuthbert'),
( 'Alexandra Boutros and Will Str'),
( 'Alexandro Bonifaz'),
( 'Alfonso Alcalde'),
( 'ALFONSO SANZ ALDUaN'),
( 'Alfredo Perez Sanchez- Enrique'),
( 'ALLAN B. JACOBS'),
( 'Allan Jacobs'),
( 'Alles, Martha A.'),
( 'alvaro Ruiz Morales y Luis Enr'),
( 'ALVARO SIZA'),
( 'Andrade, Elba; Fuentes, Walte'),
( 'Andreu, L'),
( 'Anne Varichon'),
( 'Anthony Vidler'),
( 'Anton Capitel'),
( 'Arnold Schoenberg'),
( 'Arnoldo Quezada'),
( 'Auer & Stick'),
( 'Ayala, Ricardo y Messing, Beat'),
( 'Ayala, Ricardo; Torres, Crist'),
( 'Barbara Kozier'),
( 'Barrientos A., L.F. Peñin, C. '),
( 'Barry Truax'),
( 'Behrman'),
( 'Benavente, David'),
( 'Bernard,F.R.'),
( 'Betty Edwards'),
( 'berk browlowsky'),
( 'Bisquerra, Rafael '),
( 'Bobes, Carmen'),
( 'Borges, Jorge Luis'),
( 'Botella, J'),
( 'BP Smith'),
( 'Bradley R. Schiller'),
( 'Brealey, David y Stewart Myers'),
( 'Bruce Alberts et al'),
( 'Bukofzer'),
( 'by NANDA'),
( 'C. Donoso, ME Gonzalez, A. Lar'),
( 'Carl Schorske'),
( 'Carlos Kraemer, Miguel Angel d'),
( 'Carlos Poblete Varas'),
( 'Carpenito Lynda '),
( 'Carpenito-Moyet'),
( 'Carrera, X. Figueroa, C.'),
( 'Caruso St John'),
( 'Case, Karl E. y Fair, Ray C.'),
( 'Catedra Arq. Enrique Garcia Es'),
( 'Ceron J y col.'),
( 'Cesar Ojeda'),
( 'Charles Burkhart'),
( 'Charles C. Bohl, Jean-François'),
( 'CHARLES DICKENS'),
( 'Cheol S. Eun y Bruce G. Resnic'),
( 'Christian Boltanski'),
( 'Christine Nuttall'),
( 'Christopher Small'),
( 'Cindy Owen'),
( 'Claudio Donoso'),
( 'Claudio Figueroa Lopez'),
( 'Cliff Moughtin'),
( 'Correa E., Silva H., Risco L.'),
( 'Cossa, Roberto'),
( 'Cristina Ratti (editor)'),
( 'CUBILLOS, LORENZO'),
( 'D Bowman'),
( 'Dan Hosken'),
( 'Daniel Goleman'),
( 'Danto,Coleman, Arthur'),
( 'Daugirdas John'),
( 'DAVID CHIPPERFIELD'),
( 'David Collier James Evans'),
( 'David Eiteman, Arthur Stonehil'),
( 'David Harvey'),
( 'David Hockeney'),
( 'David Howes y Costance Classen'),
( 'David Myers'),
( 'David P. Billington'),
( 'David Sonnenschein'),
( 'Da-Wen-Sun'),
( 'Dayna Baumeister'),
( 'DENISE SCOTT BROWN');


INSERT INTO `editorial` (`id_editorial`, `nombre_editorial`) VALUES
(1, ' AAB Office The Warwick Enterp'),
(2, 'Ablex Publishing'),
(3, 'Acantilado Quaderns Crema, S. '),
(4, 'AKAL'),
(5, 'ComLIB'),
(6, 'Akal Ediciones Sa'),
(7, 'Alianza MÃºsica'),
(8, 'Barcelona: Seix Barral'),
(9, 'Cambridge Univeristy press'),
(10, 'CASIMIRO Libros'),
(11, 'Detail'),
(12, 'Donn'),
(13, 'editorial siglo XXI'),
(14, 'El Croquis'),
(15, 'ELSEVIER'),
(16, 'Elsevier Health Sciences'),
(17, 'Focal Press'),
(18, 'La Muralla'),
(19, 'La oveja negra'),
(20, 'Madrid: Alianza Musica'),
(21, 'Madrid: Real Musical'),
(22, 'Mc Graw Hill'),
(23, 'Melos ediciones musicales'),
(24, 'Michael Wiese production'),
(25, 'Mosby'),
(26, 'Mundimusica'),
(27, 'Prometeo'),
(28, 'Real Musical'),
(29, 'Routledge'),
(30, 'S.L. FONDO DE CULTURA ECONOMIC'),
(31, 'Shinkenchiku-sha'),
(32, 'SIRUELA'),
(33, 'Springer'),
(34, 'taurus'),
(35, 'The MIT Press'),
(36, 'United States Pharmacopeia'),
(37, 'Wiley-Blackwell'),
(38, 'Wolke');

insert into idioma(nombre_idioma) values
("Español"),
("Ingles"),
("Frances"),
("Aleman"),
("Italiano"),
("Portugues");



INSERT INTO `libro` (`titulo`, `id_autor_fk`, `id_editorial_fk`, `id_genero_lit_fk`, `año`, `edicion`, `id_idioma_fk`) VALUES
('3rd Symposium on Potato Cyst Nematodes', 1, 1, 4, 2011, 3, 2),
('A Concrete Atlantis', 2, 2, 11, 2012, 5, 2),
('Acanthamoeba: Biology and Pathogenesis ', 3, 3, 8, 2010, 7, 2),
('Acoustic Communication', 4, 4, 17, 2011, 7, 2),
('Acoustics and the Performance of Music', 5, 5, 6, 2010, 6, 2),
('Acústica musical y organología', 6, 6, 7, 2013, 7, 1),
('Adams & Stashak´s Lameness in horses', 7, 7, 4, 2004, 3, 1),
('ALVARO SIZA, LECCIONES MAGISTRALES', 8, 8, 14, 2010, 6, 1),
('An introduction to music technology', 9, 9, 2, 2007, 5, 2),
( 'Ante la Imagen', 10, 10, 7, 2007, 4, 2),
( 'Applied Biopharmaceutics and Pharmacokin', 11, 11, 4, 2006, 6, 2),
( 'Armonía', 12, 12, 13, 2016, 5, 1),
( 'Armonía del siglo XX', 13, 13, 4, 2015, 6, 1),
( 'Arquitectura y Crítica', 14, 14, 12, 2005, 1, 2),
( 'Arquitectura: Crítica y Nueva Época', 15, 15, 5, 2014, 3, 2),
( 'Asi lo veo Yo', 16, 16, 1, 2015, 4, 1),
( 'Atlas of Canine and Feline Peripheral Bl', 17, 17, 2, 2011, 1, 2),
( 'Atlas of Equine Endoscopy', 18, 18, 16, 2005, 4, 2),
( 'Atlas para la identificacion de elemento', 19, 19, 9, 2012, 6, 1),
( 'Biomimicry Resource Handbook', 20, 1, 15, 2015, 4, 1),
( 'Biophilic Cities: Integrating Nature Int', 21, 2, 15, 2010, 6, 1),
( 'Boltanski', 22, 3, 1, 2009, 2, 1),
( 'Breve historia de la fotografía', 23, 4, 2, 2011, 6, 2),
( 'Calle de sentido unico', 24, 5, 15, 2001, 7, 2),
( 'Canine and Feline Cytology: A Color Atla', 25, 6, 7, 2008, 6, 1),
( 'CINCO CARAS DE LA MODERNIDAD: MODERNISMO', 26, 7, 6, 2013, 2, 1),
( 'Clinical Biochemistry of Domestic Animal', 27, 8, 4, 2010, 4, 2),
( 'Colores, Historia y significado', 28, 9, 13, 2001, 6, 1),
( 'Communicative Language Teaching ', 29, 10, 14, 2012, 3, 1),
( 'Constructores Inmigrantes. Transferencia', 30, 11, 8, 2001, 1, 1),
( 'DAVID CHIPPERFIELD, FIGURA Y ABSTRACCIÓN', 31, 12, 10, 2009, 2, 2),
( 'David Hockeney: El gran Mensaje', 32, 13, 3, 2007, 1, 2),
( 'Diagnosis and management of lameness in ', 33, 14, 12, 2011, 7, 2),
( 'Diccionario Akal del color ', 34, 15, 1, 2006, 5, 1),
( 'DIRECCION DE EMPRESAS INTERNACIONALES', 35, 16, 7, 2009, 4, 2),
( 'Direccion de Marketing', 36, 17, 11, 2007, 5, 1),
( 'El color del rio', 37, 18, 16, 2015, 2, 2),
( 'El color. Un método para dominar el arte', 38, 19, 5, 2009, 6, 1),
( 'El ruido eterno: escuchar al siglo XX a ', 39, 20, 12, 2014, 7, 2),
( 'El siglo del Collage. Una apreciación ra', 40, 21, 3, 2015, 2, 2),
( 'EN EL ESPACIO LEEMOS EL TIEMPO', 41, 22, 10, 2011, 7, 2),
( 'Introducción a SQL', 42, 23, 17, 2005, 3, 1),
( 'EN EL MUNDO INTERIOR DEL CAPITAL. PARA U', 43, 24, 1, 2010, 6, 2),
( 'Equine Internal Medicine', 44, 25, 10, 2011, 4, 1),
( 'Equine Surgery', 45, 26, 2, 2006, 7, 1),
( 'Ingeniería de redes', 46, 27, 9, 2014, 1, 1),
( 'Eric Fischl: The Krefeld-Project', 47, 28, 16, 2007, 3, 1),
( 'Espacio del capital. Hacia una geografía', 48, 29, 6, 2014, 1, 2),
( 'Exotic Animal Hematology and Cytology', 49, 30, 4, 1989, 5, 2),
( 'GEOMETRÍAS ACTIVAS', 50, 31, 5, 2012, 7, 1),
( 'Georgis´ Parasitology for veterinarians', 51, 32, 11, 2002, 2, 2),
( 'Historia de la Música occidental', 52, 33, 8, 2005, 2, 2),
( 'Historia del teatro en Chile (1941-1990)', 53, 34, 6, 2013, 5, 1),
( 'Infectious Diseases of the Dog and Cat', 54, 35, 12, 2012, 7, 2),
( 'Introduction to Ore-Forming Processes', 55, 36, 10, 2001, 3, 1),
( 'Introduction to Public Health: Edition 3', 56, 37, 17, 2001, 1, 1),
( 'JOAO LUIS CARRILHO DA GRACA, TRAZAR CONE', 57, 38, 10, 2006, 2, 2),
( 'Journal of Paloebiology  DOI: http://dx.', 58, 1, 17, 2001, 5, 1),
( 'La interpretación histórica de la música', 59, 2, 8, 2007, 3, 1),
( 'La música en la época Barroca', 60, 3, 14, 2010, 6, 1),
( 'La nueva naturaleza de los mapas : ensay', 61, 4, 16, 2001, 4, 2),
( 'La Pintura Encarnada', 62, 5, 16, 2001, 4, 1),
( 'La viena de fin de siglo', 63, 6, 5, 2010, 7, 1),
( 'Laughing Matters', 64, 7, 2, 2012, 5, 1),
( 'Le Corbusier Redrawn', 65, 8, 9, 2001, 4, 2),
( 'Libro de los pasajes', 66, 9, 1, 2001, 5, 1),
( 'Los ojos de la piel. La arquitectura y l', 67, 10, 16, 2001, 4, 1),
( 'Lucian Freud Paintings', 68, 11, 9, 2006, 1, 2),
( 'Matematicas nuevas', 69, 12, 14, 2012, 5, 2),
( 'Medicina Interna de grandes animales', 70, 13, 16, 2012, 3, 2),
( 'Metodología de la investigación educativ', 71, 14, 17, 2010, 4, 1),
( 'MOBY DICK (15 COPIAS)', 72, 15, 7, 2008, 1, 2),
( 'Motivational Strategies in the language ', 73, 16, 17, 2013, 6, 1),
( 'Music Technology and the project studio', 74, 17, 16, 2011, 7, 1),
( 'Musica, sociedad y educación', 75, 18, 10, 2015, 3, 2),
( 'MVRDV, CIUDAD EVOLUTIVA', 76, 19, 12, 2015, 2, 1),
( 'Neutelings Riedijk, CONVENCIONES E IDENT', 77, 20, 13, 2011, 1, 1),
( 'Ore Deposit Geology', 78, 21, 9, 2011, 3, 1),
( 'Organic Synthesis: The Disconnection App', 79, 16, 2, 2014, 7, 2),
( 'Psicología del Desarrollo, de la infanci', 80, 17, 13, 2002, 6, 2),
( 'RCR Arquitectes, ABSTRACCIÓN POÉTICA', 81, 18, 13, 2002, 5, 1),
( 'Schalm''s Veterinary Hematology', 82, 19, 5, 2005, 5, 1),
( 'Sedimentology and Sedimentary Basins: Fr', 83, 20, 3, 2011, 2, 2),
( 'SELGASCANO, VACILANTE NATURALEZ', 84, 21, 9, 2014, 6, 2),
( 'SMILJAN RADIC, EL JUEGO DE LOS OPUESTOS', 85, 22, 1, 2011, 1, 1),
( 'Spatial Audio', 86, 20, 16, 2011, 2, 1),
( 'STEVEN HOLL, CONCEPTOS Y MELODÍAS', 87, 21, 4, 2014, 1, 2),
( 'Structural Geology', 88, 22, 3, 2013, 4, 2),
( 'Teaching Reading Skills in a Foreign Lan', 89, 23, 3, 2013, 5, 2),
( 'Teoria de los colores', 90, 24, 8, 2013, 1, 1),
( 'Terror y utopia', 91, 25, 9, 2013, 1, 2),
( 'THE UNITED STATES PHARMACOPEIA - en espa', 92, 26, 2, 2014, 2, 2),
( 'Tratado de armonia', 93, 27, 4, 2014, 5, 2),
( 'trigonometria', 94, 28, 14, 2013, 1, 2),
( 'Un arte contextual', 95, 33, 1, 2012, 7, 2),
( 'Un siglo de música grabada', 96, 34, 5, 2013, 4, 1),
( 'Veterinary Hematology and Clinical Chemi', 97, 35, 12, 2013, 6, 2),
( 'Veterinary Hematology: A Diagnostic Guid', 98, 38, 17, 2014, 6, 1),
( 'Ways of Sensing. Understanding the Sense', 99, 38, 10, 2012, 6, 1),
( 'WUTHERING HEIGHTS (15 COPIAS)', 100, 38, 11, 2012, 7, 1);

insert into accion(nom_accion) values
("Prestamo"),
("Devolucion");

insert into estado_libro(nom_estado_libro) values
("Bueno"),
("Regular"),
("Malo");

INSERT INTO `libro_persona` (`id_persona_fk`, `id_libro_fk`, `id_estado_libro_fk`, `id_accion_fk`, `fecha_prestamo`, `fecha_devolucion`, `tiempo_limite`, `observaciones`, `bibliotecario_prestamo`, `bibliotecario_devolucion`) VALUES
(101, 1, 1, 2, '2015-12-14', '2016-04-25', 87, '-', 1, 5),
(102, 2, 3, 1, '2015-12-14', '2016-04-25', 8, '-', 2, 2),
(103, 3, 3, 2, '2015-12-14', '2016-04-25', 63, '-', 3, 4),
(104, 4, 2, 1, '2015-12-14', '2016-04-25', 82, '-', 5, 5),
(105, 5, 2, 1, '2015-12-14', '2016-03-23', 54, '-', 3, 5),
(6, 6, 3, 2, '2015-12-14', '2016-02-21', 50, '-', 4, 2),
(7, 7, 1, 1, '2015-12-09', '2016-01-11', 8, '-', 3, 4),
(8, 8, 1, 2, '2015-12-09', '2016-01-11', 32, '-', 5, 1),
(9, 9, 2, 2, '2015-12-09', '2016-01-07', 67, '-', 3, 4),
(10, 10, 2, 2, '2015-12-09', '2015-12-14', 77, '-', 3, 2),
(11, 11, 3, 2, '2015-12-09', '2015-12-14', 50, '-', 1, 4),
(12, 12, 1, 1, '2015-12-09', '2015-12-14', 98, '-', 4, 5),
(13, 13, 1, 1, '2015-12-09', '2015-12-14', 58, '-', 5, 5),
(14, 14, 1, 1, '2015-12-09', '2015-12-14', 54, '-', 1, 3),
(15, 15, 3, 2, '2015-12-09', '2015-12-14', 5, '-', 2, 3),
(16, 16, 2, 2, '2015-12-09', '2015-12-14', 6, '-', 3, 5),
(17, 17, 2, 2, '2015-12-03', '2015-12-09', 98, '-', 3, 1),
(18, 18, 2, 1, '2015-12-03', '2015-12-09', 85, '-', 2, 4),
(19, 19, 2, 2, '2015-12-03', '2015-12-09', 71, '-', 1, 5),
(20, 20, 1, 1, '2015-12-03', '2015-12-09', 47, '-', 4, 4),
(21, 21, 3, 1, '2015-12-03', '2015-12-09', 93, '-', 4, 1),
(22, 22, 1, 2, '2015-09-22', '2015-12-09', 57, '-', 3, 4),
(23, 23, 2, 1, '2015-08-13', '2015-12-09', 73, '-', 1, 3),
(24, 24, 2, 1, '2015-08-13', '2015-12-09', 97, '-', 5, 3),
(25, 25, 1, 2, '2015-08-13', '2015-12-09', 86, '-', 2, 5),
(26, 26, 2, 2, '2015-08-11', '2015-12-09', 21, '-', 2, 2),
(27, 27, 3, 2, '2015-08-07', '2015-12-03', 69, '-', 2, 2),
(28, 28, 1, 2, '2015-08-07', '2015-12-03', 39, '-', 1, 3),
(29, 29, 2, 1, '2015-08-07', '2015-12-03', 56, '-', 5, 4),
(30, 30, 1, 1, '2015-08-06', '2015-12-03', 31, '-', 4, 3),
(31, 31, 3, 2, '2015-08-05', '2015-12-03', 35, '-', 1, 2),
(32, 32, 3, 1, '2015-07-14', '2015-09-22', 56, '-', 3, 1),
(33, 33, 2, 2, '2015-07-14', '2015-08-13', 10, '-', 5, 1),
(34, 34, 1, 2, '2015-06-05', '2015-08-13', 25, '-', 1, 3),
(35, 35, 2, 2, '2015-06-04', '2015-08-13', 88, '-', 1, 2),
(36, 36, 1, 2, '2015-06-04', '2015-08-11', 82, '-', 3, 3),
(37, 37, 2, 1, '2015-04-30', '2015-08-07', 31, '-', 2, 3),
(38, 38, 3, 1, '2015-04-30', '2015-08-07', 25, '-', 2, 1),
(39, 39, 2, 2, '2015-04-30', '2015-08-07', 36, '-', 3, 1),
(40, 40, 2, 2, '2015-04-30', '2015-08-06', 24, '-', 4, 3),
(41, 41, 3, 2, '2015-04-30', '2015-08-05', 56, '-', 1, 5),
(42, 42, 2, 2, '2015-04-30', '2015-07-14', 76, '-', 4, 3),
(43, 43, 1, 1, '2015-04-30', '2015-07-14', 14, '-', 5, 5),
(44, 44, 3, 1, '2015-04-30', '2015-06-05', 71, '-', 5, 4),
(45, 45, 2, 1, '2015-04-30', '2015-06-04', 33, '-', 1, 4),
(46, 46, 2, 1, '2015-04-30', '2015-06-04', 8, '-', 3, 4),
(47, 47, 3, 2, '2015-04-30', '2015-04-30', 17, '-', 1, 1),
(48, 48, 2, 1, '2015-04-30', '2015-04-30', 26, '-', 2, 2),
(49, 49, 3, 1, '2015-04-30', '2015-04-30', 95, '-', 3, 2),
(50, 50, 1, 2, '2015-04-30', '2015-04-30', 23, '-', 5, 3),
(51, 51, 3, 2, '2015-04-23', '2015-04-30', 45, '-', 2, 5),
(52, 52, 3, 1, '2015-04-10', '2015-04-30', 81, '-', 4, 4),
(53, 53, 2, 2, '2015-04-10', '2015-04-30', 82, '-', 5, 2),
(54, 54, 3, 2, '2015-04-10', '2015-04-30', 34, '-', 2, 4),
(55, 55, 3, 1, '2015-04-10', '2015-04-30', 90, '-', 2, 1),
(56, 56, 2, 1, '2015-04-10', '2015-04-30', 7, '-', 5, 4),
(57, 57, 3, 1, '2015-04-10', '2015-04-30', 74, '-', 2, 5),
(58, 58, 1, 1, '2015-04-10', '2015-04-30', 99, '-', 1, 2),
(59, 59, 2, 1, '2015-04-10', '2015-04-30', 74, '-', 4, 5),
(60, 60, 1, 1, '2015-03-19', '2015-04-30', 82, '-', 1, 5),
(61, 61, 2, 1, '2015-03-18', '2015-04-23', 15, '-', 5, 4),
(62, 62, 1, 1, '2015-01-21', '2015-04-10', 12, '-', 1, 1),
(63, 63, 1, 2, '2014-12-22', '2015-04-10', 4, '-', 2, 3),
(64, 64, 3, 1, '2014-12-22', '2015-04-10', 47, '-', 5, 3),
(65, 65, 3, 1, '2014-12-22', '2015-04-10', 76, '-', 2, 2),
(66, 66, 3, 2, '2014-12-22', '2015-04-10', 46, '-', 2, 4),
(67, 67, 1, 1, '2014-12-19', '2015-04-10', 20, '-', 1, 3),
(68, 68, 3, 2, '2014-12-18', '2015-04-10', 32, '-', 5, 1),
(69, 69, 2, 2, '2014-12-17', '2015-04-10', 1, '-', 1, 2),
(70, 70, 1, 2, '2014-12-17', '2015-03-19', 3, '-', 4, 4),
(71, 71, 1, 2, '2014-12-17', '2015-03-18', 88, '-', 3, 1),
(72, 72, 3, 1, '2014-12-17', '2015-01-21', 24, '-', 1, 1),
(73, 73, 3, 2, '2014-12-17', '2014-12-22', 55, '-', 1, 1),
(74, 74, 3, 2, '2014-12-17', '2014-12-22', 11, '-', 3, 2),
(75, 75, 2, 2, '2014-12-17', '2014-12-22', 20, '-', 1, 1),
(76, 76, 2, 1, '2014-12-17', '2014-12-22', 6, '-', 4, 5),
(77, 77, 2, 2, '2014-12-17', '2014-12-19', 52, '-', 3, 5),
(78, 78, 2, 1, '2014-12-17', '2014-12-18', 68, '-', 2, 4),
(79, 79, 3, 1, '2014-12-17', '2014-12-17', 5, '-', 4, 2),
(80, 80, 2, 1, '2014-12-17', '2014-12-17', 21, '-', 2, 4),
(81, 81, 2, 2, '2014-12-17', '2014-12-17', 12, '-', 4, 5),
(82, 82, 2, 2, '2014-12-17', '2014-12-17', 56, '-', 2, 1),
(83, 83, 2, 1, '2014-12-17', '2014-12-17', 78, '-', 2, 5),
(84, 84, 3, 2, '2014-12-17', '2014-12-17', 77, '-', 4, 3),
(85, 85, 1, 1, '2014-12-17', '2014-12-17', 73, '-', 4, 1),
(86, 86, 1, 1, '2014-12-17', '2014-12-17', 83, '-', 3, 1),
(87, 87, 2, 1, '2014-12-17', '2014-12-17', 13, '-', 2, 3),
(88, 88, 1, 1, '2014-12-17', '2014-12-17', 60, '-', 4, 5),
(89, 89, 3, 1, '2014-12-17', '2014-12-17', 62, '-', 3, 4),
(90, 90, 3, 2, '2014-12-17', '2014-12-17', 84, '-', 2, 5),
(91, 91, 3, 1, '2014-12-17', '2014-12-17', 13, '-', 1, 3),
(92, 92, 1, 1, '2014-12-17', '2014-12-17', 87, '-', 3, 1),
(93, 93, 1, 1, '2014-12-17', '2014-12-17', 84, '-', 5, 1),
(94, 94, 1, 2, '2014-12-16', '2014-12-17', 24, '-', 3, 1),
(95, 95, 2, 2, '2014-12-15', '2014-12-17', 40, '-', 2, 1),
(96, 96, 2, 2, '2014-11-24', '2014-12-17', 11, '-', 2, 3),
(97, 97, 1, 2, '2014-10-05', '2014-12-17', 71, '-', 4, 2),
(98, 98, 3, 1, '2014-10-05', '2014-12-17', 16, '-', 1, 2),
(99, 99, 2, 2, '2014-10-05', '2014-12-17', 17, '-', 3, 1),
(100, 100, 1, 2, '2014-10-05', '2014-12-17', 88, '-', 5, 5);