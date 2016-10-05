# /etc/hosts配置
remote_file "/etc/hosts" do
  owner "root"
  group "root"
  source "remote_files/hosts"
end

# /root/.ssh/authorized_keys配置
remote_file "/root/.ssh/authorized_key" do
  owner "root"
  group "root"
  mode "600"
  source "remote_files/authorized_keys"
end

