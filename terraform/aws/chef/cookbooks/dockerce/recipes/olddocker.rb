PACKAGES = [
    'docker',
    'docker-common',
    'container-selinux',
    'docker-selinux',
    'docker-engine'
]

package PACKAGES do
    action :remove
    not_if 'yum list installed | grep -i docker-ce'
end
