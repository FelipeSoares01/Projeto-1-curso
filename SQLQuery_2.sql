CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Veículo (
    ID_Veículo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Serviço (
    ID_Serviço INT PRIMARY KEY AUTO_INCREMENT,
    Descrição VARCHAR(255),
    Preço DECIMAL(10, 2)
);

CREATE TABLE Agendamento (
    ID_Agendamento INT PRIMARY KEY AUTO_INCREMENT,
    ID_Veículo INT,
    ID_Serviço INT,
    Data DATE,
    Status VARCHAR(20),
    FOREIGN KEY (ID_Veículo) REFERENCES Veículo(ID_Veículo),
    FOREIGN KEY (ID_Serviço) REFERENCES Serviço(ID_Serviço)
);
INSERT INTO Cliente (Nome, Telefone, Email) VALUES
('João Silva', '9999-9999', 'joao@email.com'),
('Maria Oliveira', '8888-8888', 'maria@email.com');

INSERT INTO Veículo (ID_Cliente, Marca, Modelo, Ano) VALUES
(1, 'Ford', 'Fiesta', 2019),
(1, 'Chevrolet', 'Onix', 2020),
(2, 'Volkswagen', 'Gol', 2018);

INSERT INTO Serviço (Descrição, Preço) VALUES
('Troca de óleo', 150.00),
('Alinhamento', 100.00),
('Revisão geral', 250.00);

INSERT INTO Agendamento (ID_Veículo, ID_Serviço, Data, Status) VALUES
(1, 1, '2024-11-30', 'Agendado'),
(2, 2, '2024-12-01', 'Agendado'),
(3, 3, '2024-12-02', 'Concluído');

SELECT * FROM Cliente;

SELECT * FROM Veículo WHERE Ano >= 2019;

SELECT v.ID_Veículo, v.Marca, v.Modelo, YEAR(CURDATE()) - v.Ano AS Idade_Veículo
FROM Veículo v;

SELECT * FROM Agendamento ORDER BY Data DESC;

SELECT s.Descrição, COUNT(a.ID_Agendamento) AS Total_Agendamentos
FROM Serviço s
JOIN Agendamento a ON s.ID_Serviço = a.ID_Serviço
GROUP BY s.ID_Serviço
HAVING COUNT(a.ID_Agendamento) > 0;

SELECT c.Nome, v.Marca, s.Descrição, a.Data
FROM Agendamento a
JOIN Veículo v ON a.ID_Veículo = v.ID_Veículo
JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente
JOIN Serviço s ON a.ID_Serviço = s.ID_Serviço
WHERE a.Status = 'Agendado';

