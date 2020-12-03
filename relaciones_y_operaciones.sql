CREATE DATABASE blog;
\c blog
CREATE TABLE usuario(id INT, email VARCHAR(30), PRIMARY KEY(id));
CREATE TABLE post(id INT, usuario_id INT, titulo VARCHAR(30), fecha DATE, PRIMARY KEY(id), FOREIGN KEY (usuario_id) REFERENCES usuario(id));
CREATE TABLE comentario(id INT, usuario_id INT, post_id INT, texto VARCHAR(30), fecha DATE, PRIMARY KEY(id), FOREIGN KEY (usuario_id) REFERENCES usuario(id), FOREIGN KEY (post_id) REFERENCES post(id));
\COPY usuario FROM 'usuarios.csv' csv header;
\COPY post FROM 'post.csv' csv header;
\COPY comentario FROM 'comentarios.csv' csv header;
SELECT email, post.id, titulo FROM post INNER JOIN usuario ON usuario.id = post.usuario_id WHERE usuario.id = 5;
SELECT email, usuario.id, texto FROM comentario INNER JOIN usuario ON usuario.id = comentario.usuario_id WHERE usuario.email != 'usuario06@hotmail.com';
SELECT usuario.id, email FROM usuario LEFT JOIN post ON usuario.id = post.usuario_id WHERE post IS NULL;
SELECT * FROM post LEFT JOIN comentario ON post.id = comentario.post_id;
SELECT * FROM usuario JOIN post ON usuario.id = post.usuario_id WHERE post.fecha BETWEEN '2020-06-01' AND '2020-06-30';