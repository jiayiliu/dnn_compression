#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import tabulate as tb

def create_url(x):
    return "[%s](%s)"%(x['Title'], x['URL'])

d=pd.read_csv("output.csv")
d['Title'] = d.apply(create_url, axis=1)
d=d.drop("URL", axis=1)
d=d.fillna('')

with open("./header.md", 'r') as f:
    head = f.read()
    
with open("index.md", 'w') as f:
    f.write(head)
    f.write("\n")
    f.write(tb.tabulate(d.values,d.columns, tablefmt="github"))
