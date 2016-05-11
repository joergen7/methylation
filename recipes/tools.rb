# coding: utf-8
#
# Cookbook Name:: methylation
# Recipe:: tools
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

include_recipe "chef-bioinf-worker::sherman"
include_recipe "chef-bioinf-worker::trimgalore"
include_recipe "chef-bioinf-worker::bismark"
include_recipe "chef-bioinf-worker::bsseq"
include_recipe "chef-bioinf-worker::fastqc"
