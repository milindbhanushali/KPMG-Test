# -*- coding: utf-8 -*-
"""

Question 2 - For retrieving key value from the nested JSON object, function is created which 
recursively call itself unless it finds the key which is passed as an argument to the function

"""

import json

import subprocess
result = subprocess.run([r'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe', r'Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | ConvertTo-Json -Depth 64 | out-file c:\Temp\Metadata.json'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)

f = open('C:/Temp/Metadata.json')
data = json.load(f)
key='sku'

lst = []

def get_value(obj,key):
    if type(obj)==dict:
        for k,v in obj.items():
            if type(v)==dict:
                get_value(v,key)
                
            elif k==key:
                lst.append(v)
    
    return lst

value = get_value(data,key)
print(value)