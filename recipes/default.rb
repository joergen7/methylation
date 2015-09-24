#
# Cookbook Name:: methylation
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

directory node.dir.wf

# place workflow
template "#{node.dir.wf}/methylation.cf" do
  source "methylation.cf.erb"
end

