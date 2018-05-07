#!/bin/python

import urllib.request, json

unit_key = "C"

weather = eval(str(urllib.request.urlopen("http://tj.nineton.cn/Heart/index/future24h/?city=CHBJ000000").read())[2:-1])

#txt = weather["hourly"][0]["text"]

temp = int(float(weather["hourly"][0]["temperature"]))

print("%s (%i °%s)" % ("Bei_jing", temp, unit_key))