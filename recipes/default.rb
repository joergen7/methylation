# coding: utf-8
#
# Cookbook Name:: methylation
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.


include_recipe "chef-cuneiform::default"

include_recipe "methylation::tools"
include_recipe "methylation::workflow"

