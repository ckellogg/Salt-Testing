#include: 
#    - InstallWget
# getMysqlRpm:   
#     cmd.run:
#         - names: 
#             - 'wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm'
#             - 'rpm -ivh mysql57-community-release-el7-9.noarch.rpm'

installMysql:
    pkg.installed:
        - pkgs:
            - mariadb-server
            - MySQL-python
    service.running:
        - name: mariadb

#creating Users for mysql
{% for user, pass in pillar.get('users', {}).items() %}
{{user}}:
    mysql_user.present:
        - host: localhost
        - password: {{pass}}
{% endfor %}