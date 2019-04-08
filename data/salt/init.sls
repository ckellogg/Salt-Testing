installGit:
    pkg.installed:
        - name: git

testGitInstallation:
    cmd.run:
        - name: 'git clone https://github.com/libgit2/libgit2 /home/vagrant/mylibgit'
