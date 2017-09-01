[checkmark]: https://raw.githubusercontent.com/mozgbrasil/mozgbrasil.github.io/master/assets/images/logos/logo_32_32.png "MOZG"
![valid XHTML][checkmark]

[requerimentos]: https://mozg.loggly.com/search
[github-boxpacker]: https://github.com/dvdoug/BoxPacker
[getcomposer]: https://getcomposer.org/
[uninstall-mods]: https://getcomposer.org/doc/03-cli.md#remove
[artigo-composer]: http://mozg.com.br/ubuntu/composer
[ioncube-loader]: http://www.ioncube.com/loaders.php
[acordo]: http://mozg.com.br/acordo-licenca-usuario-final/

# Mozg\BoxPacker

## Sinopse

Módulo requerido para funcionamento dos demais módulos de entrega

## Motivação

Atender o mercado de módulos para Magento oferecendo um excelente suporte

## Característica técnica

Se trata do ambiente para definição das dimensões de cada uma de suas Embalagem/Caixa

No sistema de Gerenciamento de Embalagem/Caixa foram pré-cadastrados registros para as seguintes embalagens no formato Caixa, vinculadas ao devido método de entrega

https://www.correios.com.br/para-voce/envio/embalagens-para-envios

http://www.jadlog.com.br/tamanhos.html

Como a Jamef não disponibiliza em seu site uma tabela semelhante as demais transportadora foi criado apenas um registro genérico vinculado a todos os métodos de entrega

No backend do Magento acesse o menu: MOZG -> Gerenciar Embalagem/Caixa -> cadastre as devidas embalagens que pode ser usado em sua loja

Dessa forma o módulo deve escolher a embalagem que deve adequar os devidos produtos no processo de compra

Como só tem 1 registro associado a Jamef que seria o registro 

"Caixa de Encomenda Genérica: Tipo 1, Dimensões (LxCxA): 14 x 18 x 9 cm, PesoMax: 10 kg, Preço: R$ 3,50"

Pode ser exibido o retorno

"Dimensões (LxCxA): 49 x 49 x 8 cm | Peso = 9.9 kg não há embalagem associada a essa modalidade de frete ou embalagem compatível para atender as dimensões / peso desse produto"

Para ser processado essa consulta do valor de frete você deve cadastrar uma embalagem para atender essa dimensão e a mesma deve atender qualquer produto com dimensões abaixo dessa embalagem

Então se cadastramos uma embalagem com dimensões "(LxCxA): 50 x 50 x 10 cm" essa embalagem deve atender esse produto e pode ser distribuído nessa mesma embalagem diversos outros produtos

## Instalação - Atualização - Desinstalação - Desativação

--

Este módulo destina-se a ser instalado usando o [Composer][getcomposer]

Execute o seguinte comando no terminal, para visualizar a existencia do Composer e sua versão

	composer --version

Caso não tenha o Composer em seu ambiente, sugiro ler o seguinte artigo [Clique aqui][artigo-composer]

--

É necessário que o servidor tenha o suporte a extensão [ionCube PHP Loader][ioncube-loader]

Para visualizar se essa extensão está ativa em seu servidor

Certique se da presença do arquivo phpinfo.php na raiz do seu projeto

	<?php phpinfo(); ?>

Caso não exista o arquivo phpinfo.php na raiz do projeto Magento, crie o mesmo adicionado o conteúdo acima

Acesse o arquivo pelo browser

Em seguida pesquise pelo termo "ionCube PHP Loader"

Caso o seu servidor não tenha o suporte a extensão, [Clique aqui][ioncube-loader]

Em "Loader Downloads API", efetue download do pacote compatível com o seu servidor

Descompacte o pacote e faça upload do arquivo "loader-wizard.php" para seu servidor, onde será demonstrado o passo a passo para a ativação da extensão

