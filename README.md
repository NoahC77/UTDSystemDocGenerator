These docs are build using Sphinx 2.3.0
In order to install Sphinx 2.3.0 or change from a different version of Sphinx to Sphinx 2.3.0 do this.
pip install sphinx==2.3.0
If sphinx is already installed, this will uninstall your current version of sphinx and install Sphinx 2.3.0

## UTDSystemDocGenerator
A framework of shell scripts and rst files which generates a set of html explaining how to use any UTD HPC system based on user defined values.

## Sphinx Python Documentation Generator
The UTDSystemDocGenerator uses [Sphinx] (http://www.sphinx-doc.org/en/master/) [2.3.0] (http://www.sphinx-doc.org/en/master/changes.html#release-2-3-0-released-dec-15-2019) to generate the styled html from rst.

## Read the Docs Theme
The [Read the docs Sphinx Theme] (https://sphinx-rtd-theme.readthedocs.io/en/stable/) is used in the styling of the generated document.

## Usage
To use the UTDSystemDocGenerator: [the Sphinx Python Documentation Generator] (http://www.sphinx-doc.org/en/master/usage/installation.html), [the Read the Docs Sphinx Theme] (https://sphinx-rtd-theme.readthedocs.io/en/stable/), and a bash to run the Makefiles is necessary. This generator was developed using Sphinx 2.3.0 and Python 3.6.6 within Git Bash on Windows 10. Earlier versions of Sphinx have bugs which may affect the search feature within the Read the Docs Sphinx theme. By default, when the root Makefile is run, the documenatation for UTD's Ganymede system is generated. In order to generate the documentation for a different system specify new values for the variables defined at the top of the root Makefile.
