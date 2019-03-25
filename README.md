# Trabalho Devops - Fiap 17CLD - CHEF

### link do github: https://github.com/Tdalmeida/Trabalho-Fiap---17CLD

## Copiando o Cookbook para o ChefServer
 #### Acesse o diretório dos cookbooks no ChefServer
  cd ~/chef-repo/cookbooks
 #### Execute o Git Clone 
    $ git clone https://github.com/Tdalmeida/Trabalho-Fiap---17CLD 
 #### Acesse a pasta criada pelo Git
    $ cd Trabalho-Fiap---17CLD
 #### Copie o diretório markpub-web
    $ cp -r markpub-web ../../cookbooks
 #### Execute os comandos abaixo para que o Cookbook fique disponível no ChefServer   
    $ knife ssl fetch
    $ knife cookbook upload markpub-web

#### Adicionando cookbooks ao runlist do mode

    $ knife node run_list add <nome do node> 'recipe[markpub-web::default]'

  #### Acessse o Chef Client
    $ ssh <usuário do chef client>@<ip do chef client>
  #### Execute o chefclient para aplicar o Cookbook
    $ sudo chef-client

## Informações para o acesso do CTO
usuário: bruno

senha: Zaq12wsX

port: 3350

## Endereços dos servidores
markpub.dev.com.br

markpub.hom.com.br

markpub.prod.com.br

### Configurando o hosts para validar os sites

Caso o computador seja windows, inclua as linhas em C:/Windows/system32/drivers/etc/hosts

Caso o computador seja Linux inclua as linhas em /etc/hosts

#### ip do servidor client  markpub.dev.com.br 
#### ip do servidor client  markpub.hom.com.br 
#### ip do servidor client  markpub.prod.com.br 

### OBS: A "empresa Markpub" foi criada em um dos primeiros trabalhos do grupo e o nome foi mantido nos demais trabalhos.

