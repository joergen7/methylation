#
# Cookbook:: methylation
# Recipe:: sherman
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


sherman_link = "http://www.bioinformatics.babraham.ac.uk/projects/sherman/Sherman_v0.1.8.zip"
sherman_zip  = "#{node.dir.archive}/#{File.basename( sherman_link )}"
sherman_dir  = "#{node.dir.software}/Sherman_v0.1.8"


package "unzip"

directory node["dir"]["software"]
directory node["dir"]["archive"]
directory sherman_dir

remote_file sherman_zip do
    action :create_if_missing
    source sherman_link
    retries 1
end

bash "extract_sherman" do
    code "unzip -o #{sherman_zip} -d #{sherman_dir}"
    not_if "#{File.exists?( "#{sherman_dir}/Sherman" )}"
end

link "#{node["dir"]["bin"]}/Sherman" do
  to "#{sherman_dir}/Sherman"
end


