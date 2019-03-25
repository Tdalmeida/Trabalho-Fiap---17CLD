#
# Cookbook:: markpub-web
# Recipe:: default
#
#Instalação Apache 

package 'apache2' do
  action :install
end

service 'apache2' do
  action [:enable, :start]
  supports :reload => true
end

# Start e Enable do servico SSH Server
service 'sshd' do
  action [:enable,:start]
  supports :reload => true
end

#Criando o usuário

user "bruno" do
  home "/home/bruno"
  shell "/bin/bash"
  password "$6$Q/7LYXo9$bGULTbyvS1ZbYoiNjSnbf0qKQ/dDZNanQvrfkwVZosKfxAZbX6NNwVZV8KaRZQiOH1kTLS9ykEzhOxbSEwMgT."
  action :create
end

#Criando o diretório home do usuário e alterando a permissão da pasta

directory "home/bruno" do  
 mode 0755
 owner 'bruno'
 group 'bruno'
 recursive true
 action :create
end

#Adicionando o usuário ao grupo sudoers

execute "add-group" do
 command "usermod -a -G sudo bruno"
end
 

#node["markpub-web_final"]["sites"].each do |sitename, data|
#end

#Alterando a porta do SSH

template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  owner 'root'
  mode '0644'
  variables( :port => node['openssh']['server']['port'] )
  notifies :restart, 'service[sshd]'
end

#execute "change-port-ssh" do
#command "sed -i 's/Port 22/Port 3350/g' /etc/ssh/sshd_config"
#end


#Virtual Hosts Files

node["markpub-web_final"]["sites"].each do |sitename, data|
  document_root = "/var/www/html/#{sitename}"

  directory document_root do
    mode "0755"
    recursive true
  end

  template "/etc/apache2/sites-available/#{sitename}.conf" do
    source "virtualhosts.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => data["port"],
      :serveradmin => data["serveradmin"],
      :servername => data["servername"]
    )
    notifies :restart, "service[apache2]"
  end

  execute 'enable-vhosts' do
    command "a2ensite #{sitename}.conf"
    action :run
    notifies :reload, 'service[apache2]'
 end

cookbook_file "/var/www/html/#{sitename}/index.html" do
    source "#{sitename}.html"
    mode "0755"
  end

#execute "restart-ssh" do
#command "service sshd restart"
#end

end






