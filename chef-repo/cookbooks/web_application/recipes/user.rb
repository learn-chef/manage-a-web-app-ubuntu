#
# Cookbook Name:: web_application
# Recipe:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
group node['web_application']['group']

user node['web_application']['user'] do
  group node['web_application']['group']
  system true
  shell '/bin/bash'
end
