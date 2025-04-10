
import os
import pandas as pd

# Modules
include: "rules/functions.smk"
include: "rules/mapping.smk"

genome_abspath = get_absolute_path(config["ref"]["genome"])
if not bwa_mem2_index_exists(genome_abspath):
    print_error_exit("%s is not bwa-indexed" % config["ref"]["genome"])


sample_file =  get_absolute_path(config["samples"])
samples = pd.read_table(sample_file,
                        dtype={"sample": str}).set_index("sample", drop=False)

workingdir = "%s/%s" % (workflow.basedir, config['workdir'])
 
workdir: workingdir

# Target rules
rule all:
    input:
        expand("mapping/{sample}.bam", sample=samples.index)
