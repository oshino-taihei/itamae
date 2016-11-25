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
  source "remote_files/etc/cloud/cloud.cfg"
end

### SELinux無効化 ###
# SELinuxが有効ならば無効化
execute "[ $(getenforce) != Disabled ] && setenforce 0 || echo Nothing to do"

# SELinux無効化設定永続化(変更後は手動でOS再起動)
remote_file "/etc/selinux/config" do
  owner "root"
  group "root"
  source "remote_files/etc/selinux/config"
end

### パスワードなしssh ###
# /root/.ssh/authorized_keys配置
remote_file "/root/.ssh/authorized_keys" do
  owner "root"
  group "root"
  mode "600"
  source "remote_files/authorized_keys"
end

### カーネルパラメータ変更 ###
remote_file "/etc/sysctl.conf" do
  owner "root"
  group "root"
  source "remote_files/etc/sysctl.conf"
end
execute "sysctl -p"

