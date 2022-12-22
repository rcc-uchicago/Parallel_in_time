#! /usr/bin/env python

import glob
import sys
import os

fine_work_dir = sys.argv[1]
out_file = sys.argv[2]

energy_files = glob.glob(os.path.join(fine_work_dir, 'energy_fine*'))
d = {}
for f in energy_files:
    (name, iter, slice) = f.split('.')
    d[int(slice), int(iter)] = f

s = sorted(d.keys())
m = {}
sol_files = {}
for (slice, iter) in s:
    try:
        m[slice] = max(m[slice], iter)
    except KeyError:
        m[slice] = iter
    finally:
        sol_files[slice] = d[slice, m[slice]]

data = []
slice_list = sorted(sol_files.keys())
for slice in slice_list[0:-1]:
    v = []
    for l in open(sol_files[slice]).readlines():
        v.append(float(l.split()[2]))
    data.extend(v[0:-1])

for l in open(sol_files[slice_list[-1]]).readlines():
    data.extend(float(l.split()[2]))

out_f = open(out_file, 'w')
for d in data:
    print >> out_f, '%5f' %(d)
    



