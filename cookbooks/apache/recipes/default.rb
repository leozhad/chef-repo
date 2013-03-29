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

file "/etc/httpd/conf.d/welcome.conf" do
  action :delete
  notifies :restart, "service[httpd]"
end

node['apache']['site'].each do |site_name, site_data|
  document_root = "/var/www/vhosts/#{site_name}"

  directory "#{document_root}" do
    owner "root"
    group "root"
    mode 0755
    action :create
    recursive true
  end

  directory "/etc/httpd/vhosts" do
    owner "root"
    group "root"
    mode 0755
    action :create
    recursive true
  end

  template "/etc/httpd/vhosts/#{site_name}" do
    source "custom.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => site_data['port']
      )

    notifies :restart, "service[httpd]"
  end

  template "#{document_root}/index.html" do
    source "index.html.erb"
    variables(
      :site_name => site_name,
      :port => site_data['port']
      )
    mode 0644
  end
end

cookbook_file "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf"
  mode "0644"
end