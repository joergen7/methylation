# methylation

A methylation workflow which reproduces an analysis by
[Hansen et al. 2011](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3145050/) with
slight variation of the methods as described in
[Hansen et al. 2012](http://www.biomedcentral.com/content/pdf/gb-2012-13-10-r83.pdf).





The
[workflow](https://github.com/joergen7/methylation/blob/master/templates/default/methylation.cf.erb)
is specified using the
[Cuneiform](https://github.com/joergen7/cuneiform) functional workflow language.

This repository has the form of a Chef cookbook to ensure reproducibility of the
workflow itself as well as data and tools.


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
    
    

