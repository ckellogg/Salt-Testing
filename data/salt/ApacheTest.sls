installApache:
    pkg.installed:
        - name: httpd
    service.running:
        - name: httpd
        - watch:
            - file: /etc/httpd/conf.d/welcome.conf
            - pkg: installApache

changeWelcomePage:
    file.managed:
        - source: salt://NewPage.html
        - name: /usr/share/httpd/noindex/test.html
        - user: root
        - group: root
        - mode: 644

changeWelcomeLocation:
    file.line:
        - name: /etc/httpd/conf.d/welcome.conf
        - match: "Alias /.noindex.html*"
        - mode: replace
        - content: Alias /.noindex.html /usr/share/httpd/noindex/test.html
