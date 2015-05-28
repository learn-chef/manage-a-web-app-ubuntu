#
# Cookbook Name:: awesome_customers
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
puts "!!!"
puts "#{node['apache']['mpm']}"
puts "!!!"
include_recipe 'apt::default'
include_recipe 'awesome_customers::user'
include_recipe 'awesome_customers::webserver2'
include_recipe 'awesome_customers::database'
