

rule bwamap:
    input:
        fastqs=get_fastq,
        genome=get_genome
    output:
        "mapping/{sample}.bam"
    log:
        stderr="logs/bwmap/{sample}.log"
    shell:
        """
        bwa-mem2 mem {input.genome} {input.fastqs} -o {output} 2> {log.stderr}
        """
