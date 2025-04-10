
import re


rule bwamap:
    input:
        get_fastq,
        get_genome
    output:
        "mapping/{sample}/{sample}.txt"
    log:
        stderr="logs/bwmap/{sample}.log"
    shell:
        """
        echo {input} > {output} 2> {log.stderr}
        """
