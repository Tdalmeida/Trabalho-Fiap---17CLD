#Trabalho Devops - Fiap 17CLD - CHEF

link do github: https://github.com/

## Acesse o servidor chef client


    $ ssh user@ipdoseuservidor


## Copiando o Cookbook no ChefServer

    $ git clone https://github.com/tdalmeida/markpub.git 

    $ cd ~/chef-repo
    $ knife configure -k ~/.chef/suachave.pem -u seuusuario --validation-client-name nome_do_client --validation-key ~/.chef/suachave.pem -s "https://ip_do_seu_server/organizations/markpub" -r ~/chef-repo
    $ echo 'cookbook_path ["~/chef-repo/cookbooks"]' >> ~/.chef/knife.rb
    $ knife ssl fetch
    $ knife upload cookbooks/markpub-web

### Executando knife bootstrap no Chef-Client

    $ knife bootstrap ipdoclient:22 -x root -P senhadoroot -N markpub-web --sudo

### Adicionando cookbooks ao runlist do host

    $ knife node run_list add markpub-web 'recipe[markpub-web::default]'

### Executando o chefclient para aplicar o Cookbook

    $ ssh usuário do chef client @ ip do chef client
    $ sudo chef-client

## Informações para o acesso do CTO
usuário: bruno

senha: Zaq12wsX

port: 3055

## Endereços dos servidores
markpub.dev.com.br

markpub.hom.com.br

markpub.prod.com.br

### Configurando o hosts para validar os sites

Caso o computador seja windows, inclua as linhas em C:/Windows/system32/drivers/etc/hosts

Caso o computador seja Linux inclua as linhas em /etc/hosts

ip do servidor client  markpub.dev.com.br 
ip do servidor client  markpub.hom.com.br 
ip do servidor client  markpub.prod.com.br 

OBS: A "empresa Markpub" foi criada em um dos primeiros trabalhos do grupo e foi mantido nos demais trabalhos.

