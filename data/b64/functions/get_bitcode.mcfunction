from bolt_expressions import Scoreboard, Data
from nbtlib import Byte
l = " !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\"\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

storage = Data.storage(b64:convert)
# storage.input_single = 'a'
storage.output_bitcode = 0
# for node in generate_tree(range(len(l)), name='bitcode', key=int, root=('get_char_bitcode')):
#     append function node.parent:
#         execute if data storage b64:convert {"input_single":l[node.value]} run function node.children:
#             storage.output_bitcode = ord(l[node.value])
for i in range(len(l)):
    execute if data storage b64:convert {"input_single":l[i]} run function f"b64:bit/get_{i}_code":
        storage.output_bitcode = ord(l[i])