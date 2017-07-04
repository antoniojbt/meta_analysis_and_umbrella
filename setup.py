'''
setup for |project_name|

Python packaging can become a nightmare, check the following for reference:
For example on setting a Python package, see:
https://packaging.python.org/en/latest/distributing.html
https://github.com/pypa/sampleproject
https://python-packaging.readthedocs.io/en/latest/index.html
http://the-hitchhikers-guide-to-packaging.readthedocs.io/en/latest/index.html

For Python 3.5
Before packaging or installing run:

    pip install -U pip twine check-manifest setuptools

TO DO: to add tests see https://python-packaging.readthedocs.io/en/latest/testing.html

To package, do something like this:

    check-manifest
    python setup.py check
    python setup.py sdist bdist_wheels

which will create a dist/ directory and a compressed file inside with your package.

More notes and references in:
    https://github.com/EpiCompBio/welcome

And in the Python docs.
Upload to PyPI after this if for general use.
'''
#################
# Get modules

# Py3 to 2 from pasteurize:
from __future__ import print_function
from __future__ import unicode_literals
from __future__ import division
from __future__ import absolute_import

from builtins import open
from builtins import str
from future import standard_library
standard_library.install_aliases()

# To use a consistent encoding
from codecs import open

# Standard modules:
import sys
import os
import glob

# Always prefer setuptools over distutils:
import setuptools

from setuptools import setup, find_packages

# To run custom install warning use:
from setuptools.command.install import install

from distutils.version import LooseVersion
if LooseVersion(setuptools.__version__) < LooseVersion('1.1'):
    print ("Version detected:", LooseVersion(setuptools.__version__))
    raise ImportError(
        "Setuptools 1.1 or higher is required")

# Get location to this file:
here = os.path.abspath(os.path.dirname(__file__))
print(here)

# Set up calling parameters from INI file:
# Modules with Py2 to 3 conflicts
try:
    import configparser
except ImportError:  # Py2 to Py3
    import ConfigParser as configparser

# Global variable for configuration file ('.ini')
# allow_no_value addition is from:
# https://github.com/docopt/docopt/blob/master/examples/config_file_example.py
# By using `allow_no_value=True` we are allowed to
# write `--force` instead of `--force=true` below.
CONFIG = configparser.ConfigParser(allow_no_value = True)

CONFIG.read(os.path.join(here, str('project_quickstart' + '.ini')))
# str(CONFIG['metadata']['project_name'] + '.ini'))) 

# Print keys (sections):
print('Values for setup.py:', '\n')
for key in CONFIG:
    for value in CONFIG[key]:
        print(key, value, CONFIG[key][value])
#################


#################
# Get version:
#sys.path.insert(0, here)
#src_dir = str(CONFIG['metadata']['project_name'] + '/' + CONFIG['metadata']['project_name'])
src_dir = str(CONFIG['metadata']['project_name'])
sys.path.insert(0, src_dir)
print(src_dir)

import version

version = version.set_version()
print(version)
#################


#################
# Define dependencies for installation

# Python version needed:
major, minor1, minor2, s, tmp = sys.version_info

if (major == 2 and minor1 < 7) or major < 2:
    raise SystemExit("""project_quickstart requires Python 2.7 or later.""")

# Get Ptyhon modules required:
install_requires = []

with open(os.path.join(here, 'requirements.rst'), encoding='utf-8') as required:
    for line in (required):
        if not line.startswith('#') and not line.startswith('\n'):
            line = line.strip()
            install_requires.append(line)

print(install_requires)

# Use README as long description if desired, otherwise get it from INI file (or
# write it out in setup()):

#with open(os.path.join(here, 'README.rst'), encoding='utf-8') as readme:
#    description = readme.read()

# PyPI doesn't render an rst README though, so maybe just leave a long
# description or the url.
#################



#################
# Define project specific elements:
# find_packages() from setuptools makes it easier, can use INI or directly type
# in though:
#packages = [CONFIG['metadata']['project_name']]

# If the packaging directory structure is not the conventional on it needs to be specified with package_dir. See:
# https://docs.python.org/3.6/distutils/setupscript.html
#package_dir = {'project_quickstart': 'project_quickstart'}

classifiers = CONFIG['metadata']['classifiers']

# Include addtional data files that are outside of the src dir:
# See: https://docs.python.org/3.6/distutils/setupscript.html#installing-package-data
#data_files = []
#directories = glob.glob('templates/*/')
#for directory in directories:
#    files = glob.glob(directory+'*')
#    data_files.append((directory, files))
# then pass data_files to setup()

def package_files(directory):
    paths = []
    for (path, directories, filenames) in os.walk(directory):
        for filename in filenames:
            paths.append(os.path.join('..', path, filename))
    return paths

extra_files = package_files(os.path.join(here, 'templates'))

#################


#################
# Run actual setup:

setup(  # Package information:
        name = CONFIG['metadata']['project_name'],
        version = version,
        url = CONFIG['metadata']['project_url'],
        download_url = CONFIG['metadata']['download_url'],
        author = CONFIG['metadata']['author_name'],
        author_email = CONFIG['metadata']['author_email'],
        license = CONFIG['metadata']['license'],
        description = CONFIG['metadata']['short_description'],
        platforms = [CONFIG['metadata']['platforms']],
        keywords = CONFIG['metadata']['keywords'],
        long_description = CONFIG['metadata']['long_description'],
        classifiers = list(filter(None, classifiers.split("\n"))),
        # Package contents:
        packages = find_packages(),
        #package_dir = package_dir,
        include_package_data = True,
        #data_files = [('templates', [glob.glob('templates/*'))], ('templates',
        #    [glob.glob('templates/*/*')])],
        package_data={'': extra_files},
        # Dependencies:
        install_requires = install_requires,
        entry_points={ 'console_scripts': ['project_quickstart = project_quickstart.project_quickstart:main'] },
        # Other options:
        zip_safe = False,
        )
#################
