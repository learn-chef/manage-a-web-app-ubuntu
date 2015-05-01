#
# Cookbook Name:: web_application
# Recipe:: webserver
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# Install Apache and configure its service.
include_recipe 'apache2::default'

# Create and enable our custom site.
web_app node['web_application']['name'] do
  template "#{node['web_application']['config']}.erb"
end

# Create the document root.
directory node['apache']['docroot_dir'] do
  recursive true
end

# Load the secrets file and the encrypted data bag item that holds the database password.
password_secret = Chef::EncryptedDataBagItem.load_secret("#{node['web_application']['passwords']['secret_path']}")
user_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'db_admin', password_secret)

# Write a default home page.
template "#{node['apache']['docroot_dir']}/index.php" do
  source 'index.php.erb'
  mode '0644'
  owner node['web_application']['user']
  group node['web_application']['group']
  variables({
    :database_password => user_password_data_bag_item['password']
  })
end

# Open port 80 to incoming traffic.
firewall_rule 'http' do
  port 80
  protocol :tcp
  action :allow
end

# Install the mod_php5 Apache module.
include_recipe 'apache2::mod_php5'

# Install php5-mysql.
package 'php5-mysql' do
  action :install
  notifies :restart, 'service[apache2]'
end
