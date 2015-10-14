#
# Cookbook Name:: methylation
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

#include_recipe "chef-bioinf-worker::cutadapt"
#include_recipe "chef-bioinf-worker::fastqc"
#include_recipe "chef-bioinf-worker::bsmooth"
#include_recipe "chef-bioinf-worker::bsseq"
#include_recipe "chef-bioinf-worker::sratools"
#include_recipe "chef-bioinf-worker::shrimp"
#include_recipe "chef-bioinf-worker::pass"
#include_recipe "chef-bioinf-worker::bfast"
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

