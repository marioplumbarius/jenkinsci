#
# Cookbook:: dockerce
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'dockerce::base'
include_recipe 'dockerce::olddocker'
include_recipe 'dockerce::dockerce'
