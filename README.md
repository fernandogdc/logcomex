Esse repositório contém a manipulação de dados do NCM para obtenção das informações dos municípios.

Configurações Necessárias:

+ Instalar Python 3.11.5 pelo `pyenv`
+ Clonar repositório na pasta desejada com o comando: `git clone https://github.com/fernandogdc/logcomex.git`
+ Criar um ambiente do python usando o `pipenv` através do comando `pipenv shell`
+ Instalar os pacotes python necessários com `pipenv install`
+ Baixar os dados enviados e colocar dentro da pasta `./data/01_raw/`
+ Rodar o script `01_import_data.ipynb`. Para isso, você precisará selecionar o `Kernel` do Jupyter Notebook a partir do `Python Environemnt` recém criado, que irá conter o nome da pasta `logcomex`

Código testado em Ubuntu 22.04
