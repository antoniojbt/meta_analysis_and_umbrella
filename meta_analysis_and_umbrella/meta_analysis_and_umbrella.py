'''
script_name
===========

:Author: |author_name|
:Release: |version|
:Date: |today|


Purpose
=======

|description|


Usage and options
=================

These are based on docopt_, see examples_.

.. _docopt: https://github.com/docopt/docopt

.. _examples: https://github.com/docopt/docopt/blob/master/examples/options_example.py


Usage:
       script_name [--main-method]
       script_name [-I FILE]
       script_name [-O FILE]
       script_name [-h | --help]
       script_name [-V | --version]
       script_name [-f --force]
       script_name [-L | --log]

Options:
    -I             Input file name.
    -O             Output file name.
    -h --help      Show this screen
    -V --version   Show version
    -f --force     Force overwrite
    -L --log       Log file name.

Documentation
=============

    For more information see:

        |url|

'''
##############
# Some basic Python reminders
# Slicing/indexing excludes the last number
# Lists are 0 based
# PEP8 has 80 character limit and 4 spaces for indentation, do not use tabs, much less mix
# Python operator precedence: https://www.tutorialspoint.com/python/operators_precedence_example.htm
# dictionaries are accessed as my_dict[2] ; '2' == key, not index ; while my_list[2] is an index ; use assert if ambigous
# modulo is % (the remainder) ; // gives the integer of the division
# lists and dictionaries are mutable; tuples immutable
# Functional programming
# OOP
# regex

import sys
import os
import docopt

# Basic function structure:
def my_func():
    '''
    Comment the function, this will be pulled automatically into the documenation.
    '''

    # Make sure the setup is correct for this function:
    assert True == True

    # do something

    return

# Handle errors:
try:
    pass #something
except TypeError: #some error to catch
    print('Wrong type of variable') #some helpful message or other option
    raise # Raise the systeme error anyway
except: # 'except:' by itself will catch everything, potentially disastrous
    print("Unexpected error:", sys.exc_info()[0])
    raise # even if caught raise the error
finally:
    print('Did this work?')#do this regardless of the above, also dangerous


# Else/if basic structure:
x = 5
if x > 1:
    print('Positive')
elif x < 1:
    print('Negative')
else:
    print('Zero')

# Basic OOP class structure:
# Form e.g.: https://www.tutorialspoint.com/python/python_classes_objects.htm
class SuperHero:
   '''
   Common base class for all employees
   '''
   SuperSaves = 0

   def __init__(self, name, power):
      self.name = name
      self.power = power
      SuperHero.SuperSaves += 1

   def displaySaves(self):
     print("Total SuperHero saves %d" % SuperHero.SuperSaves)

   def displaySuperHero(self):
      print("Name : ", self.name,  ", power: ", self.power)

# First object in class:
super1 = SuperHero("SuperWoman", 'Strong')
# Second object in class:
super2 = SuperHero("AveJoe", 'Common Sense')

# Check the Attributes:
super1.displaySuperHero()
super2.displaySuperHero()
print("Total SuperHero saves %d" % SuperHero.SuperSaves)

##############




##############
# Get all the modules needed

# System:
import os
import sys
import glob
import imp
# Options and help:
from docopt import docopt

# Data science:
import pandas as pd
import numpy as np

# required to make iteritems python2 and python3 compatible
from builtins import dict

# Try getting CGAT:
try:
    import CGAT.IOTools as IOTools
    import CGATPipeline.Pipeline as P
    import CGATPipeline.Experiment as E

except ImportError:
    print("Couldn't import CGAT modules")
    raise
##############

# Non-docopt arguments structure:
# e.g. see umi-tools

def main(argv=None):

    argv = sys.argv

    path = os.path.abspath(os.path.dirname(__file__))

    if len(argv) == 1 or argv[1] == "--help" or argv[1] == "-h":
        print(globals()["__doc__"])

        return

    command = argv[1]

    (file, pathname, description) = imp.find_module(command, [path, ])
    module = imp.load_module(command, file, pathname, description)
    # remove 'umi-tools' from sys.argv
#    del sys.argv[0]
#    module.main(sys.argv)


# Finish and exit with docopt arguments:
if __name__ == '__main__':
    arguments = docopt(__doc__, version='xxx 0.1')
    print(arguments)
    sys.exit(main())
