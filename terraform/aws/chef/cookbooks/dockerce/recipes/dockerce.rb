yum_repository 'docker-ce-stable' do
    baseurl 'https://download.docker.com/linux/centos/7/$basearch/stable'
    enabled true
    gpgcheck true
    gpgkey 'https://download.docker.com/linux/centos/gpg'
end

package 'docker-ce'

group 'docker' do
  action :modify
  members node['dockerce']['dockerce']['user']
  append true
end

service 'docker' do
    action :start
end
