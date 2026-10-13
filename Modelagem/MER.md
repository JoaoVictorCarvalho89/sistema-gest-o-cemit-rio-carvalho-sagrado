1. Entidades
   
   Cliente, Produto, Serviço, Falecido e Jazigo. 

   O CLIENTE pode comprar PRODUTOS do cemitério, tais como decorações, ou contratar SERVIÇOS funerários para a cerimônia do FALECIDO, este que pode, ou não, estar alocado em um jazigo.
   Enquanto aos FUNCIONÁRIOS, eles possuem status de ocupação e atuação para serem gerenciados conforme a necessidade dos SERVIÇOS contratados pelos CLIENTES.

2. Relacionamentos e Cardinalidades

  * [Cliente] (1,1) — (0,N) [Produto] Descrição: Cada cliente pode realizar a compra de 0 ou vários ($N$) produtos, enquanto cada registro de compra de produto pertence obrigatoriamente a 1 único cliente.
  * [Cliente] (1,1) — (0,N) [Serviço] (via associativa Contratar )Descrição: Cada cliente pode contratar 0 ou vários ($N$) serviços, e um serviço do catálogo pode estar contratado por 0 ou vários ($N$) clientes. Cada contrato individual está vinculado obrigatoriamente a 1 único cliente.
  * [Cliente] (1,N) — (1,N) [Falecido] (via associativa Preparar) Descrição: Um cliente pode ser o responsável pela preparação de 1 ou vários ($N$) falecidos (para sepultamento, cremação ou cerimonial), e um mesmo falecido pode estar associado a 1 ou mais ($N$) clientes responsáveis (como familiares/membros da família).
  * [Serviço] (0,N) — (1,N) [Funcionário] (via associativa Execução) Descrição: Cada serviço do catálogo pode ter 0 ou várias ($N$) execuções registradas. Uma execução de serviço exige a atuação de pelo menos 1 ou mais ($N$) funcionários, enquanto cada funcionário pode participar de 1 ou várias ($N$) execuções de serviços.
  * [Falecido] (0,N) — (1,1) [Jazigo] (via relacionamento Enterrar) Descrição: Um falecido pode estar alocado em no máximo 1 jazigo (ou nenhum, caso ainda não tenha sido sepultado), enquanto um mesmo jazigo pode acomodar 0 até vários ($N$) falecidos, respeitando o limite do seu atributo de capacidade (Vagas).
  * [Unidade_Regional] (0,N) — (1,1) [Jazigo] (via relacionamento Possui) Descrição: Uma unidade regional pode conter 0 ou vários ($N$) jazigos (permitindo a existência de unidades administrativas sem área de cemitério), enquanto cada jazigo pertence obrigatoriamente a 1 única unidade regional.
  * [Unidade_Regional] (1,N) — (1,1) [Funcionário] (via relacionamento Possui)Descrição: Uma unidade regional possui 1 ou vários ($N$) funcionários alocados, e cada funcionário pertence de forma fixa a 1 única unidade regional.
   
3. Sugestão de Atributos

   * Cliente: CPF (PK), nome, e-mail (Multivalorado), telefone (Multivalorado), senha, data de nascimento, endereço (composto);
   * Produto: ID (PK), nome, preço, categoria;
   * Serviço: ID (PK), continuidade, nome, preço, cliente;
   * Funcionário CPF (PK), nome, telefone (Multivalorado), ocupação, status;
   * Falecido: CPF (PK), certidão de óbito, nome, data de nascimento, cliente;
   * Jazigo: ID (PK), número, tipo, status, vagas;

4. Diagrama Entidade e Relacionamento (DER)

<img width="796" height="745" alt="image" src="https://github.com/user-attachments/assets/eb757881-b8bf-4e5e-9e89-77b5dfecf2de" />





