PRAGMA foreign_keys = ON; 

DROP TABLE IF EXISTS agendamentos;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS tutores;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    nome    VARCHAR(100) NOT NULL,
    login   VARCHAR(50)  NOT NULL UNIQUE,
    senha   VARCHAR(200) NOT NULL
);

CREATE TABLE tutores (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    nome      VARCHAR(100) NOT NULL,
    cpf       VARCHAR(200) NOT NULL,
    telefone  VARCHAR(20),
    email     VARCHAR(100)
);

CREATE TABLE pets (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    nome             VARCHAR(50) NOT NULL,
    especie          VARCHAR(30) NOT NULL,
    raca             VARCHAR(50),
    data_nascimento  DATE,
    tutor_id         INTEGER NOT NULL,
    FOREIGN KEY (tutor_id) REFERENCES tutores(id)
);

CREATE TABLE agendamentos (
    id                INTEGER PRIMARY KEY AUTOINCREMENT,
    pet_id            INTEGER NOT NULL,
    data_agendamento  DATETIME NOT NULL,
    servico           VARCHAR(100) NOT NULL,
    status            VARCHAR(20) NOT NULL DEFAULT 'Agendado',
    FOREIGN KEY (pet_id) REFERENCES pets(id)
);


INSERT INTO usuarios (nome, login, senha) VALUES
('Roberto Gerente',     'gerente',   '3f9508aefb055e3a9f1808ec74f5661d:5c9fe6271fa8e5e8d2e1ec7e3074cc1576a1a3f47362cb12ea932dceb73f57ed'),
('Dr. Felipe Nogueira', 'vet',       '6a81b02c782b6e02746219516ffcae44:911a991b2848c64bfb93039d3d3c8b2dd19e8b5867f601cf570aa32e19873588'),
('Juliana Atendente',   'atendente', '5bcc065f1399587018412686332efe74:bceb89279565601dba6f4124e3b333bf2dcc617c7831f9c19568e61a6d46cb00');

INSERT INTO tutores (nome, cpf, telefone, email) VALUES
('Fernanda Ribeiro',    '137ebabe41e6fdd39df66b869f57af6b:fd944146d352ded89bf36538af4514595132af4f08ddf6cf01c93d9554dd4d84', '(71) 98811-0001', 'fernanda.ribeiro@email.com'),
('Lucas Monteiro',      'b003f1ec35c005bd4ea59cfefb3d8663:81ca71a1d47eb87bb743e00a798407849a7f68c9ddf507da622fab9d1af0d148', '(71) 98822-0002', 'lucas.monteiro@email.com'),
('Patrícia Cardoso',    '35fa2ce43657678f176c35688e287333:6247aa04cc5594fa6548fdce247e5d8f1eacf492e90fcb149e6df4ba570c6412', '(71) 98833-0003', 'patricia.cardoso@email.com'),
('Rafael Teixeira',     '4a0ee56a666a59022b0f00a9ffcfa421:0d324ed0b48a118b0145951a0f356916a113c56bc33beec88fafc87fab20efe9', '(71) 98844-0004', 'rafael.teixeira@email.com'),
('Beatriz Nascimento',  '40a6afbe23a9be35d46920a67c4a577c:ca9c5ca8bb116f154e0b3416e73c72292f3e9510329200a76dc98ce7a576a833', '(71) 98855-0005', 'beatriz.nascimento@email.com');
 
INSERT INTO pets (nome, especie, raca, data_nascimento, tutor_id) VALUES
('Rex',     'Cachorro', 'Pastor Alemão', '2018-06-12', 1),
('Mimi',    'Gato',     'Maine Coon',    '2021-02-28', 2),
('Pipoca',  'Cachorro', 'Shih Tzu',      '2022-09-09', 3),
('Simba',   'Gato',     'Laranja SRD',   '2020-12-01', 1),
('Zeca',    'Papagaio', 'Verdadeiro',    '2016-04-17', 4),
('Docinho', 'Hamster',  'Sírio',         '2024-01-20', 5);
 
-- Inseridos fora de ordem de propósito: a listagem ordena por data_agendamento.
INSERT INTO agendamentos (pet_id, data_agendamento, servico, status) VALUES
(3, '2026-12-10T16:30', 'Banho e tosa',            'Agendado'),
(1, '2026-11-19T08:00', 'Consulta de rotina',      'Agendado'),
(5, '2026-11-30T13:00', 'Avaliação de plumagem',   'Agendado'),
(2, '2026-11-17T10:30', 'Vacina V4 felina',        'Agendado'),
(4, '2026-11-10T09:00', 'Castração (retorno)',     'Concluído'),
(6, '2026-12-03T11:15', 'Check-up geral',          'Agendado'),
(1, '2026-12-15T14:45', 'Exame de sangue',         'Agendado');
