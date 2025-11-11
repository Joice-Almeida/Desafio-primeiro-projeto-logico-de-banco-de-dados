-- CRIAÇÃO DO BANCO DE DADOS PARA O CENÁRIO DE E-COMMERCE

CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

-- CRIAÇÃO DA TABELA CLIENTE 

ALTER TABLE Clients AUTO_INCREMENT = 1;

CREATE TABLE Clients (
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    Costumer_type ENUM('PF','PJ'),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_cliente UNIQUE(CPF)
    );
      
-- CRIAÇÃO DA TABELA PRODUTO

CREATE TABLE Product (
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(10) NOT NULL,
    Classification_kids BOOLEAN ,
    Category ENUM('Eletrônico','Vestimenta','Brinquedo','Alimentos','Móveis') NOT NULL,
	Evaluation FLOAT DEFAULT 0,
    Size VARCHAR(10)
);

-- CRIAÇÃO DA TABELA PAGAMENTOS
CREATE TABLE Payments(
	idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idPClient INT,
    typePayment ENUM('Boleto','Cartão','Dois cartões'),
    limitAvailable FLOAT,
    CONSTRAINT fk_payments_client FOREIGN KEY (idPclient) REFERENCES Clients(idClient)
	);

-- CRIAÇÃO DA TABELA PEDIDO
CREATE TABLE Orders(
	idOrders INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    idOrderPayment INT,
    ordersStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    ordersDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES  Clients(idClient)
    
    );
    
-- CRIAÇÃO DA TABELA ENTREGA
CREATE TABLE Delivery(
	idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    idDOrder INT,
    deliveryStatus ENUM('Pedido enviado','Pedido em rota','Pedido entregue'),
    trackingNumber VARCHAR(20),
    CONSTRAINT fk_order_delivery FOREIGN KEY (idDOrder) REFERENCES Orders(idOrders),
    CONSTRAINT unique_trackingNumber UNIQUE(trackingNumber)
    );
    
    
 -- CRIAÇÃO DA TABELA ESTOQUE
 CREATE TABLE productStorage(
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
    );
    
    
-- CRIAÇÃO DA TABELA FORNECEDOR
CREATE TABLE Supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
	CONSTRAINT unique_supplier UNIQUE (CNPJ)
    );
    
    
-- CRIAÇÃO DA TABELA VENDEDOR 
CREATE TABLE Seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    abstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
    );
    
  
  --
  --
  -- CRIAÇÃO DAS TABELAS SECUNDÁRIAS
  --
  --
  
  
CREATE TABLE productSeller(
	idPseller INT,
    idPproduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller,idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES Seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES Product(idProduct)
    
    );
    
    
CREATE TABLE productOrder(
	idPOproduct INT,
    idPOorder INT,
    prodQuantity INT DEFAULT 1,
    poStatus ENUM('Disponivel','Sem estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (idPOproduct,idPOorder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES Product(idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES Orders(idOrders)
   ); 
    
    
CREATE TABLE storageLocation(
	idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct,idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY(idLproduct) REFERENCES Product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY(idLstorage) REFERENCES productStorage(idProdStorage)
    );
    

CREATE TABLE prodctSupplier(
	idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier,idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES Supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES Product(idProduct)
    
   ); 
    
    