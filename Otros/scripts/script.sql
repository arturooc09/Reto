USE RETO_DB
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name='tb_denuncias')
BEGIN
	DROP TABLE tb_denuncias
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name='tb_contactos')
BEGIN
	DROP TABLE tb_contactos
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name='tb_usuarios')
BEGIN
	DROP TABLE tb_usuarios
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name='tb_roles')
BEGIN
	DROP TABLE tb_roles
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name='tb_mensajes')
BEGIN
	DROP TABLE tb_mensajes
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name='tb_tipo_mensajes')
BEGIN
	DROP TABLE tb_tipo_mensajes
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name='tb_estado_denuncias')
BEGIN
	DROP TABLE tb_estado_denuncias
END
GO

CREATE TABLE tb_contactos(
id_contacto bigint primary key identity(1,1) not null,
nombre varchar(50),
descripcion	varchar(200))
GO

CREATE TABLE tb_roles(
id_rol bigint primary key identity(1,1) not null,
nombre_rol	varchar(100))
GO

CREATE TABLE tb_usuarios(
id_usuario bigint primary key identity(1,1) not null,
id_rol bigint FOREIGN KEY REFERENCES tb_roles(id_rol),
nombre varchar(50),
apellido varchar(50),
usuario	varchar(50),
clave varchar(50))
GO

CREATE TABLE tb_tipo_mensajes(
id_tipo_mensaje bigint primary key identity(1,1) not null,
nombre_mensaje varchar(50))
GO

CREATE TABLE tb_mensajes(
id_mensaje bigint primary key identity(1,1) not null,
id_tipo_mensaje BIGINT FOREIGN KEY REFERENCES tb_tipo_mensajes(id_tipo_mensaje),
texto_mensaje varchar(100))
GO

CREATE TABLE tb_estado_denuncias(
id_estado_denuncia bigint primary key identity(1,1) not null,
estado_denuncia varchar(50))
GO

CREATE TABLE tb_denuncias(
id_denuncia bigint primary key identity(1,1) not null,
fecha datetime,
id_usuario bigint FOREIGN KEY REFERENCES tb_usuarios(id_usuario),
id_mensaje bigint FOREIGN KEY REFERENCES tb_mensajes(id_mensaje),
id_estado_denuncia bigint FOREIGN KEY REFERENCES tb_estado_denuncias(id_estado_denuncia))
GO