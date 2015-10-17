#
# Cookbook Name:: methylation
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

include_recipe "chef-bioinf-worker::hg19"
include_recipe "chef-bioinf-worker::sherman"
include_recipe "chef-bioinf-worker::trimgalore"
include_recipe "chef-bioinf-worker::bismark"
include_recipe "chef-bioinf-worker::bsseq"
include_recipe "chef-cuneiform::default"

directory node.dir.wf

# place workflow
template "#{node.dir.wf}/methylation.cf" do
  source "methylation.cf.erb"
end


