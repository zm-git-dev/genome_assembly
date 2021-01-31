<h1 align="center"><strong>Whole Genome Assembly and Annotation of Northern Wild Rice (<em>Zizania palustris</em> L.), a North American Grain Reveals a Whole Genome Duplication Event within the Species</strong></h1>

This repository supports the work that went into characterizing the Northern Wild Rice (_Zizania palustris_ L.) genome.

Once the manuscript is posted to bioRxiv, that link will be available here.
Upon publication, that link will be shared as well.

There are no scripts for the genome assembly itself because that work was performed by [Dovetail Genomics](https://dovetailgenomics.com). The genome has been deposited at the United States [National Center for Biotechnology Information (NCBI)](https://www.ncbi.nlm.nih.gov/bioproject) under BioProject number PRJNA600525. The annotation work was carried out by Marissa Macchietto and Thomas Kono and those scripts can be found [here]().

Please use the directory to navigate this README to find the scripts for a particular analysis or figure with ease. This README is best viewed in Light Mode.

## Directory
1. [Figure 1](#Figure-1)
2. [Figure 2](#Figure-2)
3. [Figure 3](#Figure-3)
4. [Supporting Figure S1](#Supporting-Figure-S1)
5. [Supporting Figure S2](#Supporting-Figure-S2)
6. [Supporting Figure S3](#Supporting-Figure-S3)
7. [Supporting Figure S4](#Supporting-Figure-S4)
8. [Supporting Figure S5](#Supporting-Figure-S5)
9. [Supporting Figure S6](#Supporting-Figure-S6)
10. [Supporting Figure S7](#Supporting-Figure-S7)
11. [Supporting Figure S8](#Supporting-Figure-S8)
12. [Supporting Figure S9](#Supporting-Figure-S9)
13. [Supporting Figure S10](#Supporting-Figure-S10)
14. [Supporting Figure S11](#Supporting-Figure-S11)
15. [Supporting Figure S12](#Supporting-Figure-S12)
16. [Supporting Figure S13](#Supporting-Figure-S13)
17. [Supporting Figure S14](#Supporting-Figure-S14)
18. [Other scripts](#Other-scripts)

# Figure 1
## run_repeat_circos.sh
This script generated the [Circos](http://circos.ca) plot shown in Figure 1. The figure shows the genome-wide distribution of genes and repetitive elements. The legend was added in PowerPoint. This shell script [run_main_circos.sh](circos/run_main_circos.sh) is used in conjunction with the Circos configuration file which you can find [here](circos/repeat_specific_circos.conf).

<img src="images/Figure_1_circos_plot.png" width="500">

# Figure 2
## Figure 2A
This figure shows the phylogenetic relationship between 20 species used in the initial OrthoFinder analysis. The data to make the tree comes from OrthoFinder and the tree was created using [Dendroscope](https://uni-tuebingen.de/fakultaeten/mathematisch-naturwissenschaftliche-fakultaet/fachbereiche/informatik/lehrstuehle/algorithms-in-bioinformatics/software/dendroscope/). Divergence times from OrthoFinder were added manually and are in units of million years ago (MYA).

<img src="images/Figure_2A_with_divergence_times.png" width="500">

Related to this figure, we estimated the divergence time between _Z. palustris_ and _O. sativa_. To estimate the divergence time, we used the program ```mcmctree``` from [Phylogenetic Analysis by Maximum Liklihood (PAML](http://abacus.gene.ucl.ac.uk/software/paml.html) version 4. The script to do this is [run_paml.sh](run_paml.sh).

## Figure 2B
This figure shows the number of orthogroups in common with (and private to) NWR and four other major grass species (_Oryza sativa_, _Zea mays_, _Sorghum bicolor_, and _Brachypodium distachyon_). The data come from an independent run of OrthoFinder so that the orthogroup counts shown in the figure would only include orthogroup shared by these species and none from the larger set of 20 species shown in the species tree. (**Note:** each orthogroup may contain one or more genes.) The native ```venn.diagram``` function from the [VennDiagram](https://cran.r-project.org/web/packages/VennDiagram/VennDiagram.pdf) package does not use a comma as a separator for the thousands place, so we modified the function and saved the script as [modified_venn_diagram.R](modified_venn_diagram.R) to force the function to use a comma separator. The script used to generate this figure is called [venn_diagram_orthogroups.R](venn_diagram_orthogroups.R). It uses the ```source()``` function to call the modified version of the ```venn.diagram``` function. You must include the [modified_venn_diagram.R](modified_venn_diagram.R) script in your working directory (or give the path to its location) in order for it to function properly.

<img src="images/venn_diagram_figure_2.png" width="500">

# Figure 3
## Figure 3A and Figure 3B
These figures were created using the MCscan program. **Figure 3A** was created using [run_jcvi.sh](run_jcvi.sh) while **Figure 3B** was created using [run_jcvi_with_latifolia.sh](run_jcvi_with_latifolia.sh). I called the program JCVI in the script name rather than MCscan because the scripts are found in a directory called jcvi in the GitHub repository for the MCscan code.

The [karyotype.py](karyotype.py) script was originally written by Haibao Tang and can be found [here](https://github.com/tanghaibao/jcvi/graphics/karyotype.py). I am including the script here because I modified it in order to create my plots.
1. Line 40 was altered so that ```arg[5]``` (the name we assign to each track in the layout file) is printed in italics. 
2. Line 239 was also changed (dividing vpad by 2 was removed) to make extra room on the margin so that _Zizania palustris_ could be fully written out (versus abbreviating it as _Z. palustris_--which also didn't fit initally--it ran into the representations of the chromosomes.

<img src="images/Figure_3A_updated.png" width="500"> <img src="images/Figure_3B_updated.png" width="500">

## Figure 3C
The [synteny.py](synteny.py) script was originally written by Haibao Tang and can be found [here](https://github.com/tanghaibao/jcvi/graphics/synteny.py). I am including the script here because I modified it in order to create my plots.
1. Line 61 was modified so that the species label ```args[7]``` will be printed in italics. 
2. I also added another argument ```args[8]``` so that the chromosome label will not be in italics.

<img src="images/Figure_3C_updated.png" width="500">

This figure shows one of the genes important for shattering called _shattering4_ (_sh4_) in _O. sativa_. _sh4_ is in the center and we opted to plot 10 genes on other side of _sh4_ in _O. sativa_ as well as its putative ortholog in _Z. palustris_. The green/blue colors indicate which strand the gene exists on.

# Supporting Figure S1
The purpose of this code was to add a scale bar to the image of tissues collected for the RNA-seq portion of the study. This work was done in a Jupyter Notebook using Python. The Jupyter Notebook file is [add_scalebar_to_annotation_photo.ipynb](add_scalebar_to_annotation_photo.ipynb). The letters were added in PowerPoint.

<img src="images/Supporting_Figure_S1_RNAseq_tissues_with_scalebar_and_letters.png" width="500">

# Supporting Figure S2
Plots show basic genome assembly statistics

<img src="images/Nx_plot.png" width="500"> <img src="images/cumulative_plot.png" width="500">

# Supporting Figure S3
The script [WR_repeats_karyoplot.R](WR_repeats_karyoplot.R) was used to generate this figure. Y-axis labels were fixed in PowerPoint because we wanted chromosomes 1-15 to have the prefix "Chr" but scaffolds 16 and 458 to have the prefix "Scf" to avoid confusion if they were to have the "Chr" label.

<img src="images/Supporting_Figure_S4_karyotypeR_chr_labels_fixed.png" width="500">

# Supporting Figure S4
This figure came from Tom & Marissa, so we need to find the script that accompanies it. The letters were added in PowerPoint.

<img src="images/Supporting_Figure_S5_repetitive_element_barplots.png" width="500">

# Supporting Figure S5
This combined figure came from multiple R scripts used to parse gene ontology (GO) data and plot the most abundant GO terms. The R scripts used to generate this figure are located in the [gene_ontolgoy](gene_ontology) subdirectory. They include a modified version of the pie chart function. That script ([modified_pie_function.R](gene_ontology/modified_pie_function.R)) must be loaded when using these scripts using the ```source()``` function. You should make sure that the modified version of the script is in your working directory, otherwise it will not work properly.

<img src="images/Supporting_Figure_S6_gene_ontology_plots.png" width="500">

# Supporting Figure S6
This figure is for the tissue specificity work. Figures were combined and letters added in PowerPoint to make the compound figure in the manuscript.

<img src="images/copy_of_tau_density_plot.png" width="500"> <img src="images/reduced_size_copy_of_gene_specificity_barplot.png" width="500"> <img src="images/copy_of_tissue_specificity_heatmap.png" width="500">

# Supporting Figure S7
The point of this figure was to create a secondary version of the venn diagram in Figure 2B using rice relatives instead of major grass species. _O. sativa_ is the exception because, like _Z. palustris_, it is featured in both venn diagrams. _O. glaberrima_ and _O. rufipogon_ were included instead of _O. barthii_ and _O. nivara_ because those pairs of species (_O. glaberrima_ + _O. barthii_ and _O. rufipogon_ + _O. nivara_) are not too distantly related so we get the same evolutionary relationship and we wanted to avoid a more cluttered figure.

Like the venn diagram in Figure 2B, we used the modified ```venn.diagram``` fuction found in the [modified_venn_diagram.R](modified_venn_diagram.R) script to use commas as a thousands separator. The script used to create this figure is called [venn_diagram_orthogroups_with_rice_relatives.R](venn_diagram_orthogroups_with_rice_relatives.R). The script uses the ```source()``` function to call the modified version of the ```venn.diagram``` function. Ensure that the [modified_venn_diagram.R](modified_venn_diagram.R) script is in your working directory (or give the path to its location) in order for it to function properly.

<img src="images/venn_diagram_with_rice_relatives.png" width="500">

We were interested in investigating the types of genes that are unique to _Z. palustris_ so we used the script [get_unique_NWR_genes.py](identify_unique_NWR_genes/get_unique_NWR_genes.py) to extract the gene names based on their orthogroup IDs. The orthogroup IDs were obtained by parsing the Orthogroup.GeneCount.tsv file so that we would get orthogroups for which _O. sativa_, _O. glbarrima_, _O. rufipogon_, and _Z. latifolia_ had a count of "0" while _Z. palustris_ had a count greater than "0". This resulted in 1,731 orthogroup IDs as expected from the venn diagram. Our script [get_unique_NWR_genes.py](identify_unique_NWR_genes/get_unique_NWR_genes.py) uses the text file [NWR_unique_orthogroup_list.txt](identify_unique_NWR_genes/NWR_unique_orthogroup_list.txt) containing these 1,731 orthogroup IDs (one per line) and extracts SeqIDs (using BioPython) from the orthogroup protein ```FASTA``` files located in the OrthoFinder output ```Orthogroup_Sequences``` directory. The output contains 6,624 gene names which are found in [this](identify_unique_NWR_genes/list_of_NWR_unique_genes.txt) file. There is no associated shell script to launch this python script. Instead, I just ran it on the command line. First, I loaded python 3 with the command ```module load python3```. Second, I ran the script with the following command:
```
python get_unique_NWR_genes.py NWR_unique_orthogroup_list.txt list_of_NWR_unique_genes.txt
```

**Note:** the file names for ```sys.argv[1]``` and ```sys.argv[2]``` can really be anything you choose, but since ```sys.argv[1]``` is the input for the python script, it must exist. The file name for ```sys.argv[2]``` is somewhat arbitrary, but it should be meaningful.

# Supporting Figure S8
This figure was created using the [MCscan](https://github.com/tanghaibao/jcvi/wiki/MCscan-(Python-version)#pairwise-synteny-search) program. The script that I ran on the server was [run_jcvi.sh](run_jcvi.sh). I called the program JCVI in the script name rather than MCscan because the scripts are found in a directory called jcvi in the [GitHub repository for the MCscan code](https://github.com/tanghaibao/jcvi/tree/main/jcvi).

The [dotplot.py](dotplot.py) script was originally written by Haibao Tang and can be found [here](https://github.com/tanghaibao/jcvi). I am including the script here because I modified it in order to create my plots. The following changes were made by hard-coding my desired output into the original script: 
1. The font color of the chromosome labels and positions were changed from grey to black
2. The labels for the x and y axes were changed to _Zizania palustris_ and _Oryza sativa_ (respectively) rather than ```wild_rice``` and ```oryza``` (which are the ```BED``` file names)
3. The xlimit was slightly increased (along with the length of chr 15, scf 16, and scf 458 (in order to make the chromosome labels legible).

<img src="images/wild_rice.oryza.filtered.png" width="500">

# Supporting Figure S9
We plotted the counts per million (cpm) data from the tissue-specific expression work to generate this figure using the script [plot_putative_shattering_gene_expression.R](plot_putatitive_shattering_gene_expr.R)

<img src="images/Supporting_Figure_S9_putative_shattering_gene_expr_plots.png" width="500">

# Supporting Figure S10
This figure shows the distribution of synonymous substitution rates and ratios of orthologs between _Z. palustris_ and _O. sativa_; and between _Z. palustris_ and _Z. latifolia_.

<img src="images/synonymous_substitution_value_distribution.png" width="500">  <img src="images/NWR_vs_Osativa_genes_per_block.png" width="500"> <img src="images/NWR_vs_Zlatifolia_genes_per_block.png" width="500">

# Supporting Figure S11
This is the alignment figure for the putative NWR _sh4_ gene to its ortholog in _O. sativa_. The scripts used to perform the alignment are located in [alignment_scripts](alignment_scripts). Briefly, the steps for the alignment were:
1. Identify orthologous protein sequences using OrthoFinder output
2. Use Tom Kono's script [Backtranslate_Orthogroup_TK.py](alignment_scripts/Backtranslate_Orthogroup_TK.py) and ```CDS``` files to convert the amino acid sequence to a nucleotide sequence.
3. Perform alignment using Clustal Omega

The output of this pipeline was a text file, so the text-based alignment file was imported into PowerPoint where colors were added to make the SNPs easier to find and fonts were changed to suit personal preference.

<img src="images/Supporting_Figure_S10_sh4_nucleotides_aligned_labels_updated.png" width="500">

# Supporting Figure S12
This is the alignment figure for the putative NWR _SHAT1_ gene to its ortholog in _O. sativa_. The scripts used to perform the alignment are located in [alignment_scripts](alignment_scripts). Briefly, the steps for the alignment were:
1. Identify orthologous protein sequences using OrthoFinder output
2. Use Tom Kono's script [Backtranslate_Orthogroup_TK.py](alignment_scripts/Backtranslate_Orthogroup_TK.py) and ```CDS``` files to convert the amino acid sequence to a nucleotide sequence.
3. Perform alignment using Clustal Omega

The output of this pipeline was a text file, so the text-based alignment file was imported into PowerPoint where colors were added to make the SNPs easier to find and fonts were changed to suit personal preference.

<img src="images/Supporting_Figure_S12_SHAT1_nucleotides_aligned_labels_updated.png" width="500">

# Supporting Figure S13
We used the script [plot_resistance_gene_distribution.R](plot_resistance_gene_distribution.R) to plot the distribution of disease resistance genes (and related genes) from the predicted function of our annotated genes.

<img src="images/Supporting_Figure_S13_disease_resistance_gene_distr.png" width="500">

# Supporting Figure S14
## run_downsampled_circos.sh
This script generates the Circos plot from the Supporting Figures that features SNP density after downsampling. The legend was added in PowerPoint. This shell script is used in conjunction with the Circos configuration which you can find [here](downsampled_circos.conf). The shell scripts that we used to perform the downsampling can be found [here](downsampling_scripts).

<img src="images/Supporting_Figure_S14_circos_snp_downsampling.png" width="500">

# Other scripts
## find_zizania_specific_duplications.py
This script filters the ```Duplications.tsv``` file created by OrthoFinder to contain _Zizania_-specific duplications. The script was written to retain only genes which were duplicated once. Genes with more than one additional copy were not retained for simplicity.

## make_duplication_bed_files.py
This script was written to take the original ```BED``` files produced by MCscan (```wild_rice.bed``` & ```latifolia.bed```) and filter them (producing new versions) to retain only duplications which were found using OrthoFinder and filtered to contain _Zizania_-specific genes using the script [find_zizania_specific_duplications.py](find_zizania_specific_duplications.py).

We also wanted to identify which genes are unique to _Z. palustris_. From the venn diagram in Figure S7, we know that there are 1,731 orthogroups that are unique to _Z. palustris_. We identified the unique orthogroups by searching the Orthogroups.GeneCount.tsv file from OrthoFinder for Orthogroups that had a count of 0 for all species in the diagram, except for _Z. palustris_ which we required to have a value greater than 0. We used the script [get_unique_NWR_genes.py](identify_unique_NWR_genes/get_unique_NWR_genes.py) to iterate through the list of orthogroups found in the file [NWR_unique_orthogroup_list.txt](identify_unique_NWR_genes/NWR_unique_orthogroup_list.txt) and extract the SeqIDs from the OrthoFinder results (performed only with the rice relatives shown in the venn diagram). The output of this script is in [list_of_NWR_unique_genes.txt](identify_unique_NWR_genes/list_of_NWR_unique_genes.txt) which is a list of 6,624 genes from the original 1,731 orthogroups.
