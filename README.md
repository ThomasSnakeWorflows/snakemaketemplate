# Template snakemake


### Create a conda env
```
mamba create  -c conda-forge -c bioconda -n templatesnake snakemake=8.12.0
mamba activate templatesnake
mamba install ...
pip install snakemake-executor-plugin-slurm
```
Once created use simply
```
mamba activate templatesnake
```


### Running the pipeline
#### locally
```
snakemake --configfile config.yaml  -p -j 1 -n
```
#### on the cluster
```
snakemake --configfile config.yaml --profile genotoul -p -j 1 -n
```
