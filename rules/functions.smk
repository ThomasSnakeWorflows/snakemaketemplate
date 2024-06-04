


def get_genome(wildcards):
    return config['ref']['genome']


def get_fastq(wildcards):
    """Get fastq files of given sample-unit."""
    fastqs = samples.loc[wildcards.sample, "reads"].split(",")
    return fastqs
