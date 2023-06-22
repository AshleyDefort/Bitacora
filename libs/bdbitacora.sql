/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.27-MariaDB : Database - bitacora
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bitacora` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bitacora`;

/*Table structure for table `acta_compromiso` */

DROP TABLE IF EXISTS `acta_compromiso`;

CREATE TABLE `acta_compromiso` (
  `codActa` int(11) NOT NULL AUTO_INCREMENT,
  `actaFecha` date DEFAULT NULL,
  `actaIdAprendiz` varchar(50) DEFAULT NULL COMMENT 'Id del aprendiz',
  `actaFicha` int(11) DEFAULT NULL COMMENT 'Ficha a la que pertenece el aprendiz',
  `actaFuncionario` varchar(50) DEFAULT NULL COMMENT 'Id del instructor que genera el acta de compromiso',
  `actaMotivoRemision` varchar(500) DEFAULT NULL,
  `actaDescargoAprendiz` varchar(500) DEFAULT NULL,
  `actaCompromisos` varchar(500) DEFAULT NULL,
  `actaRecomendaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codActa`),
  KEY `FK_ACTAS_APRENDIZ` (`actaIdAprendiz`),
  KEY `FK_ACTAS_FICHA` (`actaFicha`),
  KEY `FK_ACTAS_FUNCIONARIOS` (`actaFuncionario`),
  CONSTRAINT `FK_ACTAS_APRENDIZ` FOREIGN KEY (`actaIdAprendiz`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `FK_ACTAS_FICHA` FOREIGN KEY (`actaFicha`) REFERENCES `ficha` (`Cod_Ficha`),
  CONSTRAINT `FK_ACTAS_FUNCIONARIOS` FOREIGN KEY (`actaFuncionario`) REFERENCES `funcionario` (`ID_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acta_compromiso` */

/*Table structure for table `acudiente` */

DROP TABLE IF EXISTS `acudiente`;

CREATE TABLE `acudiente` (
  `Id_Acu` varchar(50) NOT NULL,
  `Acu_Nom` varchar(50) DEFAULT NULL,
  `Acu_Ape` varchar(50) DEFAULT NULL,
  `Acu_Tel` varchar(50) DEFAULT NULL,
  `Acu_Corr` varchar(40) DEFAULT NULL,
  `Acu_Parent` varchar(30) DEFAULT NULL,
  `Acu_Direc` varchar(50) DEFAULT NULL,
  `Id_AprFK` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Acu`),
  KEY `aprendiz_Acudiente` (`Id_AprFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acudiente` */

/*Table structure for table `apre_acud` */

DROP TABLE IF EXISTS `apre_acud`;

CREATE TABLE `apre_acud` (
  `Id_Apre` varchar(50) DEFAULT NULL,
  `Id_Acud` varchar(50) DEFAULT NULL,
  KEY `foreignkey1` (`Id_Acud`),
  KEY `foreignkey2` (`Id_Apre`),
  CONSTRAINT `foreignkey1` FOREIGN KEY (`Id_Acud`) REFERENCES `acudiente` (`Id_Acu`),
  CONSTRAINT `foreignkey2` FOREIGN KEY (`Id_Apre`) REFERENCES `aprendiz` (`Id_Apre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `apre_acud` */

/*Table structure for table `apre_ficha` */

DROP TABLE IF EXISTS `apre_ficha`;

CREATE TABLE `apre_ficha` (
  `Cod_Ficha` int(40) NOT NULL,
  `Id_Apre` varchar(30) NOT NULL,
  KEY `Id_Apre` (`Id_Apre`),
  KEY `Cod_Ficha` (`Cod_Ficha`),
  CONSTRAINT `apre_ficha_ibfk_1` FOREIGN KEY (`Id_Apre`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `apre_ficha_ibfk_2` FOREIGN KEY (`Cod_Ficha`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `apre_ficha` */

insert  into `apre_ficha`(`Cod_Ficha`,`Id_Apre`) values (1234,'456'),(2452524,'123'),(123,'456');

/*Table structure for table `aprendices_actas` */

DROP TABLE IF EXISTS `aprendices_actas`;

CREATE TABLE `aprendices_actas` (
  `codActaFK` int(11) DEFAULT NULL,
  `idAprendizFK` varchar(50) DEFAULT NULL,
  `codFichaFK` int(30) DEFAULT NULL,
  KEY `fk1` (`codActaFK`),
  KEY `fk2` (`idAprendizFK`),
  KEY `fk3` (`codFichaFK`),
  CONSTRAINT `fk1` FOREIGN KEY (`codActaFK`) REFERENCES `acta_compromiso` (`codActa`),
  CONSTRAINT `fk2` FOREIGN KEY (`idAprendizFK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `fk3` FOREIGN KEY (`codFichaFK`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `aprendices_actas` */

/*Table structure for table `aprendiz` */

DROP TABLE IF EXISTS `aprendiz`;

CREATE TABLE `aprendiz` (
  `Id_Apre` varchar(50) NOT NULL,
  `Apre_Nom` varchar(30) DEFAULT NULL,
  `Apre_Ape` varchar(30) DEFAULT NULL,
  `Apre_Tel` varchar(50) DEFAULT NULL,
  `Apre_Correo` varchar(50) DEFAULT NULL,
  `Apre_Sexo` varchar(50) DEFAULT NULL,
  `Apre_Rol` char(5) DEFAULT NULL,
  PRIMARY KEY (`Id_Apre`),
  KEY `aprendiz_rol_fk` (`Apre_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `aprendiz` */

insert  into `aprendiz`(`Id_Apre`,`Apre_Nom`,`Apre_Ape`,`Apre_Tel`,`Apre_Correo`,`Apre_Sexo`,`Apre_Rol`) values ('123','KENER','ROMERO','123','kener@gmail.com','MASCULINO','APREN'),('456','MARIA','LOPEZ','234','maria@gmail.com','FEMENINO','APREN');

/*Table structure for table `bitacora` */

DROP TABLE IF EXISTS `bitacora`;

CREATE TABLE `bitacora` (
  `Cod_Bit` int(20) NOT NULL,
  `Bit_Fecha` datetime DEFAULT NULL,
  `ID_FuncFK` varchar(30) DEFAULT NULL,
  `Id_ApreFK` varchar(30) DEFAULT NULL,
  `Bit_Des_Larg` varchar(300) DEFAULT NULL,
  `Cod_Des_CortFK` int(30) DEFAULT NULL,
  `fk_ficha` int(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Bit`),
  KEY `Id_ApreFK` (`Id_ApreFK`),
  KEY `ID_FuncFK` (`ID_FuncFK`),
  KEY `Cod_Des_CortFK` (`Cod_Des_CortFK`),
  KEY `bitacora_ibfk_6` (`fk_ficha`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`Id_ApreFK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`ID_FuncFK`) REFERENCES `funcionario` (`ID_Func`),
  CONSTRAINT `bitacora_ibfk_3` FOREIGN KEY (`Cod_Des_CortFK`) REFERENCES `descripcion_corta` (`Cod_Desc_Cor`),
  CONSTRAINT `bitacora_ibfk_6` FOREIGN KEY (`fk_ficha`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bitacora` */

/*Table structure for table `bitacora_aprendiz` */

DROP TABLE IF EXISTS `bitacora_aprendiz`;

CREATE TABLE `bitacora_aprendiz` (
  `Cod_Bit_FK` int(20) DEFAULT NULL,
  `Id_Apre_FK` varchar(50) DEFAULT NULL,
  `Cod_Ficha_FK` int(30) DEFAULT NULL,
  KEY `bitacora_aprendiz1` (`Cod_Bit_FK`),
  KEY `bitacora_aprendiz2` (`Id_Apre_FK`),
  KEY `bitacora_aprendiz3` (`Cod_Ficha_FK`),
  CONSTRAINT `bitacora_aprendiz1` FOREIGN KEY (`Cod_Bit_FK`) REFERENCES `bitacora` (`Cod_Bit`),
  CONSTRAINT `bitacora_aprendiz2` FOREIGN KEY (`Id_Apre_FK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `bitacora_aprendiz3` FOREIGN KEY (`Cod_Ficha_FK`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bitacora_aprendiz` */

/*Table structure for table `competencias` */

DROP TABLE IF EXISTS `competencias`;

CREATE TABLE `competencias` (
  `comp_Cod` int(20) NOT NULL,
  `comp_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`comp_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `competencias` */

/*Table structure for table `descripcion_corta` */

DROP TABLE IF EXISTS `descripcion_corta`;

CREATE TABLE `descripcion_corta` (
  `Cod_Desc_Cor` int(50) NOT NULL,
  `Des_Cort` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Desc_Cor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `descripcion_corta` */

/*Table structure for table `ficha` */

DROP TABLE IF EXISTS `ficha`;

CREATE TABLE `ficha` (
  `Cod_Ficha` int(30) NOT NULL,
  `Desc_Fich` varchar(50) DEFAULT NULL,
  `Cod_ProFK` int(30) DEFAULT NULL,
  `fechaIni_Fich` date NOT NULL,
  `fechaFin_Fich` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Ficha`),
  KEY `Cod_ProFK` (`Cod_ProFK`),
  CONSTRAINT `ficha_ibfk_1` FOREIGN KEY (`Cod_ProFK`) REFERENCES `programas` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ficha` */

insert  into `ficha`(`Cod_Ficha`,`Desc_Fich`,`Cod_ProFK`,`fechaIni_Fich`,`fechaFin_Fich`) values (123,'gestion',1,'2023-05-09','2023-05-31'),(1234,'gestion',2,'2023-05-17','2023-05-31'),(2452524,'SISTEMAS',1,'2022-01-24','2024-01-01');

/*Table structure for table `ficha_fucionario` */

DROP TABLE IF EXISTS `ficha_fucionario`;

CREATE TABLE `ficha_fucionario` (
  `cod_ficha` int(30) DEFAULT NULL,
  `id_funcionario` varchar(50) DEFAULT NULL,
  KEY `fucnionarioId` (`id_funcionario`),
  KEY `fichaCod` (`cod_ficha`),
  CONSTRAINT `fichaCod` FOREIGN KEY (`cod_ficha`) REFERENCES `ficha` (`Cod_Ficha`),
  CONSTRAINT `fucnionarioId` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ficha_fucionario` */

insert  into `ficha_fucionario`(`cod_ficha`,`id_funcionario`) values (123,'1129506976');

/*Table structure for table `funcionario` */

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `ID_Func` varchar(50) NOT NULL,
  `Fun_Tip_Doc` varchar(50) DEFAULT NULL,
  `Fun_Nom` varchar(30) DEFAULT NULL,
  `Fun_Ape` varchar(30) DEFAULT NULL,
  `Fun_Tel` varchar(30) DEFAULT NULL,
  `Fun_Correo` varchar(50) DEFAULT NULL,
  `Fun_Pswd` varchar(100) NOT NULL,
  `Fun_Direcc` varchar(50) DEFAULT NULL,
  `Fun_Rol` varchar(20) DEFAULT NULL,
  `Fun_Img` blob DEFAULT NULL,
  PRIMARY KEY (`ID_Func`),
  KEY `Cod_RolFK` (`Fun_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `funcionario` */

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Rol`,`Fun_Img`) values ('1001946423','Cedula de Ciudadania','BRAYAN','LOPEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN',NULL),('1129506976','Cedula de Ciudadania','ASHLEY','DEFORT','3215795145','ashley@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b','Calle 59C 22E-10','ADMIN','����\0JFIF\0\0\0\0\0\0��\0C\0	\Z!\Z\"$\"$��\0C��\0rr\"\0��\0\0\0\0\0\0\0\0\0\0\0\0	��\0N\0\0	\0\0!�1Qa�Aq�\"���U��23BR#br$S�������57CDTs%46c�t��\0\0\0\0\0\0\0\0\0\0\0\0\0��\06\0\0\0\0\0!1Aa\"2Qq��B���4R3��$C����\0\0\0?\0�U�@X�\0@[�%�H\0�K�\\	`Z��n*������@[��\0[���qp -����\0@P-���nN��rT\0��\0��\0�qp -����\'@Ũ�nN�n@\0��\\qp -������@[��n.���	QR�j��z�[��=o��Q����x�n��z�]E�����P%G���	�x���\Z�=o����O[�Kr\\G���j��z�..���yu%�z�=o\Z��O[ǭ常��������=o�x�n.��z�[��=o-�pQ�x��[ǭ�.���qp���P%EE��z�=oQRܗ�x��\\�z�=o-ƠJ�[˨����yn.��z�]F�O[ǭ��	�x����@���[�q����yuz�=o.�P%An\0����\\qp\'�����\\	������\r~#��ܗ\0=o-�����[�qp ���[�qp&�ķ[���z�=o�\rG�����[��=o8x���������W��V�J��l<q��tU��]L2{�؉P»�4���ix��2�e6K���Vc�N�9�t��?�D��e�Ny��f�;4���1r���}�y|�N��\rţP���R���̶I�Q\n��#�O�G=�ƿܓ\"�6�\0SQRy!ti0��e����.(����3H��OH!_#R���(���9�9��\0��t_B}��#辇��he�c�\0dVy�-ظ�����C���:��_$b�*6�3��X��6��K��i���+j\"�\0��\'��|(�v��r�	�a���%m.\n+G*|\Z&�S�\'9�f�T�����*G$*�����*d����L�5�T}��u��]�\"��6����9��%�q��3����H��nh�l�A�av�+,N>1Kt�?����Y~\"�O�q?���w|Lf�\r[�Ӽ2^��\'�UM4�W1P���qp��qp��qp��qp��[�qp\'�����\\	�x^�[��=o����M~#��ܗ��z�[��5��[�qp\'��R�\\	�xԷz�p��n.��n.��n.��UE��-���-���-���-���-���-����n.��nq1��.\n\Z�&�_�;��A5��v�*�����Aߟ6p�\0y��a�x���	��Ex��|L$ٓf��M�Ȟ�m��>-�Z[��f͍�Y0��IQL��M��a1y�;i�����\0,��o��ȬC�>К�JK���j.P&�R��5\Z��	��\\\\�R�&�Qqp\Z�E��j5(j5�Ԥ��&7�iȟ����=��i�/w%D��>�Ϫ5�\\��J��1�����1a:��D�g2�[&�M6��h����;\rHfE���ד�֦O�C/��In�1�~q��R3�����s2w0��Ͻ-I�ѲXP�!�PX�PX�XX�XX���,,[��,,[�@�-���.��K��J��J�,,[��,,[��,,[���qp%����Kq�[��,-ķX[�n.��n.����mB�Q:%�c��b��Y^�|�./ˉ�Ͷ�\\���%6=�?�^\\O3Z�O����O��ߋ��&[�46�[�g2�)�+\r9Pn������(���qEum���..Y�c�Lq�a-ĺ�����j..Q���\rIn%��\rF���5\Z����j..��]E��\rF���5\Z���-ĺ���-ĺ����j./��Qqp\Z�E����e2����E��/��.O��c..&7c|u�mhݽe٦\nR���U����s�:�1\'i�TӣL��[C6U%c���1~�������>f}׮>����|�D�6Lṕ�i����鍺JX[�n.��n.�b�\\	ab�\\	an%��[�n.�n%����Kqp �n.�[�%���XX�\0%����	ab�,,Z\n���	aaB���h4X[�t0��s\'��IL�O���̘����[���f�>W��GJ�]��$j�q�Ƿ\\����o��8x�D�L�Ϙ����#�w�vv4�J��=e,,[��6��ſp%��~��ſ\\��~�Kq-�!~	n\"ſ/�	ab߂���-��@Kq-��X[�o�_��ſ~	ab߂���o�_�[��o�_��ſ/�	ab߀�\0%��~�\0��[�B��7��ߑ1���?4m�Fq�� ��{����߂���8[M:��\Zf3X��}52�K�l,kY&^�s�ܦ��ׯeM5UF�*���ˆح��A�\n����h��h4XX�\n,,]�KA��Š�	n\"Š�	n �\0%�h(�Z�,A@\"��TJ\0���J\0��h4�@%���&�]訒W5L�\0:s�XlMJ�k||�/Ԙ��a�l����=���暷.K�kM���&�wm���.���ņ���_#ļC�J�y�\0����@�Z\\�|���\0A���\n�+������D�T��+�bf#����^���7=�6��Q�O�jb������P����0ѯ�\"�j�W������s�k)�ۢ�l����n����W��M�p�I�7�CJ�ڎ�F�{>W8��?�3%�ۭ�ĵ��,5�\0;Y�$g]^v�~��Yl`���l=�7\r�[�&l1��g&��11�!\0-�B\0}�h\0�\0}�r��\0\0�ɘ��&��qLý�{�˗#�݆Lu�^[C�$͗:T3%F��%T׉�XѲl�v_6��LO߂����+&�bQA�Z�8��=�ϣ���t\Z���E��Qb�J\0���h�b�(��t\Z,,]�K�\0XX,,[,,[\0%�����l@��mCq4�Uo�lj{G���,&/쓤q/�|/Ԙ��a�l��;A��TQap��	�(����L)4\ZDl���\\u媂h4D�Rx�\n\0�\Z\r\0x�\r\0PXh4@PM�P	���[W��ܞ�c�N{U�.�L�J�st\\Πھӳ���#/u�]U%:̉s�zҞl��q:~�����I�rm��Y/�<�L�����zc�HU^�P����(S�^K�8�M�:/�!=��8��1�Q:��um�l�,�g>N��alc�l���mfdڙ�Α-�\0&)i.ToV�j|鸉�n\"lɳ�����g΂�fL��;�fY�l�.��\nҀ�����\0,�j(\"���iѭL�U�{Q�5�\\��[����.��h`o�_��2^��gdLn�����S��,���s�Cr��i�7�C~���ٌ��.V=ag�D�b����6��$�<堿����1����\'K֪���~\'�歘�M�������fo�άr��&�h����+%Μlm2�k�P͉9q�Q�W��*��/ßٟf}uv�0ށ��B�t��(4\ZA�]\0��\r\0��\r\0��\r\0��!�����z\Z�.\'��[5�pgA��V/Oga�1�R!�&%+}�Ƌ�fS2��U�LN���\\��:\\�0͕��S)�vp�:y�oG�aab�Ŭ�-���-�`-����-���`[\0!I��\0�]\0�%y@ ��h\0\r��C�9��H�R��������<t������|ۻ������M�x.���k��m�۫n���M�6w��*��~\"�A�+K���J����h��A��\\h4q~#A�\rEƇ3��2��v:|0�z8�vK�6�$��1���l�%K�dِ˗n(�i$���܎������<�fbM��6%Uϸ���[��v���������p�vRt�m78��-˛���o]Ŧ���������LL�ؙ��1��66�q�qD������3��\0@j5\0\0\0�P\0\0\0j\0\0\0\0]H\0�6�\\�gܼ&:(��r��D�2R��~��\n���~u����q0ϑ���~)����-�̶k2X���tS���rj��zꎾ��_��ֿev�OXzz����{E��&U;��Q5ߕ�k�~(��z�^��Z��J����������A����..4\Z\0�j4\Z\0�_��h�L���?�͉�<n�u�_3�Љ���rW��Ȇ(c�EM5f�KcW�|ӹ��\"�[���\'�m�S1����,��\n��B�Xh4\0RW�k�	oH��!�^E� \Z�h\0j5��	��i����j4��> ��i�\Z|@j5\Z|Hڅ7J��2����b�2��^1?h���18��͊����r\\�n�f�}�������C�u#hv��\n��y5\Z��M�Q��hQ��hRx�.��p\rF�A�\rF�A�\rF�BD�i$�m�$��3f/���cg�\'&��vK��Wl��h{c�ڜû�N])�a!������V^-��W�(��0y~cY^\Z&�N��V�K�k�m��-�����1����d�j)�S��XS��)��QNC@QNB��j)�S�� \Z�NB��j5�)��QNB��j5�)��QNB����QNB���lv�cvk8���D���[�3`����?�~�ȳLs�H̰3{�\'CU]�׃N�����o]�mo���1�;�n.$�q;J�r��{�*?����\r�;ϳ?IWz�ÿu\Z�Q����.��k��F�@\Z�F�@\Z�F�@\Z�F�@\Z�F�@\Z�F�@\n����vw3�n�M��yj��\02�SN���x��LL�:E�&�S�ȵw�\Z���y�;Q���08�x�,���Kw��~���83����O��� ��5\Z|J�k�\Z|F�\Z�F���\n	�x�5\Z\r\0��K�4�5&�@.�RW����mfa���TT�b��xk�y��v&^2|�݁W��#A�O���G>c�Q�����#yݽ���ni��Q��hZ�\Z�F�@\Z�F�@\Z�F�@\Z�F�@\Z�F�@\Z�F�@\Z�a�nּ��m1�.(]�����|���ks�>�d����P�\\\r���0�7��M�f�q���?���O��dOŷ]�q���§�^���V��\\}At�ye�^C@%t\Z5�T	��t\0ANe��4S�.�����@\Z���(]�AB��PA^@wob�Z�,�����`�(��J^�?�86vN����~\'+̰��?g>D�«��MU5�=7�9�=�0���N��CZ�\"Vp�i�||OU�u�5<;w�����wd�\Z��aQ��h4��h4��h4��h4��h4��h41���q~�lT�9�}�����Ӂ��u�y��c�ۂP�u�*��]�x2�Ǜ����\0�?��jM�[�j5&�@.�Rh4�5&�@(&���p \0rj.\0��\\�2{�i{��{�Mk6��k�]����pr��%:�O�h�V`�R�Q�q�Q6��m�&��C�����Qj���K�A�aa����A��UTh4aa��	n%�h�F��2����Q�*[R���+�U�S�)Y����n�>�6��9�96ep�������+ru:���6d��ΛQ̎\'q;�۫o͟\ZQ���NI�mDm�5\Z\r\n\ns\Z\r\0��\0\Z\r\0\rF�@\0h4�\Z\r\0���h4�\Z\r\0��\0\Z\r\04\Z\0;+���x,�fE��I�~M]����R��K��]�	>n+��)seF��ޚuO�/�g�c$y\"cx��+͗ͥg�4��S�+�cV�h�FOF{��-X�v����F�F4fH5\Z�р��,4c@�Ÿ0)4cFQU�hƌ�3&Ƽ>	�}��Ɨ�{�o���4a�Z&��bQCޅ���e���<o���4q{�l�����wC7r����r�w��rܗ!��\\�r܂�+�����a`-��a`sS��c���	�e^.q?��Y��\'���̟�!o~��L�l���u�6�o�ft���\Z\\֛ϓ���>l[��}6-���,K����\n����,,�����#�ʏ݁}�rO��@���=Q����m$�[n�_����[M���nӟ���\n�.��3������Y�:�5�l\0*�TT\0��\0**-�XEE��TTXXEE��TTXX\0��QQa`�EE�����v���\0��;!�i�S%7�e\Z�\0�ӛ;l��f�r�n_�8��ᚡ��n�V��m��zn���?���{�����K��-������|�X�|��PK��K�}�İ@�����0�9���v4�S��~���USM=��k��b�\',P���/���KhWx�sx�.��{����nYqqa`-�a`O��h4�\\��	��\Z��b��%�!w����[�����ss�OڳI��)�a�V���p����6�M������h4%y�qInh�[��qI�����pыI��\0Anh�z�Rh,��^f�̱�ݙ�c.����sI���ø�hLs.�2�b�,اƹB����}���|g/>����ctQ~$�hrV-9�h4��4\Z\0�I���&�@(&�@.���h��A�R\\h4r�A�A�A��Iq��\n5&�@(&�@=5����;,�����.c{�p{��6���.�u~�ه����\'W���B��1�Qkz����?\'�>��GGf��=n\Z\rT�=n�\r�=n\Z\r\0z�RX[��Xh\'��A�[�����[����ϙ�Q?rz�޾�����-��i�M1�0�H�&��웍N>\nz��%O�tp���Oޅ;11;J�5%Q�((��qrXXqrXXs��b-�9:D��>n��s,k�g���8h_�^J��ɬo+�S��k%��ށz��n\0[���X�t%�p�	n�\0�)�a`/á-�Uz\n��t\'n8׊ۈ��*Ä��.�i��\0�]\r�m�/��a�b{�Qb�P�0���$a�x]VO5��-��Д����ȿt7��`��l���Z��e-�����v���I�B�4:�	AO!a`��t-�`�l,�ABؕ@/�j,,���l���XX�<���t�6�~�E\'��&�K�9�F�\rl�D�^TO�\'��lI1��t-��`��x}�������4p��(Z�|]N���vu�����D�0�o�~��Dl���祽a��xz_��t%��媽<�n�^��`>�rXXqrXXqr[��\0>�zx��}W�,-�\r�c��3������S3�4����sX`n��N�|U57K�6�[N\\�꺋���-U�Ԗ����((�jJ\nu4�������;KJ��ųt��an+%��D�;2s�n\'��f>����|��QaB�X�j,(Q���\rF���5\Z�\0�j,(�Ƣ���5?<L�da�ύ���q�$��҆#mg}�d3y��Â�G�����c{r�g������69��X�n&���ɩ(r2�+0��`�G:b���+t)U��$�\0�q�\n�\"��\r��,�gU!M����/o55f�TZ��§y��������U�l�I������%�)#1�{�������Y|\\]\r���n�J�KiC�Q���(]�m?4MN|�7�69�u�z&�\0�x�_���>m�^;���U84�59�s�߅�/�}ϛ~���@8Z�S��>m�^;�������x������59�s�߅c�/�}ϛ~���@8:�S��>m�^;�������x���������ϛ~���A�>m�^;���\0��59�s�߅�/�}ϛ~���@8Z�S��>m�V;�������X�������Ng;�|��w�����o��ߗ��R�s~�Ϳ�~^?���6�/�x��p�\Z�߹�o��ߗ��>�Ϳ�~^?����|>?ar�$Ģ�?/�.4�8z�:2�L��8���H������~wvY;���b���������mV����:hu�l��������6۫x_�5Ԗv����I����0S�|�(�N�Cn����0q�?l�����_�*d1�4�_���1,\\�&.Lrg�}���Q����Q1;[A�b��4�k�2ә�ٙ�i٬��\\�$���?����\nۚ�-B�Ƣ����1�����((Q�����(,QNb��5\Z�\n�a�93��N�D�Z:��p�1��M?3�(o;?7�e8x��0�^������F�+fGQ�(,V�.�RP��%\0Qb�bXw7�eX�ӿ�iy�/�Юn_3��(+���U��BŴ������}R�就�y..[..[T	qr�X�.[..[./R�x�.k=�Mr�6����X�_3g��v�w����R�\0y�\Z�����~̫�皝�ٖ�J˶UM�X��_~dM]@׻�|��t�U��ng����|�%ۛK�zZa�0A\nPInInG���#��)�E.dR�T��\\\Z��S3��?�mng�j�b\"��E�/�F\Z�0za���T�\r١��%����>Y���e­��$r*���QQT,\\TU\n���������**,,�� **,+�EE�@TTXXEEP�\n��\0����HI�X��������|�б�ݹ@���fR�N�7��ݝASd��S��9d4�Q���F�cx�[\r���9�{�0��^m��\r�\"Gv��>E#+�=�-)�f��ҼRۢoɵ�|���L�a��p-W�Ȏɴ�z:3�v�����n�&����Z�\r-�6��dq��;ʢot3I������Zi�\r\'�>�+wK���/b���lP>n[��r\\�%�\\�>���K\0�.}�.m[7���%��1=\Z�\0�5c9��)��*��]uM}Y��5����-��.j�����,-�aB[��\Z��Gl4�����Y����I�2�������0z�W������)�(]F�M�����u\Z�()�]F�Jy\nyQ��B��j���u\Z�()�]F�Jy\ZWm���\\gJ_�#v��;o�\0��\0��SW[���Rʽ��[	�lr�ZTX����z��m�����cn��r�~q%�=x�oc��>���\'7��C�be�8�_����]�}Am�K���b0�*� ^�G��h�UZ�~i��M4��ޘ�7���l�5;*�MTj9D��)�����Z��fW7�W�)�p7���;@V�D�\0��\0:�i�N�\0�:\0-<��Xi�N�\0�:\0��\0��\0:\Zn--��Cj�b} ��o�[v�9,W\"��lqS�%�\00�6�ꎇlv�pe��c+�Y�Ɂ���k�u:M��m�D�荌���ٜ(i2	}���խ��B�GVc��l|*~\"�!�Z6za����$��<ɉ���f����][bYdz��^�����_�c7\ny\Zc?�y�����\0�b7Oq��ޟ(�4m�((]F������u\Z�()�]F�:�E�j����u\Z��JyQ�\ny�E�j����x��Ԕ��(�}�#���\"�f�X��\0�\nz�|Ȟ�2�������-�X���İ���\0[����]���\Zf�D�q\Z��!_\n��E̞�:�x�]���1�/�g��b����IbV��qaj�.[�..[..[([�.[�XZ�.i]�&��N��\0�F�cM��\Z�{�|&J�!_3[[���Rʽ���$��عX�?zT�\Z�M5���6	�%Δ��Tp�)���V;��f;����2xy������p����t�k{1_��;���\0$��Y�is����׊;������xY�\\L�fɛ�8\"UM?Y�n��ó%3,��q��Ș�@���\Z^M|N�GVA��k�f�~��lN\\��ܨ\"t�|����Ov�i���(���� p�\0\0��z�,*�n�\0[ŅP,-�����aT\0p\0��\0��!n������0T��p�7��_�(��p:w>��\r��D�&f\"%�KP$�O��6���_��e;?m�C��px&���h��<�w�S���[�C�`�\\�V_��ݕ-]��&�[�\0��s��&��1�U�X��qm���F�u�f�_�8��^�s%�ٹY|.�1�WyW� ���V\"X_�����gYk�����}�O�{��e\\����3l��t����f�����aca�r\\�(7-�\0�),��\0K���r\\�\"s��D��ʋ�i�g�\\xz�\'A��M.h�5�et\Z��\0	T\0�\0EE@Ѷ�����\0�~��P�m\n�\0�8��/�\ns/��G��������1BY�Nb���-9�sPP��)�	ABӘ�0%ANb���%�1��K�(k��g���`6��j��C���6[�������\0����W��T7��s�r��,�\ZR1�(j즭�SkΆ��`�(#�8\"��i��\ZksL�ͨ��w����w�rv�.���9��R���J�����ɣl%|N�P��pĔP��MU5��AC*aJ�%D�ܑ@H\0�\0\0\0)\0�\0@\0�\0\n@\0\0\0����`>dʕ*�pˆ��aI*�V蹟@�\r�h�mt��3&�槍�vtP�����x��:��٢v����i�L�{�^�CN�&��m���K�ݔCNϲ��\0���&m5�̡��P�a^����S���0��f���ANb��إqNb��\\�-9�sBP��)��BӘ�0%Nb��\\���)�	ABӘ��!�L�+�?J����K�\0\n����5=ʖ���B��y���uב+�u@����;�*x���1�2�U\r3��������׳���������Z\\\\XP�R�P�R�P�R�X�R�P�Ņ\0\\ֻO�ŰY�4�%>�\'�6Z�`�l6r�a#}~E:��\r�S�e^�3�TXQ\r��p���\\D�F\Zlrf��p6�|SF��C?��R����J�dP8b~ti=4[D�vw��g�6� ���\\8�&E.t0&�i�Q6�(׏a����f����&EIx�}��]��}�����������..,,��X�������ŀ����..,\0\\\\XX�ŀ�\r����܅�eA.d��C.T֍�WZ4�\'������5X���ˊ�a%��$�\0�*:?$�V�v�7�/h1�w#����L-ǣm��*�4��dqGQEM�um���J!b���**,,@��g��6\'���HU_�����x;�����2_X34=��~PԞ�R�XQq-AqqA@^B₀+�\\PPy���\n�qV��0��A�����.�\nH��:���̭EI�uP:�\Z!��\Z!qp5������R�T��%�����f/oʍ~��)̺���$��9�6��1K�.[��)���\ns��	rӘ�	~�Nb����Zo����n`q�ft��\0���@��̿3�p��_6�{9u�����=%1���Q��[k�4\Z�@�e���~c��a�&H��C}�:��{�Ge��Y���zT�jd/�U��y�S������~I::��72Jn�u�\0H�gI볱t\Z\0J�⏀�.���5�����Q�\Z\rAq�\04\Z\n�v\r�P@\\h5�\Z\r�������3\\�~7vT�ndoƉV����;0̱8��\'�s\"�WZ.Kv�h�՝��-��I��1-L���vOͪ�\0�Τ��U^|��5\Z��кQ���H-���8+�����pw2L��ik�(�S����ԈjI~�i�S�����)���\ns~�Ơ/�\\S��0�)�S��\Z������̰���l5�8�2;9ï��l���,�I�F�~_�(y�D/�����\n��\0�*Pl����s�ѧ�T�v�W����xa��i��4zӳ������JTT�3n�EKa@%Kqa`%EKA`%EKNb�J��D�������8��<�/���XY˱��`��i��\0���-��a�ۊ�>|�.+ȝE|���dvk6���\\�Ro�G�¿�h���hc�*����8�,�V52T�pD�4�S?Z�:ӱ��S$G�������a�{��:;�M�;.�K�w���E��J��,,��y\0�!qa`�+�X\0�!^B��+�W���\n��,,��y\0�#���%a0�q3�R�J��2\'�$���X�^���J����X���LĴ�C�uw|��%;C�6�6��瘬�jiM�܇� V�h�֦6��R��A^B��IP-y��Ra��`��&�VH�~L�S�.�#��UB��b6j%EKa`��n,,��h,�h(��h,��K\0�*Z*g6:gƭ�մ���ϱR�+:��P���1�f��ܸl��K���.\n\\�U��Ph5��j*��jd��E�4�~Mu.⁪8[MsV;#SF�).Fo=-Ѿ����R�n���j��-���,uR���_����~ J\nQ����1N`Jo-���Px�����((]E����T�/6]?v6�6�Μ�n}��1��w13!��M-O��6��l�!NCQ��Jr�5\Z��˱��:F7�>Lj8\"^\rq����|��d�3=�Rd��5�?���<婴�u��l�oݟO�j���?��x��&Vvw��BK���.8b�$��TӺi�����h*\0h4�\0h4�\0h4�\0h4��h4\Z�\Z\ry�\Z\rϘ�\"�JaM���Iom����\"ɧ�8�>⤸+Gor^~<o���c��f���Tnd�Ѹ��~�[�����}��hs�䈢X3p�[���6��pT��[R%M�r���R��(5\Z������L�.��>�$�.�Od���S�����I]cH�ox�K�t-���=�Q((/ķ��h��K~ J��E���([�%��nJ�I~ [���~!&�I��F���f$�,�Sj�6����H��(�PCv�K�gba�)8yr�v�\n�P����#}���J\n\n�J��AA��\0�\0к��B�:��45}��I�1)oN���VmLn�a�є�IV(�Zo�T��ҿM~L�-\Z����2�}*Z���9�*���uW��!��6��Z�))��y\nsT��u^B���]�9~�k�t�X��yw�N���<�g�Y�4�qQE��\03_����m��m�c@,R�����\r����&��%��39���0�b{��F�?�)ڇ�ӣ�m5�v�f[m>	y6o6��R�D��W�o�����YKy;���\0��\0,,\0\0��.��W��ש�<�,�X�.l/{���q���������Lɲ���D���B�\0�����~�{���m���D����h,,B�\0\0XX��	~�m�hiZc%E�$�F���d�i��D;�5���E�x�5#�>��Hא�!Nb��x�J����9�*������y\n	^B���(��yRS�\n�%_�^B��Js!��=�o%5����K��\r�C[ؼ= ���ũp�w�6J�z����e��h41i�\rQ@\Z@��n.��n.�\ZN\Z;��}\\\\��p���!�AJ�+z}(q���v�\n��X�W�.�^j��^��B����pd�1ŗA��1rV�\r9���Aqp\Z���\\\\�AAp\Z�..��[��C�a��R��.�5]>&��l�g�؈��I��4�\ZE\r�����ݵ^ˠЀ�d�\r>$���-���M6�uM:4�(m�i�1�㗓f�7��\'�狼H��o���b�p<��\\���F�+:k���;�.��aҗ6�%+.+��e���6*r&��\"|��(�F�\\��5�~���h�@���\0Zr&�P�\"h�|�r q͍B��~\\I�~�\\��+nb�㙓e5��S�	�\0\r5ZCΏ���l��i2}eʬ�nϋ���3�\'<�έTS�I�N���/;C�QE�&�Mն���4 �����i� �@J\0.��<\0����cR��hy{��C6/�q/���a2��r��\07����6�Q���8cn����)�S��\Z��Aqp�/�S��0�/�S��0�4~���?!~��_���.s�+�f���{�>�^K��э���|�vQ��.[\"KT�CX�����P\\�5�r֛L̥�p���n.�|@\n��Q���Ԛ���u\Z��Ͱ��͐��j��\rn4\'T�j�:4���Ҷ��l�)��K��q�]o�e\'����v���5-y\n\n:�Rא�1@�+�PS�\n�%KA@%EKNb��W��!Nb�TT��;}���,ԭ3�G\Z�(u�N�����s<�Oߓ2\n�4�\0�:��|J�j�٧�EF��fTT@j��x�99\\]��	�S�w-Q�u�2�6�ѩ�Wb���:d��r����2�L�t8�u��?4a�\Z�,�mr1xy�{9��߅h�3��#N���b�2�PO�.mt#dl���W��,�\Z�=�|�_@�LsT��\\�_B66l��~3�Xy)�I��ׅj�+���V&b�x��p�K���O)�3��U8it��_$bgN�:7��\'�ύF��d�%D�$�C�����ݶ�|���7�I�;�8�Ft���e�**����P\0**\0\n���e~�һ�K��O���:��jv���&�s��n�L)������+ͪ���o�v��!Nb��f�J�E�!Nb�J���9�\0�*ZsTT�RT�RT��)�y^�a=�,Tp�)΋�+���\Z�+.D�J���U��\"\\d�*H`J�#�M��!�j�#��ab�5*rR���j��u\Z�=n��t�@�F:�C�/������~�]7�Q�&\'fT���h�u���M��}�0q@�.mb��~+��]��wz,w��-i�\Z2�\\2Mthƌ��4e��\r���Mt�?hi=�)�S�\'L���I�\0�t��=���퉆jUr1pF��P��#��y1]�3?�ٱ��(4-�s����9��\Z������pPS��.�#�:�I���ݣ�C���]/�;oS:���(^���KR�cF[��)�)�[���B�\\^���|N��*88��Tt��gw��1�Jr3L�����\r<�F6S��Ǡ�!r�*@R\\9���!��@�u~ϒ;�c�����\0	�\0�t��݈a����2�����<����^\r]�;�\"U��[��h�qsֵ�F4e��F4e��F^���4&��hƌ�hƌ�?\\f+.D�ލҼ��\\1��\r��R���\n��.�ɣ?<4�0� �-R?R����e���&�h:\n��uhƌt\0h@����0%�J(��h(��hN�p3��`b���z[�ת\Z4I��$�N�5t�ȡ�mf_�}�T>�o�K�.:��e��\'GA��|9����XPP��,,)�P��\0XXPS�\ns;�XXPj��n���IP��!�K�\rG�\0)���=m*8CP��MU4�����G�X�A�9Z�:����m)~X��j��z��l�������°���h�\0B������y\n�=S�6Q�V��}~r�G&���Yy>����!qy*U�$Ɏ�gh���#���^HW����i��`�P`rhs��ࠂ�i?�5\\õ�<m��d򗃞�ς��ۧ�=U�O��\0�^��5�iU�+��b;O�f6���zBї�N��g�.Z�>N����G��T�x������.f�K��O\"*UK�8�F�ghW�������=���2r�pM�%R0�J���Rm%f�T�C�o���.��f�N�7t�y�5R�U�E�{l�\"U��@�E�~ *����.�E�~ J�U��>ϴ�ġ�����M�jv�����m��s٘�F]2	PC�\"���d]���mU$��\Z��;���9�s���SY��i�f�^B��Ԯ�3�\ZqeY�Qe�ѣ%��fl\r}�dv~r��R�������G�:8�ju�+��쳵�����vF+vnL�SR��Csȶ�����vQج�O��*6�%U~U5�~����躚�W�/?W��#�&��\Z��\r?���_���°���k�\0B���x��y\n����(�+�h>��l�����W�\0?������zk���6+(øi�C\\^�][9�\0se�`?-���\n�$�I*$�F���N��i�������������XXj)���K�ab�y����P��d��K�̇ߘ�-5�:�����p/��[���ލ�\\<��z�`�CJ���������<8��))̩�,,^�����P	b�jN�*�u\0N����u\0Q���:��S��Ƀ\"93a�A\Zi���n����	���:�7�q����,~�$�K����SJ�8bi��ti�4˫;ý�����uIqs&��E�p>�ԗ�Iqp/QԔ-�uO����0�18��H��S&L�C)om�$t�����9�-��Î���2rjJ݆�/7E拰��f��\n�f�(���\\n+��G��b$�@�ٱ� �qm���{C�F����#,x��z��<=�i�**sI�vγ��\0j�k�3LN)&�0� ��*%�?8 �0B�^�a�4��\'���_i�H��{K��fr���J��J���Sq̧�I/4��u�/��ϋ��N�N��)�cq��6���\\*�<X1⍩4�����%��X��O�����H��6Tj8�Q�Yc#6ʰ����ͅ7\ro[�~N���_g{M�&9�qq5��5��ܢ��z?�~$�S��1����<���].��9m�]�NLS�$(�Q���M:��\Ze���R��.J�/QNL�N@T\\NLh.H�q�0��M�$����8y�c#)ʧ��ݕiV�\'�%ͺ#�1ؙ��\\�\\�ޛ67o�n�ٻD�o��	����C}׻�Ź���~6�.}?��\n�	ɒ=��#�?�帞�3��h((..zG4����\\�iv�,�yvy�aeú	x���\Z��l�_l;w�����<�R�\"B�4�8;����4[�������V�-��]�}�dȡ��帬�c�S%�m-stJ%�;C!ϲl����3�c�*Uɘ���[���g�18h\'�����K���`�y�Q����O��`�3d�pD�������c��;}[X�������u<�}�fx8��6�\r��Q}�JP΅qp�E���9�eG�C�d��8�����w��i3��K��Q�����S/�,�Qԗ5�/RX\\\\�h�r�Q�\\\\P��p.����A.(�i%K��se�L�������R|<_Љ��Vl�����d�p%-�dW����d:���;����i:������GQ�\\Q��:��t�\n�@y\n�-���+ȶW��\"�X��\"�X	^B��a`%y\Z���u�:D7_Ņ~�^�M��i5F��bv[�-�[�mac/�YS�N��aoܿ����b)̺\'w{J�Z��WABY�aUQE�P�ko��$�̳�y�����R0�4�Nk��KŻ/:\'��_��b2�U\'5��6�w��)�ڢ�k�[E�f{A�N�3|Tx�T�W[��InIx%c���Nj�+�i�uq�ٯv{�>�s��ŷ���`a��pR�R����>o�V5����j���Ǒ�I���PC���FfT�.6H�X�֑�X�{Zo;�U(aJ�J�#蚍L��&�P��\rE\0[�)5oL[�o؝����p8�#ZBӬr���]8>�˱�,�\'��|��E��5�>N��9Yna��q\n~73������3��o�Xu������\0I��n����r߬}^�����Oi8�IA�`ebR��S�E���~T6<\'h;;=/k\'�T�M���O��?�0O\\s1����;X���\'���Ѷ�X���5\Z�9���(b_������i/�0��\0Dh�\0N�o��o�g�_������XX�q}�l����X�K�PJi?��5�۴�t�n\nV;(�>�^iY-joi�\0q�������(��t��\06�\0.��̱�,�\'��D���=�[�䎪�]�����XZ:�G7ς�ׂ��~72�9��T�Dǹ��E�-�rGS���XtV��g��\0H�|~n.���4rS�}KzcQC�9��1oLPP9�E�1A@��MF�=o?,L�\'�݉Q�\0+���Q@0se�q�\"Tk�d�gh3}����rlt�,�g�u�5�$��\'��X�:�*��}n��ĵFcj��҈����짵\\�k�/��//Β���9������w^\rѵ��<*8�M�d��2��([M4�ksG�;�]gNN��,�a�h��b�i,Ob�3��������Ooo����s�7��Z��i�S��t\n���*�\n���,*���3�R��o�*Z;\"֊���l�X�����Z��u��|��!�C\nP���M��+��D�H T\\O��6��������+�W�l,b�J��Z+�W�l,�!^E����^BJ���^C@%�k�W�A^@D.Z���!^@Arא� ?)���*)S!QA�OsF��e�2�E��߹��7��?^V*DRg@��%te[l��j\'\r�yNcS���Ӳ�Gv*�*\'�G����Թݭ�Ѽv]F�+�����X��ٙ�\'�7`�a�G6:|�߂��y����r�Fa���6[�68���*������i{a��=���OqA������I�y���|7�:_��h�\0�5�Z��;��9�a�f���4�E?>.�q=˂K�%d��}O�9�a�V�����\"#hp�fgyd2�=�Nk^�[�#�FD�)(U�E��J1F**�Q�1V.�Q����b���b��b��`(��F(�X�F(�X�F(�E@Q�1QV�Q��V�Q���b�TT����&���C�L����2����{ڪ�����3�����(bM4ӣO�����١R��`ݤ�l�s���4�˙�*Z[�Ƽx��k�xS+������`g�#���J��i�Ϛ�G��2��.�촌�Wv^&��rS�ԕi��\\��=�t~���?GcG��#���j5%��巊s\Z��p�\'bg�&L(�v����Do/�\Zn/�)�藋|��+���a��w��8��O���Ҳ�?u{�\"�q�C!�U������Y�d��j+����.�@%�k�W����h��k�W����K�אT�%9�jJ�s�T�-\0\"TS��0�����**)�P�������(���Wi��[;/��V)1?r4��7���2�ʊT�TpD��2��l��6�>�����βy���u��n��O�j�e�a�kf1��*�,�0�N�n�B��KR��<�C�\\��y�z:_���7�{���Aݝ�p��|ߒ�Mqp�gEX���Ng�bsl�7��ٱ��m�o�q�z�>Î)l���i,s��u�)�Y*-N\r��_s\r��߮������z�(:����x�:\0��!B�=o����[ǭ�����x�(���x��[ǭ�����x�����x�:\0��z�:\n\0��z�(:\0��z�:�=o����\n��(���x�:\0��z�:�bs	jKiZ+��Ǫ29��ʆ>�ɘ��R��ض�E�_*f\"k�,Ƶ\'vI�v?8[��k�Ѭ[d�\\��۴��斋G��I��P��UMnh�:��xڷ�;_����eT�n�)T��\'�p�\0�_�r��t�.J�����W?��sc�W����+���>��\r;>2aqD�%ſn�N[\'/�Hiؗ�W|�}e�		�R�w�6�9�5�mܝN�r�-{-B%\ZkP�A@-EIA@-EIA@-EIA@-EIA@-IA@-A(\0\\�%�������.[���UR\\\\\\����\\\\\\\\�����\Z���H�Q��\'�Os<��fg8|.g�l�_1�{�m����m�e�_%i��=_6d2��2dJ M�tI+�^��������qD���brSޥ/vZ�\n�:�#>ny��{V&\"{��*Z�����J�����·$��®�&Z��fj��aIF**������((�E@_���**����TT1QPb����\n1�TT��\n��IG�TT1G�TT1F**����(��>b��(�1QP?,\\�4������3��4�Li�P��D�_ �v��\0�d=��⧹X�5�ĵ�(�P��eH���S��L4�,�&D\nV�g�%7QB�i�4��oc�O�\0k�5�3����\'a�������U��&�?ư�5�)e�n^]�7����	�rܗqqqp-�qqpqqqp-�qqp-��qp�QRPPQRPPQRPPQRPPQRPPQRPPQRPPQRPP�������c��*T}���+&�}鯸��B�z��_ۓ:�e�;���ٳq����J���-t=O�ɧ���TTt��eʸ�_���T�eJ���_ꌟBa0TTtJ����\n����\n����\n����\n����\n����\n����\n����\n����\n����\n����\n����\n����\n����\n���\n����\n�lbP�.u�s3���K��\'�\'��q�*J�*z���;\'϶blʼ4�1�!n���r4�\'/�&yU��(gO\'�-�}�Y���)���z�p@�4��/Oh�u���*J\n<Z����Z����Z����Z����Z����Z����Z����Z�P\0����\n\n\n��hJ\n��HPTTE@PPTTE@PPTT~����{f�aU�-���*;&Ӛ���ht�ͯ����ݩm>>��c����1�a�$j�=����k_H丩j^9�J��7��dnc�ߙ䌅I����	/QQQP��⢠.***�TTTEEE@TTTTEX��\n�QQPb�TTX���\n��������TT\nK����*�X���f�ħ���)S��\0�ߛK�qrTT�-̞�fq�S�g0V�l�J��F�����T�DZ6��;�(c�GQB�i��?�fb�~�vo1�.�s��<S�Դ���l�<-��i��B��!BЕДД�P�BЕBЕ��A���\r���(4��P��h((A���\r��h�ጟ	;3�%Aȼ�m���C]�/�.ζ����1>jTM|I�sZ :1S�bq3�s&���m��,��J\ns=����������FD��?ōr����L&�	RXh(��*,((�%\0������RXPP��\0������PP!IaA@���B��*	A@(%\0X���Ǉ�?3%C��\0���(�����Nd!@�����1�m�;\"�EX�9�\"�����4v��G~Ř�o�&&Kux|�t	pN	Q~�3�hx�eyu�Y\n\r\r`�PPP���((((����4\Z\n\n\0����\r\0�PP�%@PP�PP�PP�PP�PP�PP�S��v�9��sj�N��fA������]��1�;�x����l�[����=c�<ABԕ=�PPTTfT鈉q������*b��2�&}��*|���PJ���TTQP!�J��A**���-E@���TT\n|���PJ���TT\n	QP)�Z��A**1Y��\0*\\�FR�\'1u���%��q�)�T�!�z�����\'8�+?���f0������=\rCͿ��u�v�_N��?��:�?��ڛ�\0�!((Z��BPP�PP�PP�PP�PP�PP�P�	Qb�P	ab�P	ab�P	aT�A@ �h(-\0�-\0�:���iv�ͺe)��vM���&{>�v�V�8�Я��\"�,o��8��\nX�-l%\0�`Z�-�k�e�a$>��qp�?���0�,,,,XXXX����XXXX���\0h,(,�%�XXXX���\0XXXX����XXPX���XXXX����XXXX����X�cZx���͌�zlqq����|�X�[\n\n�_�Q����x��Ki4���/��3)7k��|88֎z�=By\'�V�\0��	`�-\r,E���Š���XX�XX�\0K��K�q\0�\0�\0p^\0\0A\0\"�\0(\0Fu7�m�\0����\0���a\0���\0qO�=���@\0�?�����`+�\0$�@\0� \0�\0\'�\0\0ǂ\0\nO�\0�\0\'�\0\n��8\0\'�\0Rx\0�0\0���nA��\0�x\0\0}�J$�@n =)�\n޻S�\0���\0�aꕸ�qO��\0d��_x������{�\0O�|@\0�\0\0�R�\0\0��'),('123','Tarjeta de Identidad','KENER','ROMERO','123','kener@gmail.com','93b16f06785d1f7773d056c1b7501f39abf371f1','calle 42#31-69','ADMIN','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0�v�d\0\0\0sBIT��O�\0\0\0_zTXtRaw profile type APP1\0\0��JO�K-�LV((�O��I�R\0c.KK�D04006�F@�9T(�\0������Y��)��\0O�h-،\0\0�IDATx���Yl���co{׻�8>��^;��1��4�Rq�@\nF��F��FJ�*�}*}hUU%EEUb\"DI�Q�8�`csCl�k{���3�3�5�<c�b�����<f~�l��1��ڻw�\0�B\'�\00�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0b�]�y�Ct:� ?(�0�N����Z�lB��!B,�F�F��f�Y�֬�,��rrr~PrxxX�����`0811�q�^�gYV<\0�No�$	��q��ﯬ�t�\\eee��d2�L�����233�)��/IR �D\"�H���ݹs��͛�n����4àOkvZ�$)���h4\Z,X�bŊe˖Y�V�e�z����n�پ�/˗/��b~�������˃����4Ͳ,����{�&���t:�ҥK�.]ZYY���7�?�޽{���W�^�z��N�3\Z�3�#`V��N�$E�Q�����/?������gJ^^^^^^mm���Pcc�g�}�p8�z=Z�t�;=�<o2����6o���Oj�����>��ӎ��H$b04��\0���&�u\05�$�B���~���_߸qcVV��u���Z�|yyy���D?��ԇ�x�����ݻ����j�&�>EEE---4\Z��w*C����y�K���w�s�\\)�6,X�z���ݻG�4���0�NE�(F�ѝ;w�^�:��h4��z�~8����ɍ��l���t:��y=�(��Ν;����G���4&�t�SN4\Z�i��7߬�����^�������kxxx||<���D\"ߗ1�Lr�322�v{NN�+++�N����h\\�n����׿��F��fZ����|ii���󢢢i~$�x�ޛ7o�<y�Ν;z�^^:��:��;�������F�@YY�ƍ].���4�L������===)2X\0��B8��������p8�S>�utt��������~���8��A�Ù������<�LUU�N�C������7::�u,��N<������ϟN����O?�tpp��y��0S�X�$������͛7����|�����;���h�Sf�S��/�����N�Guuu9r��ѣ�`pƗsS%7�>�����w��u:����ꟲZ�K�,����x<�\"�\n��!\n���2?�X������^oo��j���ME�4m4\Z�������fsaa�zb-Kee�\'�|�y�T�`\'� ��������K>x�`���gΜ��t��B�,��Z[[{{{�����X,������vyg�65�I!��$�K��g?���V/��ӳo�>��c2�4^BQ�^��w����_���p8T*�p8G[[fI.;�B��/��y�f�bׯ_��?��q\\������˅�����*%������0��Dv�D����ҷ�~[�eE�������$}R���h4z���^�h�\"�j���7nx�ޤ�y��@(9DQ4��;v�P�655}��6�-E��4M�l�?����I�EQ;v�0�͢(jV7xZ��D\"�ׯ��U�\\�r���ߗ\'�5�ؔ(�b���3??��\'�P*����o޼�զI�Bߘ�CE�ӹi�&�2}}}���K��e��9�۷o___�J�M�69�N4�I�r_��`||����l6+�z�����nO�T�h���������U*c6������ǵ��R�{C�X,VUU��T����\'O���Ns�v��,���{��I��ʸ��X,�e�@�`kL�$Q7n�h�X�ʴ���:u*-6T��S�N���*�X,7nEQ�R�A�5%¢E�***�\n���z�Œ�;(��X,����@@�LEEŢE��ff��)��jjjT�\r>y�d8N١��h���\'O�T*����v�>�4�6_ 2���^�iOOOcc��9H&�������G��s�=\n��� �ډ�bn�[it-B[[���x\Z5�2�������ڔ��6��駟�����;��B�P]]��ӑ�������3{��hlhhQ*PWW�F[K�FDQ���S�>���,IRZ̙=��(I�����\n������a��fl�D�Q�˥�����i7�~��d:}���S���r��Ѩ�U��l���XUU��7n��4m�eE��7nL�T�x-�fl-H�d��T��������C�ӎ\\y��TVV��f�Jm �Z�w}(~411���C��e�azzz&&&&}�������F[��`���I�z����~2���߯�-�n���v[�DQT� ��������G�4=22��uB?�p8lm���)-�b1�~�$I�o�& �2��o߾�4�.,,�2m�}Jq� (]y\'���p��М>�e������9�N����A���(0��1388���v8�6l-��tԾ$I>�/�_t=��(�ϧ��Z��6l-�<���T����Q��=::����\\��V`!�\ZQ��K����I\n���W�e5�Ϝ�`� ����61�d*�1#�ԇ`k�eY��?�#��\n\n�Y�%�bAA��z��Oؿb)��˲*���L&bf�$IR�U>22�`k���0�`P�QII	1owA())QZo�Y���l-�,��x&}D���y�H�ϛ7O�+��x�bk���0J]q����ˉ9v����r�`�����������Zl�Ng�۝N\'�lI�T���t���![�h���|J�m6[~~>�lA���m6ۤO#�H���Fl-���w�ޤO�͛W\\\\LF�����͛7��{��y�^bv��8���@Ӵ��U�WVVjY�٣�x<[3�+kD����+�~˗H��0[�$���I�\n���Of������֦���b��Y�&��4�<�f�\Z����k��Ƶ��l�0��եt��N�[�vm�6�rs�v�Z�^����S�A����뛚��������4�\'\Z���<�MMMX��%[;F��رcJOM&ӆ\rX�M�F[�$�e7lؠ�J�رciz�h�B��CQ��l�t�R����e˖�]��F�-[V^^�T�ҥKf�o���`k�d2���)M���׏���Q�-I�������&�DQlkkK�D���)�^�����ѡT���dϞ=*�i��H$�gϞ���mmmz�^�Z��)��8��x�J{�ڵ.�+-��p�r�T&ã��ŋ9�C?\\c��L&ӗ_~��߯T�n�o߾�f���rQm6����Uv}������k�N��Z__������]�v��lK�v�ڥ2g&�b}}��M	0��$`Y������E�̳�>�e��3��H>}˖-�>��J������~��N\n���&�u��(�\Z���T����***X��q�˲�3F�$)�l۶��W_U��144����G\"��H\n�ѓC���ԩS*eX�]�n�ʕ+C��f�R(Z�r�u�ԛ�S�N�t�`�A��4z���o�-(((,,T*c0*++%Ijoo7�L�m��W֯��J]]]FF�J����G�bt�Dv2�,���^YY����T�`0TUU��䴵�Q���� �h�����M���vuu�߿_�ק��aB�����X,v�����j�٬R���$??��o�Mʙ��H$++�7�x��������:4::�9��B��L>�����G?��zɂ��%K��4�M�-B$Y�t�~�����)�����s�֙%��|�ܽ{wll���Z}�)33�瞳�l���^��a����J��q\\~~�֭[w�ޝ���^����������h�N	z����7��\\�)�����%K����u:݌�[�H$�nݺs�Χ�zjʏ�b�cǎ�;w.�3| C�S�<+���u�޽�˗OY�j��\\�5k��=�P(��3�$�</I��n���z����i�l8p�믿6Hu�@�SEQ,�vwwOLL���Oy,EQV��������),,�Z�<�����$I�h4X��+V���K?��OV�Xa�Z��?���G�9w��bA�S�w��d���H$�v�w�ޭt@�ҧFGG��ۛ�����M&˲r3�p�^EI�A��b�H�n�?��n����(;;;�\r###��߱����C�S��V��7���t&�\'566600����������T�i[�V�Ñ��[TT����؏�u������� �MAv����۶m{��S�=�D\"�ϟ�裏A���Ԅ1v��iZ^Iz����/������:t��i�a�<e!ة��(�^?44t��qQ����2I�$��w�����/>���Rvw�4I�(�b�����K��������A����R�t�;E���FY�]�x�+����O\Z�Ƥ7�<�����gϞ;w.�4�1vjB�S�$I�Ph����W�^�dɂ�]�I�+W�466޸q�d2a��j���گ-[�,_�\\e�v��u��G}444d�X�ԁ`�\n��M&See��ݻ�Ng���\'N�?���`Ui�@��O>�dժU6lX�h���\'&&��0���pXޤ���p�`0�L&�ٜ�����@GGG���놆ym�c���1!�I�q� �����U��,!�����{��������a���\'&&DQ����Aa��FӴ�b�Z�6���p8�����������\\Qo߾�������Os�9�;iDQ�8�g�ٱc�O<����p0�s�΅:::��@)��_�Q����\r���L�Q��$�4�x����Z��e��-K��� \'N�8u��q8q!Y�����W_}u����%��������_�~���)���f��;#-��?��8Q����.]ZZZZ^^oD�_��������ܤ@����y�e�~�m��W\Z;::\Z���<�0�z`��p��322.\\�v�W�X׿A���?:;;��S{��8�[�d��ݻ�ϟ?͏�|�k׮;v���ddd�,��Y��$�b1��8�۶m۪U�\n\n\n��f����\'N��~\\\0��Zq�H�4>>�v��={�L�V8��o�9r��y�kV�9��<h7f����S�=�f�������������?��l6#ۚA�5\"�vڴiӞ={�3�E�������_}�U0L�M�Qo޼y�ʕ���L��a���������N���[�xu�Ν[�l�N>�{｣G�F\"���Ra�����͛7/\\��p8�����Z+((����~�z(J�_�T���$idd��^��<���\'�|������Ⱥ�Y\"�o�y��ŋ����h�����)�{��]r[�k׮�_~y�o���������X,�o�i�ff``�ҥK�����������v�oܸ���Y�`�\"y>y����ׯ��{�����;����4���Hy�oll��t����n��QZZz��y��V՜s�Ykjjv��5e��ٳE1-\Z�G�4m0�]�6::�h�\"�CڜN����Ϝ9�y�ك`���kkk�z�-��78p��?�Z�i�P?Ju�8q��v;���N���իq�Ӈ`ϊX,V\\\\��_�B�B��w���.�l62��,�R���^VV�r7�N�+((����\n6Ҹ�HY�+��^{M}m���������7ߤ�	�3�eY��������ի*ŌF�;�v{,ӬnsZ�&IR8~�7�y��b^��O�S___��>#h���b�}�Yuuunn�R1�^_]]���$o�Ѳ��C�=�8�[�v��e��p�СC^���T�h����9t�P�J����m۶E����J{&	�PPP�n�:�qc(:r�ȵk�N��a����������*�^x��˗�<�Y��{&������|�2�~��_|1G�bYv||���s(R*c0�m�&\Z��`��㪫��n�J����>� �{�ґ^�ihhP�mnn�;=�	�ɳ�!��n��o�rnYgg�����9�z������t���(����\Z\Z��вn�B�=3AX�~�ʍ������DQ��l>r�HWW�R���̗^z�at�gĜ���ArrrV�\\��744tvvΑ���h��ȑ#*�u�ݥ��x�=#�7o�l�ٔ\n\\�|�ԩSf�Y�Z�\Z�^���}��q�E�ر#hY+R!؏KE�ӹ|�r�gϞM�+���h4655\r*(++����F�Z֊H��\n�?��OUN;�t��իW�t���b���|��*��nݺ����Xb�XUUUuu�R�������9�	��h��On߾�T���hŊh���XAx��U�(~���ؙ���ٟ}���S�Ųd����h?;q�$Y,��K�*�x�\"����e���T�~���fee!؏�N\\,+//W��Zŋ/�������(��y���9�LZ�h4���b����w.q~�ݺuJOGGG/\\�0g_\\�3����G���U���ǵ�a���XTTTVV�T������h�\'%7�gϞU*��O�\\��U��]�8�{�T\Z�\'Ob2\\��hlhhP��e˖)=�)!؉��^�p�R�|�֭��VAQ��hlmmU*P\\\\����)�����Q���Tn�?���7c��d�t��Ӽ���\n��e���`\'B>�Ti/���{�.�N�a�������I��l���<;1v\"$I*((Pz���;44�~��h��z�*s�%%%*�OA�|�E���|�G� ܹs��y�6�Q���[�W�r�1�N\0�7�F�L�4\nuwwc��4�����.��＼<�ł`\'\0��� .�K�i$�u���D�tWWW8V*���� �q�F�UUUJO���;����&���٩T`ѢEX��\0;n� ��mv��M�����`P	vAA�p&\0����*�;::p�\\\\X����VzZZZ��� ��$);;[��=00�]q�i���Sy:o�<d;^�\n�G���l��1��\'I��2����>b&\'\'��B��#��y�:����G?<�4�G�-v����g�*�wll�u(�R�܋e���l;^v|$I2��J�豱1�@Ӵ��Sz��������$�d2)�K)���c&##-v����/���=11��x(�R�j�����l��/;>���h�N\0EQ*�P�O\0�7�yo,O�ʟ/\Z�?Y|,˙3gnݺ�訏a�����J�|���Ç�r�4=44d�X�R��E�ݻ7�uH3� (mK����O�(�J�q�e��Z�1��ٌ�i\Z�gf�\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��ͪאBJ��\0\0\0\0IEND�B`�'),('1234','Cedula de Ciudadania','GERMAN','GOENAGA','123','german@gmail.com','da91388c72d3e31da19dcd85c97374197748485d','calle 42#31-69','ADMIN','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0�v�d\0\0\0sBIT��O�\0\0\0_zTXtRaw profile type APP1\0\0��JO�K-�LV((�O��I�R\0c.KK�D04006�F@�9T(�\0������Y��)��\0O�h-،\0\0�IDATx���Yl���co{׻�8>��^;��1��4�Rq�@\nF��F��FJ�*�}*}hUU%EEUb\"DI�Q�8�`csCl�k{���3�3�5�<c�b�����<f~�l��1��ڻw�\0�B\'�\00�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0b�]�y�Ct:� ?(�0�N����Z�lB��!B,�F�F��f�Y�֬�,��rrr~PrxxX�����`0811�q�^�gYV<\0�No�$	��q��ﯬ�t�\\eee��d2�L�����233�)��/IR �D\"�H���ݹs��͛�n����4àOkvZ�$)���h4\Z,X�bŊe˖Y�V�e�z����n�پ�/˗/��b~�������˃����4Ͳ,����{�&���t:�ҥK�.]ZYY���7�?�޽{���W�^�z��N�3\Z�3�#`V��N�$E�Q�����/?������gJ^^^^^^mm���Pcc�g�}�p8�z=Z�t�;=�<o2����6o���Oj�����>��ӎ��H$b04��\0���&�u\05�$�B���~���_߸qcVV��u���Z�|yyy���D?��ԇ�x�����ݻ����j�&�>EEE---4\Z��w*C����y�K���w�s�\\)�6,X�z���ݻG�4���0�NE�(F�ѝ;w�^�:��h4��z�~8����ɍ��l���t:��y=�(��Ν;����G���4&�t�SN4\Z�i��7߬�����^�������kxxx||<���D\"ߗ1�Lr�322�v{NN�+++�N����h\\�n����׿��F��fZ����|ii���󢢢i~$�x�ޛ7o�<y�Ν;z�^^:��:��;�������F�@YY�ƍ].���4�L������===)2X\0��B8��������p8�S>�utt��������~���8��A�Ù������<�LUU�N�C������7::�u,��N<������ϟN����O?�tpp��y��0S�X�$������͛7����|�����;���h�Sf�S��/�����N�Guuu9r��ѣ�`pƗsS%7�>�����w��u:����ꟲZ�K�,����x<�\"�\n��!\n���2?�X������^oo��j���ME�4m4\Z�������fsaa�zb-Kee�\'�|�y�T�`\'� ��������K>x�`���gΜ��t��B�,��Z[[{{{�����X,������vyg�65�I!��$�K��g?���V/��ӳo�>��c2�4^BQ�^��w����_���p8T*�p8G[[fI.;�B��/��y�f�bׯ_��?��q\\������˅�����*%������0��Dv�D����ҷ�~[�eE�������$}R���h4z���^�h�\"�j���7nx�ޤ�y��@(9DQ4��;v�P�655}��6�-E��4M�l�?����I�EQ;v�0�͢(jV7xZ��D\"�ׯ��U�\\�r���ߗ\'�5�ؔ(�b���3??��\'�P*����o޼�զI�Bߘ�CE�ӹi�&�2}}}���K��e��9�۷o___�J�M�69�N4�I�r_��`||����l6+�z�����nO�T�h���������U*c6������ǵ��R�{C�X,VUU��T����\'O���Ns�v��,���{��I��ʸ��X,�e�@�`kL�$Q7n�h�X�ʴ���:u*-6T��S�N���*�X,7nEQ�R�A�5%¢E�***�\n���z�Œ�;(��X,����@@�LEEŢE��ff��)��jjjT�\r>y�d8N١��h���\'O�T*����v�>�4�6_ 2���^�iOOOcc��9H&�������G��s�=\n��� �ډ�bn�[it-B[[���x\Z5�2�������ڔ��6��駟�����;��B�P]]��ӑ�������3{��hlhhQ*PWW�F[K�FDQ���S�>���,IRZ̙=��(I�����\n������a��fl�D�Q�˥�����i7�~��d:}���S���r��Ѩ�U��l���XUU��7n��4m�eE��7nL�T�x-�fl-H�d��T��������C�ӎ\\y��TVV��f�Jm �Z�w}(~411���C��e�azzz&&&&}�������F[��`���I�z����~2���߯�-�n���v[�DQT� ��������G�4=22��uB?�p8lm���)-�b1�~�$I�o�& �2��o߾�4�.,,�2m�}Jq� (]y\'���p��М>�e������9�N����A���(0��1388���v8�6l-��tԾ$I>�/�_t=��(�ϧ��Z��6l-�<���T����Q��=::����\\��V`!�\ZQ��K����I\n���W�e5�Ϝ�`� ����61�d*�1#�ԇ`k�eY��?�#��\n\n�Y�%�bAA��z��Oؿb)��˲*���L&bf�$IR�U>22�`k���0�`P�QII	1owA())QZo�Y���l-�,��x&}D���y�H�ϛ7O�+��x�bk���0J]q����ˉ9v����r�`�����������Zl�Ng�۝N\'�lI�T���t���![�h���|J�m6[~~>�lA���m6ۤO#�H���Fl-���w�ޤO�͛W\\\\LF�����͛7��{��y�^bv��8���@Ӵ��U�WVVjY�٣�x<[3�+kD����+�~˗H��0[�$���I�\n���Of������֦���b��Y�&��4�<�f�\Z����k��Ƶ��l�0��եt��N�[�vm�6�rs�v�Z�^����S�A����뛚��������4�\'\Z���<�MMMX��%[;F��رcJOM&ӆ\rX�M�F[�$�e7lؠ�J�رciz�h�B��CQ��l�t�R����e˖�]��F�-[V^^�T�ҥKf�o���`k�d2���)M���׏���Q�-I�������&�DQlkkK�D���)�^�����ѡT���dϞ=*�i��H$�gϞ���mmmz�^�Z��)��8��x�J{�ڵ.�+-��p�r�T&ã��ŋ9�C?\\c��L&ӗ_~��߯T�n�o߾�f���rQm6����Uv}������k�N��Z__������]�v��lK�v�ڥ2g&�b}}��M	0��$`Y������E�̳�>�e��3��H>}˖-�>��J������~��N\n���&�u��(�\Z���T����***X��q�˲�3F�$)�l۶��W_U��144����G\"��H\n�ѓC���ԩS*eX�]�n�ʕ+C��f�R(Z�r�u�ԛ�S�N�t�`�A��4z���o�-(((,,T*c0*++%Ijoo7�L�m��W֯��J]]]FF�J����G�bt�Dv2�,���^YY����T�`0TUU��䴵�Q���� �h�����M���vuu�߿_�ק��aB�����X,v�����j�٬R���$??��o�Mʙ��H$++�7�x��������:4::�9��B��L>�����G?��zɂ��%K��4�M�-B$Y�t�~�����)�����s�֙%��|�ܽ{wll���Z}�)33�瞳�l���^��a����J��q\\~~�֭[w�ޝ���^����������h�N	z����7��\\�)�����%K����u:݌�[�H$�nݺs�Χ�zjʏ�b�cǎ�;w.�3| C�S�<+���u�޽�˗OY�j��\\�5k��=�P(��3�$�</I��n���z����i�l8p�믿6Hu�@�SEQ,�vwwOLL���Oy,EQV��������),,�Z�<�����$I�h4X��+V���K?��OV�Xa�Z��?���G�9w��bA�S�w��d���H$�v�w�ޭt@�ҧFGG��ۛ�����M&˲r3�p�^EI�A��b�H�n�?��n����(;;;�\r###��߱����C�S��V��7���t&�\'566600����������T�i[�V�Ñ��[TT����؏�u������� �MAv����۶m{��S�=�D\"�ϟ�裏A���Ԅ1v��iZ^Iz����/������:t��i�a�<e!ة��(�^?44t��qQ����2I�$��w�����/>���Rvw�4I�(�b�����K��������A����R�t�;E���FY�]�x�+����O\Z�Ƥ7�<�����gϞ;w.�4�1vjB�S�$I�Ph����W�^�dɂ�]�I�+W�466޸q�d2a��j���گ-[�,_�\\e�v��u��G}444d�X�ԁ`�\n��M&See��ݻ�Ng���\'N�?���`Ui�@��O>�dժU6lX�h���\'&&��0���pXޤ���p�`0�L&�ٜ�����@GGG���놆ym�c���1!�I�q� �����U��,!�����{��������a���\'&&DQ����Aa��FӴ�b�Z�6���p8�����������\\Qo߾�������Os�9�;iDQ�8�g�ٱc�O<����p0�s�΅:::��@)��_�Q����\r���L�Q��$�4�x����Z��e��-K��� \'N�8u��q8q!Y�����W_}u����%��������_�~���)���f��;#-��?��8Q����.]ZZZZ^^oD�_��������ܤ@����y�e�~�m��W\Z;::\Z���<�0�z`��p��322.\\�v�W�X׿A���?:;;��S{��8�[�d��ݻ�ϟ?͏�|�k׮;v���ddd�,��Y��$�b1��8�۶m۪U�\n\n\n��f����\'N��~\\\0��Zq�H�4>>�v��={�L�V8��o�9r��y�kV�9��<h7f����S�=�f�������������?��l6#ۚA�5\"�vڴiӞ={�3�E�������_}�U0L�M�Qo޼y�ʕ���L��a���������N���[�xu�Ν[�l�N>�{｣G�F\"���Ra�����͛7/\\��p8�����Z+((����~�z(J�_�T���$idd��^��<���\'�|������Ⱥ�Y\"�o�y��ŋ����h�����)�{��]r[�k׮�_~y�o���������X,�o�i�ff``�ҥK�����������v�oܸ���Y�`�\"y>y����ׯ��{�����;����4���Hy�oll��t����n��QZZz��y��V՜s�Ykjjv��5e��ٳE1-\Z�G�4m0�]�6::�h�\"�CڜN����Ϝ9�y�ك`���kkk�z�-��78p��?�Z�i�P?Ju�8q��v;���N���իq�Ӈ`ϊX,V\\\\��_�B�B��w���.�l62��,�R���^VV�r7�N�+((����\n6Ҹ�HY�+��^{M}m���������7ߤ�	�3�eY��������ի*ŌF�;�v{,ӬnsZ�&IR8~�7�y��b^��O�S___��>#h���b�}�Yuuunn�R1�^_]]���$o�Ѳ��C�=�8�[�v��e��p�СC^���T�h����9t�P�J����m۶E����J{&	�PPP�n�:�qc(:r�ȵk�N��a����������*�^x��˗�<�Y��{&������|�2�~��_|1G�bYv||���s(R*c0�m�&\Z��`��㪫��n�J����>� �{�ґ^�ihhP�mnn�;=�	�ɳ�!��n��o�rnYgg�����9�z������t���(����\Z\Z��вn�B�=3AX�~�ʍ������DQ��l>r�HWW�R���̗^z�at�gĜ���ArrrV�\\��744tvvΑ���h��ȑ#*�u�ݥ��x�=#�7o�l�ٔ\n\\�|�ԩSf�Y�Z�\Z�^���}��q�E�ر#hY+R!؏KE�ӹ|�r�gϞM�+���h4655\r*(++����F�Z֊H��\n�?��OUN;�t��իW�t���b���|��*��nݺ����Xb�XUUUuu�R�������9�	��h��On߾�T���hŊh���XAx��U�(~���ؙ���ٟ}���S�Ųd����h?;q�$Y,��K�*�x�\"����e���T�~���fee!؏�N\\,+//W��Zŋ/�������(��y���9�LZ�h4���b����w.q~�ݺuJOGGG/\\�0g_\\�3����G���U���ǵ�a���XTTTVV�T������h�\'%7�gϞU*��O�\\��U��]�8�{�T\Z�\'Ob2\\��hlhhP��e˖)=�)!؉��^�p�R�|�֭��VAQ��hlmmU*P\\\\����)�����Q���Tn�?���7c��d�t��Ӽ���\n��e���`\'B>�Ti/���{�.�N�a�������I��l���<;1v\"$I*((Pz���;44�~��h��z�*s�%%%*�OA�|�E���|�G� ܹs��y�6�Q���[�W�r�1�N\0�7�F�L�4\nuwwc��4�����.��＼<�ł`\'\0��� .�K�i$�u���D�tWWW8V*���� �q�F�UUUJO���;����&���٩T`ѢEX��\0;n� ��mv��M�����`P	vAA�p&\0����*�;::p�\\\\X����VzZZZ��� ��$);;[��=00�]q�i���Sy:o�<d;^�\n�G���l��1��\'I��2����>b&\'\'��B��#��y�:����G?<�4�G�-v����g�*�wll�u(�R�܋e���l;^v|$I2��J�豱1�@Ӵ��Sz��������$�d2)�K)���c&##-v����/���=11��x(�R�j�����l��/;>���h�N\0EQ*�P�O\0�7�yo,O�ʟ/\Z�?Y|,˙3gnݺ�訏a�����J�|���Ç�r�4=44d�X�R��E�ݻ7�uH3� (mK����O�(�J�q�e��Z�1��ٌ�i\Z�gf�\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��ͪאBJ��\0\0\0\0IEND�B`�'),('1234567','Cedula de Ciudadania','JUAN','CERVANTES','123','juan@gmail.com','c5652d9cc6bcf28e0e20210eae5ef9e54ba35717','calle 42#31-69','ADMIN','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0�v�d\0\0\0sBIT��O�\0\0\0_zTXtRaw profile type APP1\0\0��JO�K-�LV((�O��I�R\0c.KK�D04006�F@�9T(�\0������Y��)��\0O�h-،\0\0�IDATx���Yl���co{׻�8>��^;��1��4�Rq�@\nF��F��FJ�*�}*}hUU%EEUb\"DI�Q�8�`csCl�k{���3�3�5�<c�b�����<f~�l��1��ڻw�\0�B\'�\00�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0b�]�y�Ct:� ?(�0�N����Z�lB��!B,�F�F��f�Y�֬�,��rrr~PrxxX�����`0811�q�^�gYV<\0�No�$	��q��ﯬ�t�\\eee��d2�L�����233�)��/IR �D\"�H���ݹs��͛�n����4àOkvZ�$)���h4\Z,X�bŊe˖Y�V�e�z����n�پ�/˗/��b~�������˃����4Ͳ,����{�&���t:�ҥK�.]ZYY���7�?�޽{���W�^�z��N�3\Z�3�#`V��N�$E�Q�����/?������gJ^^^^^^mm���Pcc�g�}�p8�z=Z�t�;=�<o2����6o���Oj�����>��ӎ��H$b04��\0���&�u\05�$�B���~���_߸qcVV��u���Z�|yyy���D?��ԇ�x�����ݻ����j�&�>EEE---4\Z��w*C����y�K���w�s�\\)�6,X�z���ݻG�4���0�NE�(F�ѝ;w�^�:��h4��z�~8����ɍ��l���t:��y=�(��Ν;����G���4&�t�SN4\Z�i��7߬�����^�������kxxx||<���D\"ߗ1�Lr�322�v{NN�+++�N����h\\�n����׿��F��fZ����|ii���󢢢i~$�x�ޛ7o�<y�Ν;z�^^:��:��;�������F�@YY�ƍ].���4�L������===)2X\0��B8��������p8�S>�utt��������~���8��A�Ù������<�LUU�N�C������7::�u,��N<������ϟN����O?�tpp��y��0S�X�$������͛7����|�����;���h�Sf�S��/�����N�Guuu9r��ѣ�`pƗsS%7�>�����w��u:����ꟲZ�K�,����x<�\"�\n��!\n���2?�X������^oo��j���ME�4m4\Z�������fsaa�zb-Kee�\'�|�y�T�`\'� ��������K>x�`���gΜ��t��B�,��Z[[{{{�����X,������vyg�65�I!��$�K��g?���V/��ӳo�>��c2�4^BQ�^��w����_���p8T*�p8G[[fI.;�B��/��y�f�bׯ_��?��q\\������˅�����*%������0��Dv�D����ҷ�~[�eE�������$}R���h4z���^�h�\"�j���7nx�ޤ�y��@(9DQ4��;v�P�655}��6�-E��4M�l�?����I�EQ;v�0�͢(jV7xZ��D\"�ׯ��U�\\�r���ߗ\'�5�ؔ(�b���3??��\'�P*����o޼�զI�Bߘ�CE�ӹi�&�2}}}���K��e��9�۷o___�J�M�69�N4�I�r_��`||����l6+�z�����nO�T�h���������U*c6������ǵ��R�{C�X,VUU��T����\'O���Ns�v��,���{��I��ʸ��X,�e�@�`kL�$Q7n�h�X�ʴ���:u*-6T��S�N���*�X,7nEQ�R�A�5%¢E�***�\n���z�Œ�;(��X,����@@�LEEŢE��ff��)��jjjT�\r>y�d8N١��h���\'O�T*����v�>�4�6_ 2���^�iOOOcc��9H&�������G��s�=\n��� �ډ�bn�[it-B[[���x\Z5�2�������ڔ��6��駟�����;��B�P]]��ӑ�������3{��hlhhQ*PWW�F[K�FDQ���S�>���,IRZ̙=��(I�����\n������a��fl�D�Q�˥�����i7�~��d:}���S���r��Ѩ�U��l���XUU��7n��4m�eE��7nL�T�x-�fl-H�d��T��������C�ӎ\\y��TVV��f�Jm �Z�w}(~411���C��e�azzz&&&&}�������F[��`���I�z����~2���߯�-�n���v[�DQT� ��������G�4=22��uB?�p8lm���)-�b1�~�$I�o�& �2��o߾�4�.,,�2m�}Jq� (]y\'���p��М>�e������9�N����A���(0��1388���v8�6l-��tԾ$I>�/�_t=��(�ϧ��Z��6l-�<���T����Q��=::����\\��V`!�\ZQ��K����I\n���W�e5�Ϝ�`� ����61�d*�1#�ԇ`k�eY��?�#��\n\n�Y�%�bAA��z��Oؿb)��˲*���L&bf�$IR�U>22�`k���0�`P�QII	1owA())QZo�Y���l-�,��x&}D���y�H�ϛ7O�+��x�bk���0J]q����ˉ9v����r�`�����������Zl�Ng�۝N\'�lI�T���t���![�h���|J�m6[~~>�lA���m6ۤO#�H���Fl-���w�ޤO�͛W\\\\LF�����͛7��{��y�^bv��8���@Ӵ��U�WVVjY�٣�x<[3�+kD����+�~˗H��0[�$���I�\n���Of������֦���b��Y�&��4�<�f�\Z����k��Ƶ��l�0��եt��N�[�vm�6�rs�v�Z�^����S�A����뛚��������4�\'\Z���<�MMMX��%[;F��رcJOM&ӆ\rX�M�F[�$�e7lؠ�J�رciz�h�B��CQ��l�t�R����e˖�]��F�-[V^^�T�ҥKf�o���`k�d2���)M���׏���Q�-I�������&�DQlkkK�D���)�^�����ѡT���dϞ=*�i��H$�gϞ���mmmz�^�Z��)��8��x�J{�ڵ.�+-��p�r�T&ã��ŋ9�C?\\c��L&ӗ_~��߯T�n�o߾�f���rQm6����Uv}������k�N��Z__������]�v��lK�v�ڥ2g&�b}}��M	0��$`Y������E�̳�>�e��3��H>}˖-�>��J������~��N\n���&�u��(�\Z���T����***X��q�˲�3F�$)�l۶��W_U��144����G\"��H\n�ѓC���ԩS*eX�]�n�ʕ+C��f�R(Z�r�u�ԛ�S�N�t�`�A��4z���o�-(((,,T*c0*++%Ijoo7�L�m��W֯��J]]]FF�J����G�bt�Dv2�,���^YY����T�`0TUU��䴵�Q���� �h�����M���vuu�߿_�ק��aB�����X,v�����j�٬R���$??��o�Mʙ��H$++�7�x��������:4::�9��B��L>�����G?��zɂ��%K��4�M�-B$Y�t�~�����)�����s�֙%��|�ܽ{wll���Z}�)33�瞳�l���^��a����J��q\\~~�֭[w�ޝ���^����������h�N	z����7��\\�)�����%K����u:݌�[�H$�nݺs�Χ�zjʏ�b�cǎ�;w.�3| C�S�<+���u�޽�˗OY�j��\\�5k��=�P(��3�$�</I��n���z����i�l8p�믿6Hu�@�SEQ,�vwwOLL���Oy,EQV��������),,�Z�<�����$I�h4X��+V���K?��OV�Xa�Z��?���G�9w��bA�S�w��d���H$�v�w�ޭt@�ҧFGG��ۛ�����M&˲r3�p�^EI�A��b�H�n�?��n����(;;;�\r###��߱����C�S��V��7���t&�\'566600����������T�i[�V�Ñ��[TT����؏�u������� �MAv����۶m{��S�=�D\"�ϟ�裏A���Ԅ1v��iZ^Iz����/������:t��i�a�<e!ة��(�^?44t��qQ����2I�$��w�����/>���Rvw�4I�(�b�����K��������A����R�t�;E���FY�]�x�+����O\Z�Ƥ7�<�����gϞ;w.�4�1vjB�S�$I�Ph����W�^�dɂ�]�I�+W�466޸q�d2a��j���گ-[�,_�\\e�v��u��G}444d�X�ԁ`�\n��M&See��ݻ�Ng���\'N�?���`Ui�@��O>�dժU6lX�h���\'&&��0���pXޤ���p�`0�L&�ٜ�����@GGG���놆ym�c���1!�I�q� �����U��,!�����{��������a���\'&&DQ����Aa��FӴ�b�Z�6���p8�����������\\Qo߾�������Os�9�;iDQ�8�g�ٱc�O<����p0�s�΅:::��@)��_�Q����\r���L�Q��$�4�x����Z��e��-K��� \'N�8u��q8q!Y�����W_}u����%��������_�~���)���f��;#-��?��8Q����.]ZZZZ^^oD�_��������ܤ@����y�e�~�m��W\Z;::\Z���<�0�z`��p��322.\\�v�W�X׿A���?:;;��S{��8�[�d��ݻ�ϟ?͏�|�k׮;v���ddd�,��Y��$�b1��8�۶m۪U�\n\n\n��f����\'N��~\\\0��Zq�H�4>>�v��={�L�V8��o�9r��y�kV�9��<h7f����S�=�f�������������?��l6#ۚA�5\"�vڴiӞ={�3�E�������_}�U0L�M�Qo޼y�ʕ���L��a���������N���[�xu�Ν[�l�N>�{｣G�F\"���Ra�����͛7/\\��p8�����Z+((����~�z(J�_�T���$idd��^��<���\'�|������Ⱥ�Y\"�o�y��ŋ����h�����)�{��]r[�k׮�_~y�o���������X,�o�i�ff``�ҥK�����������v�oܸ���Y�`�\"y>y����ׯ��{�����;����4���Hy�oll��t����n��QZZz��y��V՜s�Ykjjv��5e��ٳE1-\Z�G�4m0�]�6::�h�\"�CڜN����Ϝ9�y�ك`���kkk�z�-��78p��?�Z�i�P?Ju�8q��v;���N���իq�Ӈ`ϊX,V\\\\��_�B�B��w���.�l62��,�R���^VV�r7�N�+((����\n6Ҹ�HY�+��^{M}m���������7ߤ�	�3�eY��������ի*ŌF�;�v{,ӬnsZ�&IR8~�7�y��b^��O�S___��>#h���b�}�Yuuunn�R1�^_]]���$o�Ѳ��C�=�8�[�v��e��p�СC^���T�h����9t�P�J����m۶E����J{&	�PPP�n�:�qc(:r�ȵk�N��a����������*�^x��˗�<�Y��{&������|�2�~��_|1G�bYv||���s(R*c0�m�&\Z��`��㪫��n�J����>� �{�ґ^�ihhP�mnn�;=�	�ɳ�!��n��o�rnYgg�����9�z������t���(����\Z\Z��вn�B�=3AX�~�ʍ������DQ��l>r�HWW�R���̗^z�at�gĜ���ArrrV�\\��744tvvΑ���h��ȑ#*�u�ݥ��x�=#�7o�l�ٔ\n\\�|�ԩSf�Y�Z�\Z�^���}��q�E�ر#hY+R!؏KE�ӹ|�r�gϞM�+���h4655\r*(++����F�Z֊H��\n�?��OUN;�t��իW�t���b���|��*��nݺ����Xb�XUUUuu�R�������9�	��h��On߾�T���hŊh���XAx��U�(~���ؙ���ٟ}���S�Ųd����h?;q�$Y,��K�*�x�\"����e���T�~���fee!؏�N\\,+//W��Zŋ/�������(��y���9�LZ�h4���b����w.q~�ݺuJOGGG/\\�0g_\\�3����G���U���ǵ�a���XTTTVV�T������h�\'%7�gϞU*��O�\\��U��]�8�{�T\Z�\'Ob2\\��hlhhP��e˖)=�)!؉��^�p�R�|�֭��VAQ��hlmmU*P\\\\����)�����Q���Tn�?���7c��d�t��Ӽ���\n��e���`\'B>�Ti/���{�.�N�a�������I��l���<;1v\"$I*((Pz���;44�~��h��z�*s�%%%*�OA�|�E���|�G� ܹs��y�6�Q���[�W�r�1�N\0�7�F�L�4\nuwwc��4�����.��＼<�ł`\'\0��� .�K�i$�u���D�tWWW8V*���� �q�F�UUUJO���;����&���٩T`ѢEX��\0;n� ��mv��M�����`P	vAA�p&\0����*�;::p�\\\\X����VzZZZ��� ��$);;[��=00�]q�i���Sy:o�<d;^�\n�G���l��1��\'I��2����>b&\'\'��B��#��y�:����G?<�4�G�-v����g�*�wll�u(�R�܋e���l;^v|$I2��J�豱1�@Ӵ��Sz��������$�d2)�K)���c&##-v����/���=11��x(�R�j�����l��/;>���h�N\0EQ*�P�O\0�7�yo,O�ʟ/\Z�?Y|,˙3gnݺ�訏a�����J�|���Ç�r�4=44d�X�R��E�ݻ7�uH3� (mK����O�(�J�q�e��Z�1��ٌ�i\Z�gf�\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��ͪאBJ��\0\0\0\0IEND�B`�');

/*Table structure for table `llamado_de_atencion` */

DROP TABLE IF EXISTS `llamado_de_atencion`;

CREATE TABLE `llamado_de_atencion` (
  `cod` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `Fk_des_corta` int(50) NOT NULL,
  `Fk_apren` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `Fk_apren` (`Fk_apren`),
  KEY `Fk_des_corta` (`Fk_des_corta`),
  CONSTRAINT `llamado_de_atencion_ibfk_1` FOREIGN KEY (`Fk_apren`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `llamado_de_atencion_ibfk_2` FOREIGN KEY (`Fk_des_corta`) REFERENCES `descripcion_corta` (`Cod_Desc_Cor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `llamado_de_atencion` */

/*Table structure for table `prog_comp` */

DROP TABLE IF EXISTS `prog_comp`;

CREATE TABLE `prog_comp` (
  `cod_Pro` int(10) NOT NULL,
  `comp_Cod` int(20) NOT NULL,
  KEY `codigoComp` (`comp_Cod`),
  KEY `codigoProg` (`cod_Pro`),
  CONSTRAINT `codigoComp` FOREIGN KEY (`comp_Cod`) REFERENCES `competencias` (`comp_Cod`),
  CONSTRAINT `prog_comp_ibfk_1` FOREIGN KEY (`cod_Pro`) REFERENCES `programas` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prog_comp` */

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `Cod_Pro` int(40) NOT NULL,
  `Pro_Desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `programas` */

insert  into `programas`(`Cod_Pro`,`Pro_Desc`) values (1,'ANALISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÓN'),(2,'ANALISIS Y DESARROLLO DE SOFTWARE'),(4,'GESTION'),(5,'AVIACION'),(190,'SI');

/*Table structure for table `resultados_aprendizaje` */

DROP TABLE IF EXISTS `resultados_aprendizaje`;

CREATE TABLE `resultados_aprendizaje` (
  `result_Cod` int(10) NOT NULL,
  `resutt_Desc` varchar(300) NOT NULL,
  `comp_CodFK` int(20) NOT NULL,
  PRIMARY KEY (`result_Cod`),
  KEY `compCodigo` (`comp_CodFK`),
  CONSTRAINT `compCodigo` FOREIGN KEY (`comp_CodFK`) REFERENCES `competencias` (`comp_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resultados_aprendizaje` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
