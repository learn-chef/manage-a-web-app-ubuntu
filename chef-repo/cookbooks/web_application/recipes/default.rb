#
# Cookbook Name:: web_application
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'apt::default'
include_recipe 'web_application::user'
include_recipe 'web_application::webserver'
include_recipe 'web_application::database'
