--
--
-- QUERYS
--
--


-- NOME DOS CLIENTES E OS STATUS DE PEDIDO E ENTREGA 
SELECT CONCAT(c.Pname,' ',c.Lname) AS clientes ,o.idOrders AS pedido,o.ordersStatus AS status_pedido,d.deliveryStatus AS status_entrega
FROM Clients c,Orders o,Delivery d
 WHERE c.idClient = o.idOrderClient AND o.idOrders = d.idDOrder;

-- QUANTOS PEDIDOS FORAM FEITOS PELOS CLIENTES
SELECT  c.idClient,CONCAT(Pname,' ',Lname) AS clientes,COUNT(*) AS numero_pedidos FROM Clients c
	INNER JOIN Orders o ON c.idClient = o.idOrderClient
    GROUP BY idClient;


 
  -- ALGUM VENDEDOR TAMBÉM FORNECEDOR 
 SELECT se.idSeller,se.socialName,se.CNPJ,su.idSupplier,su.socialName,su.CNPJ 
	FROM Seller se
	INNER JOIN Supplier su ON se.idSeller = su.idSupplier;
 
 
 
  -- RELAÇÃO DE PRODUTOS FORNECEDORES E ESTOQUES
 SELECT idSupplier AS numero_fornecedor,socialName AS nome_fornecedor,CNPJ,
idProduct AS numero_produto,Pname AS produto,Category AS categoria,quantity AS quant_estoque FROM Product p
 INNER JOIN Supplier ON idProduct = idSupplier
 INNER JOIN productStorage ON idProdStorage = idProduct
 GROUP BY categoria;
 
 
 -- RELAÇÃO DE NOMES DOS FORNECEDORES E NOMES DOS PRODUTOS
 SELECT DISTINCT s.socialName AS nome_fornecedor,p.Pname AS nome_produto FROM Product p
 LEFT JOIN supplier s ON s.idSupplier = p.idProduct
 ;
 


 
 -- CLIENTES QUE PAGARAM POR UM PEDIDO VIA PIX
 SELECT CONCAT(Pname,' ',Lname) AS clients ,o.idOrders AS numero_pedido,p.typePayment AS tipo_pagamento
 FROM Orders o 
 INNER JOIN Clients c ON c.idClient = o.idOrderClient
 INNER JOIN Payments p ON p.idPayment = o.idOrderPayment
 WHERE typePayment LIKE '%Pix%';
 
 

 
 
 
 
 