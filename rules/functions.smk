
import os
import pathlib
from termcolor import cprint

WORKLOW_PATH = workflow.basedir

# Helper functions #####
def print_error_exit(message):
    """ Print soft error message in mangenta and exit """
    cprint("WARNING: " + message + ", exiting softly!", 'magenta',
           attrs=['bold'], file=sys.stderr)
    sys.exit(1)


def bwa_mem2_index_exists(genome):
    return os.path.isfile("%s.bwt.2bit.64" % genome)

def get_genome(wildcards):
    return get_absolute_path(config['ref']['genome'])


def get_fastq(wildcards):
    """Get fastq files of given sample-unit."""
    fastqs_abspath = []
    fastqs = samples.loc[wildcards.sample, "reads"].split(",")
    for fastq in fastqs:
        fastqs_abspath.append(get_absolute_path(fastq))
    return fastqs_abspath

def get_absolute_path(path):
    if os.path.isabs(path):
        return path
    else:
        return "%s/%s" %(WORKLOW_PATH, path)
