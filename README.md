# Template for snakemake


### Create a conda env
```
mamba create  -c conda-forge -c bioconda -n templatesnake snakemake=8.12.0
mamba activate templatesnake
mamba install bioconda::bwa-mem2
mamba install bioconda::samtools
pip install snakemake-executor-plugin-slurm
pip install termcolor
```
Once created use simply
```
mamba activate templatesnake
```


### Running the pipeline

First index the genome
```bash
bwa-mem2 index testdata/genome.fa.gz
```
#### Launching snakemake locally
```
snakemake --configfile config.yaml  -p -j 1 -n
```
#### Launching snakemake  on the cluster
```
snakemake --configfile config.yaml --profile genotoul -p -j 1 -n
```
