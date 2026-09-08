1. Entidades
   
   Cliente, Produto, Serviço, Falecido e Jazigo. 

   O CLIENTE pode comprar PRODUTOS do cemitério, tais como decorações, ou contratar SERVIÇOS funerários para a cerimônia do FALECIDO, este que pode, ou não, estar alocado em um jazigo.
   Enquanto aos FUNCIONÁRIOS, eles possuem status de ocupação e atuação para serem gerenciados conforme a necessidade dos SERVIÇOS contratados pelos CLIENTES.

3. Relacionamentos e Cardinalidades

   [Cliente] (0,N) <Comprar> (1,1) [Produto]
   Descrição: Cada cliente pode comprar vários produtos, mas um produto só pode atender a um cliente.
   
   [Cliente] (1,N) <Contratar> (0,N) [Serviço]
   Descrição: Cada cliente pode contratar vários serviços, e um serviço pode atender a vários clientes.
   
   [Cliente] (1,N) <Preparar> (1,N) [Falecido]
   Descrição: Cada cliente pode preparar vários falecidos para cremação, enterros e cerimônias, e estes falecidos podem pertencer a mais de um cliente.

   [Serviço] (0,N) <Validar> (1,N) [Funcionário]
   Descrição: Alguns serviços devem ser executados por mais de um funcionário, e alguns funcionários podem executar mais de um serviço, ou estarem completamente desocupdos.
   
   [Falecido] (0,N) <Alocar> (1,1) [Jazigo]
   Descrição: Cada falecido pode estar alocado em um jazigo, enquanto um jazigo pode acomodar vários falecidos.
   
5. Sugestão de Atributos

   Cliente: CPF (PK), nome, e-mail (Multivalorado), telefone (Multivalorado), senha, data de nascimento, endereço (composto);
   Produto: ID (PK), nome, preço, categoria;
   Serviço: ID (PK), continuidade, nome, preço, cliente;
   Funcionário CPF (PK), nome, telefone (Multivalorado), ocupação, status;
   Falecido: CPF (PK), certidão de óbito, nome, data de nascimento, cliente;
   Jazigo: ID (PK), número, tipo, status, vagas;

7. Diagrama Entidade e Relacionamento (DER)

<img width="900" height="714" alt="image" src="https://github.com/user-attachments/assets/8c73902a-2fb9-45dd-ba78-0aff072d6471" />




