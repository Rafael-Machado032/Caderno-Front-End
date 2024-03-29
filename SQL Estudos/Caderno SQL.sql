--MySQL
--DDL Data Definition Language (Linguagem de Definição de dados)
 

/*Criar Banco de Dados*/
/*Para criar um banco de dados seleciona "Query/New Tab to Current Serve"*/

CREATE SCHEMA estudoSQL;
/*ou*/
CREATE DATABASE estudoSQL;
/*Os dois comandos são o mesmo*/

-------------------------------------------------------------------------------------------------------------
/*Para criar uma tabela*/

CREATE TABLE cliente(   //cliente é o nome da tabela
    i_cliente_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT, // (tipo de dado)_(nome do campo)_(nome da tabela)
    s_nome_cliente VARCHAR(50) NOT NILL,
    s_cpf_cliente CHAR(11) NOT NULL,
    d_nasc_cliente DATETIME
);

/*
PRIMARY KEY       Chave primaria
NOT NULL          Não pode ser nulo obs: Caso for chave primaria não precisa declarar NOT NULL pois e obrigatória o preenchimento
AUTO_INCREMENT    Banco de dados que vai administrar com o valor definido automaticamente

INT               Inteiro
VARCHAR(n)        O VARCHAR tem tamanho dinâmico ou seja ocupa até o limite n se não usar desocupa para outro campo 
CHAR(n)           O CHAR tem tamanho fixo ou seja ocupa n espaço mesmo que não esteja usando
*/

-------------------------------------------------------------------------------------------------------------
/*Deletar o banco de dados*/

DROP SCHEMA cursos;

/*Deletar tabela*/

DROP TABLE cliente

-------------------------------------------------------------------------------------------------------------
/*Alterar tabela*/

ALTER TABLE cliente MODIFY COLUMN s_nome_cliente VARCHAR(30) NOT NULL; //Altera de 50 para 30 e não vazio

-------------------------------------------------------------------------------------------------------------
/*Adicionar coluna*/

ALTER TABLE cliente ADD i_tipo_cliente INT DEFAULT 1; Adiciona uma coluna com o valor padra 1


/*Excluir coluna*/

ALTER TABLE cliente DROP i_tipo_cliente;

/*Para comentário SQL*/

-------------------------------------------------------------------------------------------------------------
/*Ligar 2 tabelas (Chave Primaria/Chave Estrangeira)*/

CREATE TABLE cliente(   //Tabela Cliente
    i_tipo_cliente INT NOT NULL;
    i_cliente_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT, // (tipo de dado)_(nome do campo)_(nome da tabela)
    s_nome_cliente VARCHAR(50) NOT NILL,
    s_cpf_cliente CHAR(11) NOT NULL,
    d_nasc_cliente DATETIME
);

create table tipo_cliente( //Tabela Tipo Cliente
    i_tipocliente_tipocliente INT PRIMARY KEY AUTO_INCREMENT,
    s_dectipocliente_tipocliente VARCHAR(100) NOT NULL
);

/*
ALTER TABLE <tabela_origem> ADD CONSTRAINT <nome_restrição> FOREIGN KEY (<campo_tabela_origem>) REFERENCES <tabela_destino> (<camp_tabela_destino>);


ADD CONSTRAINT    Adiciona a nome da restrição
FOREIGN KEY       Tipo é Chave estrangeira  
REFERENCES        Referencia da tabela de destino
*/

ALTER TABLE cliente ADD CONSTRAINT fk_tipocliente FOREIGN KEY (i_tipo_cliente) REFERENCES tipo_cliente (i_tipocliente_tipocliente);

/*fk_tipocliente = i_tipo_cliente -> i_tipocliente_tipocliente*/
/*Ao fazer o INSERT no i_tipo_cliente o valor tem que ser igual ao valor i_tipocliente_tipocliente para adicionar*/

