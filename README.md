# Differential and non-differential methylation analyses

Effectively and reliably uncovering complex differential methylation patterns between e.g. cancerous and non-cancerous tissue remains challenging. A plethora of tools has been developed, used and partially being rendered legacy. Here we show the updated version of the highly cited Merman legacy algorithm [Hansen et al. 2011](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3491411/) for differential methylation analysis with the state-of-the-art tool Bismark in combination with the sophisticated Bsseq R statistics.

Hansen et al. 2010 Merman workflow has been implemented with slight variation as described in
[Hansen et al. 2012](http://www.biomedcentral.com/content/pdf/gb-2012-13-10-r83.pdf).
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
    
    

