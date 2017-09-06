#!/usr/bin/python
import re
import sys
import getopt
import inithooks_cache

import hashlib

from dialog_wrapper import Dialog
from mysqlconf import MySQL

DEFAULT_ADAPTER="eth0"
main()

def main():
    d = Dialog("NTOPNG FIRST BOOT CONFIGURATION")
    domain = d.get_input(
    "NTOPNG requires one adapter to listen to network traffic. Please put the name of the adapter you would like to use.",
    "Enter adapter name here.",
    DEFAULT_ADAPTER)


if __name__ == "__main__":
    main()
