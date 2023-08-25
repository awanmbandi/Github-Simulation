## ANSIBLE AND ANSIBLE PLAYBOOKS
=====================================================================

      Configure Environment and pass the below Configurations
=====================================================================

1. We are going to setup/configure httpd(apache) on our webservers, tomcat on appservers and mysql on our dbservers
2. Launch 4 instances using CentOS Image and Configure them using the Runbook in LMS 
   https://docs.google.com/document/d/1dNimYw7oIxZ6wlOI6l_Wzzkm4uZJr0AI75tLVDiFkZ8/edit
    
    - First Instance: ansible-master
    - Second instance: webserver
    - Third instance: appserver
    - Fourth instance: dbserver

3. After setting up the Environment with the above specifications, go ahead and execute the provided plays
- Use the below playbook commands and options 
- Runbook Link: https://docs.google.com/document/d/1dNimYw7oIxZ6wlOI6l_Wzzkm4uZJr0AI75tLVDiFkZ8/edit


## AN ANSIBLE PLAYBOOK CONSIST OF THE FOLLOWING
1) A Task 
2) A Play (A play consit of either a single/multiple Task and a Target)
3) A Playbook
=====================================================================================

### HOW TO VALIDATE AND CHECK FOR SYNTAX ERRORS IN YOUR PLAYBOOK
--> ansible-playbook your-playbook-name --syntax-check  (To Validate Your Playbook Before Running)
You can disrup your Playbook Syntax/Indentation or Misplace any of the KEYS in your Playbook to TEST this out. 
And you'll notice it'll PICK the ERROR in your Playbook)

### HOW TO DO A DRYRUN OF YOUR PLAYBOOKS BEFORE EXECUTION 
(Run the below command. This is Most often useful if you want to check what CHANGES are going to be made after 
the actual EXECUTION of your PLAYBOOKS)

--> ansible-playbook your-playbook-name --check   (This command does a Dryrun of Your Playbooks)
--> systemctl httpd status  (Run this on your Target Nodes and you'll realize the package was not
installed. Because you were just running a CHANGE CHECK. THIS IS VERY USEFUL))
--> ansible-playbook your-playbook-name  (Once you remove the --check, the playbook will now get executed)

### EXECUTE PLAYBOOKS AND GET VERBOSE LOGS (OUTPUT). TO GET ALL NODES ACTIVITIES PERFORMED BY ANSIBLE
--> ansible-playbook your-playbook-name -v or -vv or -vvv or -vvvvvvvvvvv    

(This is called Verbose Output or Verbosity. Very Important in troubleshooting scenarios).
This will GIVE you a detail rundown/output of all the executions perform by ansible in the TARGET NODES, 
from connecting to the specific VM's(nodes), to INSTALLATIONS etc. The more v's the detail your VERBOSE will be LOG)



