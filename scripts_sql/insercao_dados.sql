    --
--
-- INSERÇÃO DE DADOS NAS TABELAS
--
--
SHOW TABLES;
DESC Clients;

-- idClient,Minit,Lname,CPF,Address
INSERT INTO Clients (Pname,Minit,Lname,CPF,Costumer_type,Address)
	VALUES('Maria','M','Silva',123456789,'PF','rua Silva de Prata 29,Carangola - Cidade das Flores'),
    ('Matheus','O','Pimentel',987654321,'PF','rua Alemeda 289,Centro - Cidade das Flores'),
    ('Ricardo','F','Silva',45678913,'PJ','avenida Alemeda Vinha 1009,Centro - Cidade das Flores'),
    ('Julia','S','França',789123456,'PF','rua Laranjeiras 861,Centro - Cidade das Flores'),
    ('Roberta','G','Assis',98745631,'PJ','Avenida de Koller 19,Centro - Cidade das Flores'),
    ('Isabela','M','Cruz','654789123','PF','rua Alemeda das Flores 28,Centro - Cidade das Flores');
    
    
    DESC Product;
    
    -- idProduct,Pname,Classification_kids boolean,Category,Evaluation,Size
INSERT INTO Product(Pname,Classification_kids,Category,Evaluation,Size)
	VALUES('Fone de ouvido',FALSE,'Eletrônico','4',NULL),
    ('Barbie Elsa',TRUE,'Brinquedo','3',NULL),
    ('Body Carters',TRUE,'Vestimenta','5',NULL),
    ('Microfone Vedo',TRUE,'Eletrônico','4',NULL),
    ('Sofá retrátil',FALSE,'Móveis','3','3x57x80'),
    ('Farinha de Arroz',FALSE,'Alimentos','2',NULL),
    ('Fire Stick Amazon',FALSE,'Eletrônico','3',NULL);
    



DESC Orders;    

-- idOrders,idOrderClient,idOrderPayment,orderStatus,orderDescription,sendValue,paymentCash
INSERT INTO Orders (idOrderClient,idOrderPayment,ordersStatus,ordersDescription,sendValue,paymentCash)
	VALUE(1,1,DEFAULT,'compra via aplicativo',NULL,1),
    (2,2,DEFAULT,'compra via aplicativo',50,0),
    (3,3,'Confirmado',NULL,NULL,1),
    (4,4,DEFAULT,'compra via web site',150,0);
    
    
    DESC Delivery;
    
    -- idDOrder,deliveryStatus,tracking
    INSERT INTO Delivery (idDOrder,deliveryStatus,trackingNumber)
		VALUES (1,'Pedido enviado','BR1234567890SP'),
        (2,'Pedido enviado','AB987654321CD'),
        (3,'Pedido em rota','ZX456789012BR'),
        (4,'Pedido enviado','TR0011223344US');
   
   DESC Payments;

 -- idClient,typePayment,limitAvailable 
 INSERT INTO Payments (idPClient,typePayment,limitAvailable)
	VALUES (1,'Pix',NULL),
		(2,'Cartão',1000),
        (3,'Pix',NULL),
        (4,'Boleto',NULL);
   
   
    DESC productOrder;
-- idPOproduct,idOorder,prodQuantity,poStatus
INSERT INTO productOrder (idPOproduct,idPOorder,prodQuantity,poStatus)
		VALUES(1,1,2,NULL),
        (2,1,1,NULL),
        (3,2,1,NULL);
        

DESC productStorage;

-- storageLocation,quantity
INSERT INTO productStorage (storageLocation,quantity)
		VALUES ('Rio de Janeiro',1000),
        ('Rio de Janeiro',500),
        ('São Paulo',10),
        ('São Paulo',100),
        ('São Paulo',10),
        ('Brasilia',10);
        
        
DESC storageLocation;

-- idLproduct,idLstorage,location
INSERT INTO storageLocation (idLproduct,idLstorage,location)
	VALUES (1,2,'RJ'),
		(2,6,'GO');
        