[Clique aqui](https://youtu.be/GZ2J6MLkko4) para ver os processos executados

--

Para utilizar o(s) módulo(s) da MOZG é necessário aceitar o [Acordo de licença do usuário final][acordo]

--

Sugiro manter um ambiente de testes para efeito de testes e somente após os devidos testes aplicar os devidos procedimento no ambiente de produção

--

Sugiro efetuar backup da plataforma Magento e do banco de dados

--

Antes de efetuar qualquer atualização no Magento sempre mantenha o Compiler e o Cache desativado

--

Certique se da presença do arquivo composer.json na raiz do seu projeto Magento e que o mesmo tenha os parâmetros semelhantes ao modelo JSON abaixo

	{
	  "minimum-stability": "dev",
	  "prefer-stable": true,
	  "license": [
	    "proprietary"
	  ],
	  "repositories": [
	    {
	      "type": "composer",
	      "url": "https?://packages.firegento.com"
	    }
	  ],
	  "extra": {
	    "magento-root-dir": "./",
	    "magento-deploystrategy": "copy",
	    "magento-force": true
	  }
	}

Caso não exista o arquivo composer.json na raiz do projeto Magento, crie o mesmo adicionado o conteúdo acima

### Para instalar o módulo execute o comando a seguir no terminal do seu servidor no diretório do seu projeto

	composer require mozgbrasil/magento-boxpacker-php56:dev-master

Você pode verificar se o módulo está instalado, indo ao backend em:

	STORES -> Configuration -> ADVANCED/Advanced -> Disable Modules Output

--

### Para atualizar o módulo execute o comando a seguir no terminal do seu servidor no diretório do seu projeto

Antes de efetuar qualquer processo que envolva atualização no Magento é recomendado manter o Compiler e Cache desativado

	composer clear-cache && composer update

Na ocorrência de erro, renomeie a pasta /vendor/mozgbrasil e execute novamente

Para checar a data do módulo execute o seguinte comando

	grep -ri --include=*.json 'time": "' ./vendor/mozgbrasil

--

### Para [desinstalar][uninstall-mods] o módulo execute o comando a seguir no terminal do seu servidor no diretório do seu projeto

	composer remove mozgbrasil/magento-boxpacker-php56 && composer clear-cache && composer update

--

### Para desativar o módulo

1. Antes de efetuar qualquer processo que envolva atualização sobre o Magento é necessário manter o Compiler e Cache desativado

2. Caso queira desativar os módulos da MOZG renomeie a seguinte pasta app/code/local/Mozg

A desativação do módulo pode ser usado para detectar se determinada ocorrência tem relação com o módulo

## Como configurar o método

Você terá os campos a seguir

### • **Ativar**

Para "ativar" ou "desativar" o uso do registro

### • **Descrição**

Indentificação da embalagem

### • **Largura exterior**

Largura exterior em centímetros

Para a medida de 1 milímetro, informe ".01" onde deve ser convertido pelo Magento para "0.0100"

Para a medida de 1 centimetro, informe "1" onde deve ser convertido pelo Magento para "1.0000"

Para a medida de 1 metro, informe "100" onde deve ser convertido pelo Magento para "100.0000"  

### • **Comprimento exterior**

Comprimento exterior em centímetros

### • **Altura exterior**

Altura exterior em centímetros

### • **Largura Interior**

Largura interna em centímetros

### • **Comprimento Interior**

Comprimento interno em centímetros

### • **Altura Interior**

Altura interior em centímetros

### • **Peso da embalagem vazia**

Peso da embalagem vazia em Kilos

Para um peso de 8 gramas, informe ".008" onde deve ser convertido pelo Magento para "0.0080"

Para um peso de 80 gramas, informe ".08" onde deve ser convertido pelo Magento para "0.0800"

Para um peso de 800 gramas, informe ".8" onde deve ser convertido pelo Magento para "0.8000"

Para um peso de 1 kilo, informe "1" onde deve ser convertido pelo Magento para "1.0000"

### • **Peso máximo**

Peso máximo suportado pela embalagem

### • **Preço**

Preço da embalagem

### • **Comentário**

Comentário

### • **Método de entrega**

Selecione o método de entrega que está relacionado a embalagem, a não seleção deve atender todos os métodos de entrega

## Perguntas mais frequentes "FAQ"

### Quais os atributos criados que devem ser usado pelos método de entrega?

No processo de instalação do módulo é criado os seguintes atributos de Produto:

ship_separately = Embalar o produto separadamente  
ship_width = Largura da embalagem do produto (cm)  
ship_length = Comprimento da embalagem do produto (cm)  
ship_height = Altura da embalagem do produto (cm)

	SELECT * FROM `eav_attribute` WHERE `attribute_code` like 'ship_%' 

Os atributos relativo a "Comprimento, Largura, Altura" são parâmetros necessários para acomodação dos itens nas embalagens, podendo ser utilizado para envio ao WebService e também ao calculo do peso cúbico, portanto sugiro editar cada produto informando suas medidas

### Sobre a utilização de atributo existente

Em nossos métodos de entrega é possivel definir o nome do atributo relativo a dimensão do produto

No uso do módulo Pedroteixeira_Correios

Vemos que os atributos relativos a dimensão estão nomeados como "volume_comprimento, volume_altura, volume_largura" aceitando somente números inteiros

https://github.com/pedro-teixeira/correios/blob/master/app/code/community/PedroTeixeira/Correios/sql/pedroteixeira_correios_setup/install-4.0.0.php#L28

### Quais as embalagens pré-cadastradas ?

O módulo contem as seguintes embalagens pré-cadastradas, caso queira desative as mesmas e cadastre novas embalagens

http://www.correios.com.br/para-voce/envio/embalagens-para-envios

http://www.jadlog.com.br/tamanhos.html

### Links úteis

http://www2.correios.com.br/sistemas/precosPrazos/

http://shopping.correios.com.br/wbm/store/script/wbm2400902p01.aspx?cd_company=ErZW8Dm9i54=&cd_department=R9kapHuB0uA=

http://criativaembalagens.com.br/57_caixas-padrao-correio_correios--e-comerce_28

http://blog.elo7.com.br/negocio-criativo/guia-completo-para-enviar-produtos-pelos-correios.html

## Contribuintes

Equipe Mozg

## License

[Comercial License](LICENSE.txt)

## Badges

[![Join the chat at https://gitter.im/mozgbrasil](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/mozgbrasil/)
[![Latest Stable Version](https://poser.pugx.org/mozgbrasil/magento-boxpacker-php56/v/stable)](https://packagist.org/packages/mozgbrasil/magento-boxpacker-php56)
[![Total Downloads](https://poser.pugx.org/mozgbrasil/magento-boxpacker-php56/downloads)](https://packagist.org/packages/mozgbrasil/magento-boxpacker-php56)
[![Latest Unstable Version](https://poser.pugx.org/mozgbrasil/magento-boxpacker-php56/v/unstable)](https://packagist.org/packages/mozgbrasil/magento-boxpacker-php56)
[![License](https://poser.pugx.org/mozgbrasil/magento-boxpacker-php56/license)](https://packagist.org/packages/mozgbrasil/magento-boxpacker-php56)
[![Monthly Downloads](https://poser.pugx.org/mozgbrasil/magento-boxpacker-php56/d/monthly)](https://packagist.org/packages/mozgbrasil/magento-boxpacker-php56)
[![Daily Downloads](https://poser.pugx.org/mozgbrasil/magento-boxpacker-php56/d/daily)](https://packagist.org/packages/mozgbrasil/magento-boxpacker-php56)
[![Reference Status](https://www.versioneye.com/php/mozgbrasil:magento-boxpacker-php56/reference_badge.svg?style=flat-square)](https://www.versioneye.com/php/mozgbrasil:magento-boxpacker-php56/references)
[![Dependency Status](https://www.versioneye.com/php/mozgbrasil:magento-boxpacker-php56/1.0.0/badge?style=flat-square)](https://www.versioneye.com/php/mozgbrasil:magento-boxpacker-php56/1.0.0)

:cat2:
