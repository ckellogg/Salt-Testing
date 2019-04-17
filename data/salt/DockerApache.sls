include: 
    - DockerSetup

installVim:
    pkg.installed:
        - name: vim-common

selinux_packages:
  pkg.installed:
    - names:
       - libsemanage
       - setools-console
       - setroubleshoot-server
       - policycoreutils-python

installApache:
    docker_image.present:
        - name: kelloggc/my-apache2
        - tag: latest

createFolder:
    file.directory:
        - makedirs: True
        - name: /http/files

sendFile:
    file.managed:
        - source: salt://NewPage.html
        - name: /http/files/index.html
        - user: root
        - group: root
        - mode: 644

dockerRunning:
    docker_container.running:
        - image: kelloggc/my-apache2
        - name: saltApache
        - ports: 80
        - port_bindings: 4000:80
        - binds: /http/files/:/var/www/html/
        # - working_dir: /var/log/nginx



