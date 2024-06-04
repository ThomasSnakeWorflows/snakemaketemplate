import sys
import pandas as pd

# Modules
include: "rules/functions.smk"
include: "rules/mapping.smk"


samples = pd.read_table(config["samples"],
                        dtype={"sample": str}).set_index("sample", drop=False)


workdir: config['workdir']


# Target rules
rule all:
    input:
        expand("mapping/{sample}/{sample}.bai", sample=samples.index)
