#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
  action :install
end

service "httpd" do
  action [:start, :enable]
end

execute "rm -f /etc/httpd/conf.d/welcome.conf" do
  only_if do
    ::File.exist?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :restart, "service[httpd]"
end

cookbook_file "/var/www/html/index.html" do
  source "index.html"
  mode "0644"
end
