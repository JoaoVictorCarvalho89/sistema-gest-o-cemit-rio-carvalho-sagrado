1. Entidades
   
   Cliente, Produto, Serviço, Contrato, Falecido e Jazigo. 

   O CLIENTE pode comprar PRODUTOS do cemitério, tais como decorações, ou assinar CONTRATOS, assim, agendando SERVIÇOS funerários para a cerimônia do FALECIDO, este que pode, ou não, estar alocado em um jazigo.
   Enquanto aos FUNCIONÁRIOS, eles possuem status de ocupação e atuação para serem gerenciados conforme a necessidade dos SERVIÇOS contratados pelos CLIENTES.

3. Relacionamentos e Cardinalidades

   [Cliente] (0,N) <Comprar> (1,1) [Produto]
   Descrição: Cada cliente pode comprar vários produtos, mas um produto só pode atender a um cliente.
   
   [Cliente] (1,N) <Assinar> (1,N) [Contrato]
   Descrição: Cada cliente pode assinar vários contratos, e um contrato pode atender a vários cliente.
   
   [Cliente] (1,N) <Preparar> (1,N) [Falecido]
   Descrição: Cada cliente pode preparar vários falecidos para cremação, enterros e cerimônias, e estes falecidos podem pertencer a mais de um cliente.
   
   [Contrato] (0,N) <Validar> (1,N) [Serviço]
   Descrição: Cada contrato pode validar vários serviços, e um serviço pode atender a vários clientes e contratos.

   [Serviço] (0,N) <Validar> (1,N) [Funcionário]
   Descrição: Alguns serviços devem ser executados por mais de um funcionário, e alguns funcionários podem executar mais de um serviço, ou estarem completamente desocupdos.
   
   [Falecido] (0,N) <Alocar> (1,1) [Jazigo]
   Descrição: Cada falecido pode estar alocado em um jazigo, enquanto um jazigo pode acomodar vários falecidos.
   
5. Sugestão de Atributos

   Cliente: CPF (PK), nome, e-mail (Multivalorado), telefone (Multivalorado), senha, data de nascimento, endereço (composto);
   Produto: ID (PK), nome, preço, categoria;
   Serviço: ID (PK), continuidade, nome, preço, cliente;
   Funcionário CPF (PK), nome, telefone (Multivalorado), ocupação, status;
   Contrato: ID (PK), data, cliente, validade, serviço;
   Falecido: CPF (PK), certidão de óbito, nome, data de nascimento, cliente;
   Jazigo: ID (PK), número, tipo, status;

7. Diagrama Entidade e Relacionamento (DER)

<img width="902" height="730" alt="image" src="https://github.com/user-attachments/assets/0eecf652-2b8a-40c8-88e8-90461d117b07" />

