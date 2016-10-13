require 'rake'
require 'yaml'

node_yamls = Dir.glob("#{__dir__}/nodes/cdh5/*.yaml")
node_yamls.each do |y|
  node = File.basename(y, '.*')
  cmd = "itamae ssh -u root -h db1 -y nodes/cdh5/#{node}.yaml recipes/cdh5/os_config.rb"
  desc cmd
  task node do
    sh cmd
  end
end
