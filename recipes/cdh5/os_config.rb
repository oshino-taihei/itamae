# /etc/hosts配置
remote_file "/etc/hosts" do
  owner "root"
  group "root"
  source "remote_files/hosts"
end

