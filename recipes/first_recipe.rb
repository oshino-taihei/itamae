# firewalld停止,無効化
service 'firewalld' do
  action [:disable, :stop]
end

# SELinux無効化
execute 'disable SELinux' do
  user "root"
  command <<-EOS
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
    setenforce 0
  EOS
end

# Apacheインストール
package 'httpd' do
  action :install
end

# Apache起動、有効化
service 'httpd' do
  action [:enable, :start]
end

# index.html配置
remote_file "/var/www/html/index.html" do
  owner "root"
  group "root"
  source "remote_files/index.html"
end
