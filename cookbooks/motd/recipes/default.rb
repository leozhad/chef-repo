#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "motd.tail" do
  source "motd.tail.erb"
  owner "root"
  group "root"
  mode 0644
end
