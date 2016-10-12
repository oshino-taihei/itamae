### ホスト名変更 ###
# ホスト名変更時は手動でOS再起動
remote_file "/etc/hosts" do
  owner "root"
  group "root"
  source "remote_files/etc/hosts"
end

template "/etc/hostname" do
  owner "root"
  group "root"
  source "templates/etc/hostname.erb"
  variables(hostname: node[:os][:hostname])
end

template "/etc/sysconfig/network" do
  owner "root"
  group "root"
  source "templates/etc/sysconfig/network.erb"
  variables(hostname: node[:os][:hostname])
end

remote_file "/etc/cloud/cloud.cfg" do
  owner "root"
  group "root"
  source "/etc/cloud/cloud.cfg"
end

### パスワードなしssh ###
# /root/.ssh/authorized_keys配置
remote_file "/root/.ssh/authorized_key" do
  owner "root"
  group "root"
  mode "600"
  source "remote_files/authorized_keys"
end

