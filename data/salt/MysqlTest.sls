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
{% for user, info in pillar.get('users', {}).items() %}
{{ user }}:
    mysql_user.present:
        - host: localhost
        - password: {{ info[0] }}
{% endfor %}

createDatabase:
    mysql_database.present:
        - name: mainDB

{% for user, info in pillar.get('users', {}).items() %}
{{ user }}_DbGrants:
    mysql_grants.present:
        - grant: {{ info[1] }}
        - database: mainDB.*
        - user: {{ user }}
{% endfor %}