# -*- coding: utf-8 -*-
"""

Question 3 - Created a function to which object and key is passed and it returns the value 
corresponding to it

"""

obj_1 = {"a":{"b":{"c":"d"}}}
key_1 = "a/b/c"

obj_2 = {"x":{"y":{"z":"a"}}}
key_2 = "x/y/z"

def get_value(obj,key):
    for i in key.split("/"):
        dict_1 = obj.get(i)
        obj=dict_1
    return obj

value_1 = get_value(obj_1,key_1)
print("Value of Key",key_1,"is --->", value_1)

value_2 = get_value(obj_2,key_2)
print("Value of Key",key_2,"is --->", value_2)

