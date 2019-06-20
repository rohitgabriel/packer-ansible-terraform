---
- hosts: gitlab
  become: yes
  become_user: root

  vars:
    helloworld: Meow!

  tasks:
    - name: Run install script
        command: EXTERNAL_URL="http://gitlab.tecmint.com" yum install -y gitlab-ce
        register: install_result
      - debug: install_result

    - name: Run configure script
        command: gitlab-ctl reconfigure
        register: configure_result
      - debug: configure_result