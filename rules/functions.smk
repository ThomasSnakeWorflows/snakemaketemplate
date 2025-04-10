
import os
import pathlib


WORKLOW_PATH = os.getcwd()

def get_genome(wildcards):
    return get_absolute_path(config['ref']['genome'])


def get_fastq(wildcards):
    """Get fastq files of given sample-unit."""
    fastqs_abspath = []
    fastqs = samples.loc[wildcards.sample, "reads"].split(",")
    for fastq in fastqs:
        fastqs_abspath.append(get_absolute_path(fastq))
    return fastqs_abspath

def get_absolute_path(relative_path):
    return "%s/%s" %(WORKLOW_PATH, relative_path)
