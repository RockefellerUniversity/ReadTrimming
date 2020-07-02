# Read-Trimming

## Scripts 
Our scripts are shared in the /src directory. The entry of the analysis is "Rerun-Analysis.bash", which in turn invokes other shell scripts and Python programs to produce results.

## Data
Our data is shared on
  https://latrobeuni-my.sharepoint.com/:f:/g/personal/yliao_ltu_edu_au/EgBbclblJpFPgcGZO3W-cKkB8XFgFtNbr63B8GfJitaAPQ?e=PvHBq0

## Reproduce the results
You need to download all the scripts and data files for reproducing all the results in the paper. Please save all the data files downloaded from the OneDrive link above into the folder that also contains all the scripts, then run **Rerun-Analysis.bash** using BASH. You need to have the programs listed below installed in your system for running this analysis.

1. [Subread (v1.6.4)](https://sourceforge.net/projects/subread/files/)
2. [Trimmomatic (v0.39)](http://www.usadellab.org/cms/?page=trimmomatic)
3. [Trim Galore (v0.6.2)](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
4. [Python (v3.4.0 or newer)](https://www.python.org/downloads/)
5. [NumPy](https://numpy.org/) and [SciPy](https://www.scipy.org/) for your Python installation
6. [Bash (any modern version should be OK)](https://www.gnu.org/software/bash/)

You may also need some dependent programs (eg [Cutadapt v1.16](https://cutadapt.readthedocs.io/en/v1.16/)) for running Trimmomatic and Trim-galore. Please make sure that all the executable programs in the above packages are in PATH, and the JAR file of Trimmomatic is in the current directory. Read the BASH scripts for more details.

You need to run the analysis on an x86-64 Linux computer with at least 100GB of free disk space, 8 CPU cores and 64GB of memory.
