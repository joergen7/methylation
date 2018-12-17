#
# Cookbook:: methylation
# Recipe:: trim_galore
#
# Copyright:: 2015-2018 Jörgen Brandt
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

trimgalore_link = "https://github.com/FelixKrueger/TrimGalore/archive/0.5.0.zip"
trimgalore_zip  = "#{node.dir.archive}/#{File.basename( trimgalore_link )}"
trimgalore_dir  = "#{node.dir.software}/trim_galore_zip"



package "unzip"
package "cutadapt"

directory node["dir"]["software"]
directory node["dir"]["archive"]

remote_file trimgalore_zip do
  action :create_if_missing
  source trimgalore_link
  retries 1
end

bash "extract_trimgalore" do
  code "unzip -o #{trimgalore_zip} -d #{node["dir"]["software"]}"
  not_if "#{Dir.exists?( "#{trimgalore_dir}" )}"
end

link "#{node["dir"]["bin"]}/trim_galore" do
  to "#{trimgalore_dir}/trim_galore"
end


