===============================================================================
===============================================================================
PLEASE UPDATE YOUR service-ansible-playbook.yaml or httpd-ansible-playbook.yaml 
and vars-ansible.yaml Files Using The Directives and Updated Copies Bellow. 
- You Only Have To Update The httpd-ansible-playbook.yaml/service-ansible-playbook.yaml 
and Add The Bellow Line Of Code.

  vars_files:  # THIS OBJECT WAS MISSED, MAKE SURE TO ADD IT FOR IT TO WORK
    - /home/ansible/playbooks/variables-ansible/vars-ansible.yaml
===============================================================================
HERE'S YOUR service-ansible-playbook.yaml
===============================================================================
---
 - name: setting up services on webservers
   hosts: "{{ hosts }}"
   become: "{{ become }}"
   vars_files:
     - /home/ansible/playbooks/variables-ansible/vars-ansible.yaml
   # MAKE SURE YOU ADD THE vars_files and provide your VARIABLE FILE PATH Then only will it work
   # You must provide the PATH to your VARS file as DECLARED ABOVE.
   # That's the Declarative Syntax For Ansible Variable Files (Declared seperately from the main playbooks)
   tasks:
   - name: "{{ tasks1_name }}"
     yum:
       name: "{{ service_name1 }}"
       state: "{{ state1 }}"
   - name: "{{ tasks2_name }}"
     service:
       name: "{{ service_name2 }}"
       state: "{{ state2 }}"

===============================================================================
HERE'S YOUR VARIABLE FILE (vars-ansible.yaml)
===============================================================================
---
hosts: webservers
become: yes
service_name1: nginx
tasks1_name: installing nginx
state1: present
tasks2_name: restarting nginx
state2: restarted
service_name2: nginx

===============================================================================
EXECURION COMMANDS: 
- ansible-playbook service-ansible-playbook.yaml --syntax-check
- ansible-playbook service-ansible-playbook.yaml  (Do Not Add The Variable File
because you already defined the PATH in service-ansible-playbook.yaml)
- NOTE: Your Variable File Might Not Pass Syntax Check (BUT IT'S TOTALLY FINE)
- IT SHOULD SUCCEED NOW!!
===============================================================================