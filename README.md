# Differential and non-differential methylation analyses

Effectively and reliably uncovering complex differential methylation patterns between e.g. cancerous and non-cancerous tissue remains challenging. A plethora of tools has been developed, used and partially being rendered legacy. Here we show the updated version of the highly cited Merman legacy algorithm [Hansen et al. 2011](http://www.nature.com/ng/journal/v43/n8/full/ng.865.html) for differential methylation analysis with the state-of-the-art tool Bismark in combination with the sophisticated Bsseq R statistics.

Hansen et al. 2011 Merman workflow has been implemented with slight variation as described in
[Hansen et al. 2012](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3491411/).
The developed Cuneiform workflow consists of various tools, algorithms and scripts, ranging from raw read trimming to the high-level final statistical analyses  to identifies differentially DNA-methylated regions (cDMRs) by comparing multiple control sample to multiple case samples.

The input for this workflow are whole-genome bisulfite sequencing reads in FastQ
format. Instead of using the original data from the study we create a pair of
methylation samples using Sherman on chromosome 22. Reduced Representation Bisulfile Sequencing (RRBS) reads Base-Space (BS) and Abi Solid Bisulfite Color-Space (CS) sequencing technology is support. Note, that Abi Solid data is re-written to BS prior to  analysis. 

Trim Galore is used to account for Illumina Reduced Representation Bisulfite
Sequencing representation input FastQ data. Since the read mapper used in
the original study, Merman, has stopped being supported read mapping is
performed using Bismark and Bowtie2 instead. Coverage information and BED graphs
are also derived using Bismark.

Non differential methylation analyses can be performed by simply de-multiplexing the R-Script analysis after smoothing.

From the SAM alignment files output by Bismark, sorted, indexed BAM files are
created to be used in genome browsers like IGV.

The coverage information is used to create a report in PDF format using Bsmooth.

The
[workflow](https://github.com/joergen7/methylation/blob/master/templates/default/methylation.cf.erb)
is specified using the
[Cuneiform](https://github.com/joergen7/cuneiform) functional workflow language.

This repository has the form of a Chef cookbook to ensure reproducibility of the
workflow itself as well as data and tools.


## Prerequisites

Install the following packages:

- [git](https://git-scm.com/)
- [Chef Development Kit](https://downloads.chef.io/chef-dk/)

If you want to set up a VM to test Cuneiform these additional packages are required:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)


Under Ubuntu you can install the ChefDK by entering on the command line

    sudo dpkg -i chefdk_*.deb


## Building a VM with kitchen

This section describes how to set up the workflow environment in a Virtual
Machine (VM). To do this, it does not matter whether you are running Linux,
Mac OS, or Windows. However, if you are running an Ubuntu and want to set up
the workflow locally (without creating a VM), see Section Building locally.

To build a VM from this cookbook for the first time, change your git
base directory and enter the following:

    git clone https://github.com/joergen7/methylation.git
    cd methylation
    kitchen converge
    
You can log into the newly built VM by entering

    kitchen login
    
You can drop the VM by entering

    kitchen destroy

## Building locally

This section describes how to set up this workflow locally without the indirection
of a VM. If you want to try out this workflow in a VM first see Section Building a VM with kitchen.

To install this cookbook locally, create a directory "cookbooks", clone the cookbook
into it and run the chef client:

    mkdir cookbooks
    cd cookbooks
    git clone https://github.com/joergen7/methylation.git
    cd methylation
    berks vendor ..
    cd ../..
    sudo chef-client -z -r "methylation::default"
    
## Running the Workflow

If you installed the workflow on a VM log into the machine by typing

    kitchen login
    
Execute the workflow script by entering

    cuneiform -w /opt/data /opt/wf/methylation.cf
    
