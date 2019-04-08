include:
    - CreateDirectory

sendFile:
    file.managed:
        - source: salt://testFile.txt
        - name: /root/mylibgit/testFile.txt
        - user: root
        - group: root
        - mode: 777
        - require:
            - sls: CreateDirectory

