#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "vim-enhanced" do
     action :install
end
service "iptables" do
      action [:stop, :disable]
end

%w{php php-common php-mbstring php-xml php-devel php-process php-cli php-pear php-mysql mysql-server httpd}.each do |p|
      package p do
                action :install
                    end
end

# apacheの起動 CentOSの場合
 service "httpd" do
     action [:start, :enable]
     end
 template "/var/www/html/index.html" do
     source "index.html.erb"
     mode 0644
 end
 template "httpd.conf" do
       path "/etc/httpd/conf/httpd.conf"
           source "httpd.conf.erb"
               mode 0644
               notifies :restart, 'service[httpd]'

 end
