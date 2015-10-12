# methylation
A methylation workflow


## Prerequisites

Install the following packages:

- virtualbox
- vagrant

The Chef DK can be downloaded from the [Chef download page](https://downloads.chef.io/chef-dk/).
To install it enter on the command line

    sudo dpkg -i chefdk_*.deb


## Initialize host machine

To build the VM specified in this cookbook for the first time, change your git
base directory and enter the following:

    git clone https://github.com/joergen7/methylation.git
    cd methylation
    berks install
    kitchen converge
    
You can log into the newly built VM by entering

    kitchen login
    
You can drop the VM by entering

    kitchen destroy


## Workflow Location

The Cuneiform workflow can be found in the cookbook under

    cookbooks/methylation/templates/default/methylation.cf.erb
    
and on the test machine under

    /opt/wf/methylation.cf

    
## Workflow execution

Log into the test machine by typing

    kitchen login
    
Now, execute the workflow script by entering

    cuneiform -w /opt/data /opt/wf/methylation.cf
    
    
## Synchronizing with the remote repository

To synchronize your local repository with the remote version at Github change to
the cookbook directory and enter

    git pull
    berks update
    kitchen converge
    
If you have doubts whether the VM is still in a usable state you can destroy it
before converging.
    
    
## Share your changes

To make your changes public, you need to merge your changes to with the remote
repository. Do so by changing to the cookbook directory and entering:

    git add --all
    git commit
    git push
