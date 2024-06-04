
import re


rule bwamap:
    input:
        get_fastq,
        config['ref']['genome']
    output:
        "mapping/{sample}/{sample}.txt"
    shell:
        """
        echo {input} > {output}
        """
