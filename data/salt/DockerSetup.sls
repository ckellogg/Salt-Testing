sendDockerCErepo:
    file.managed:
        - source: salt://docker-ce.repo
        - name: /etc/yum.repos.d/docker-ce.repo
        - user: root
        - group: root
        - mode: 644

updateYumClean:
    cmd.wait:
        - name: 'yum clean all'
        - watch: 
            - file: /etc/yum.repos.d/*
installDocker:
    pkg.installed:
        - name: docker-ce
    service.running:
        - name: docker

installPip:
    pkg.installed:
        - name: python2-pip

docker:
    pip.installed