-------------------------------------------------------------------------------------------------------------//
/*Tipos de dados

|          Dados de Texto         |
| Tipo de texto | Máximo de bytes |
|               |                 |
|Tinytext       |255              |
|Text           |65.535           |
|Mediumtext     |16.777.215       |
|Longtext       |4.294.967.295    |
|Char           |255              |
|Varchar        |65.535           |

|                                                        Dados Numéricos                                                   |
| Tipo de texto |                      Com sinal                        |                   Sem sinal                      |
|               |                                                       |                                                  |
|Tinyint        |-128 a 127                                             |0 a 255                                           |
|Smallint       |-32.768 a 32.767                                       |0 a 65.535                                        |
|Mediumint      |-8.388.608 a 8.388.607                                 |0 a 16.777.215                                    |
|Int/Integer    |-2.147.483.648 a 2.147.483.647                         |0 a 4.294.967.295                                 |
|Bigint         |-9.223.372.036.854.755.808 a 9.223.372.036.854.775.807 |                                                  |
|Float(p,e)     |-3,402823466E+38 a -1,17549435E-38                     |1,175494351E-38 a 3,402823466E+38                 |
|Double(p,e)    |-1,7976931348623157E+308 a -2,2250738585072014E-308    |2,2250738585072014E-308 a 1,7976931348623157E+308 |
|Decimal(p,e)   |                                                       |                                                  |

p = Precisão
e = Escala

ex: float(4,2) => Tamanho de 4, sendo 2 a esquerda e 2 a direita => 30.10 ou 4.25 => ERRO: 124.1 ou 125.325

|                              Dados Temporais                                  |
| Tipo de texto |     Com sinal      |               Sem sinal                  |
|               |                    |                                          |
|Date           |AAAA-MM-DD          |1000-01-01 a 9999-12-12                   |
|DateTime       |AAAA-MM-DD HH:MI:SS |1000-01-01 00:00:00 a 9999-12-31 23:59:59 |
|Timestamp      |AAAA-MM-DD HH:MI:SS |1970-01-01 00:00:00 a 2037-12-31 23:59:59 |
|Year           |AAAA                |1901 a 2155                               |
|Time           |HH:MI:SS            |-838:59:59 a 938:59:59                    |
*/
ALTER TABLE cliente ADD i_idade_cliente INT;
ALTER TABLE cliente MODIFY i_idade_cliente TINYINT;

-------------------------------------------------------------------------------------------------------------
/*Relacionamentos do Banco de Dados

Tipo de relacionamento  

Uma para um:
Ambas tabelas podem ter somente um registro de cada lado do relacionamento.
Cada valor da chave primária se relaciona a nenhum ou a apenas um registro na tabela relacionada.
A maioria dos relacionamentos de um para um são forçados por regras de negócios e não fluem naturalmente dos dados. Sem tal regra, geralmente você pode combinar as duas tabelas sem quebrar nenhuma regra de normalização.

Uma para muitos
A tabela de chave primária contém somente um registro relacionado a nenhum, a um ou a muitos registros da tabela relacionada.

Muitos para muitos
Cada registro em ambas as tabelas pode se relacionar a nenhum ou a qualquer número de registros na outra tabela. Esses relacionamentos requerem uma terceira tabela, chamada de tabela associada ou de associação, pois os sistemas relacionais não podem acomodar diretamente o relacionamento.
*/

-------------------------------------------------------------------------------------------------------------
/*Inserindo Dados

INSERT INTO <tabela> (colunas) values (valores); 
Quando quero inserir todas as colunas não preciso especificar a mesma
ex:
*/
INSERT INTO cliente VALUES (01,'Rafael Machado','01010101010','2010-04-01',01);

-------------------------------------------------------------------------------------------------------------
/*Consultando tabela

Comando mostra todo o conteúdo da tabela
SELECT * FROM <tabela>;
*/
SELECT * FROM cliente;
SELECT * FROM cliente_backup;

-------------------------------------------------------------------------------------------------------------








































