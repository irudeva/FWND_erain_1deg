#!/usr/bin/env python
from ecmwfapi import ECMWFDataServer
server = ECMWFDataServer()
for yr in range(2009,2010) :
  server.retrieve({
    "class": "ei",
    "dataset": "interim",
    "date": "%.4d-01-01/to/%.4d-12-31" % (yr,yr),
    "expver": "1",
    "grid": "1./1.",
    "levtype": "sfc",
    "param": "165.128/166.128",
    "step": "0",
    "stream": "oper",
    "time": "00:00:00/06:00:00/12:00:00/18:00:00",
    "type": "an",
    "target": "erain.w10.%.4d.1deg.nc" % (yr),
    "format": "netcdf"
  })
