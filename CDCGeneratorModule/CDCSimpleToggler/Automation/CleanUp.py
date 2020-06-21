#!/usr/bin/env python3 

import os

location = '../'
files_to_remove = []

# r=>root, d=>directories, f=>files
for r, d, f in os.walk(location):
   for item in f:
      if '.jou' in item or '.log' in item or 'xelab.pb' in item: 
         files_to_remove.append(os.path.join(r, item))


for fileName in files_to_remove: 
   os.remove(fileName)
