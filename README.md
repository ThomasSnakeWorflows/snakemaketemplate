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
