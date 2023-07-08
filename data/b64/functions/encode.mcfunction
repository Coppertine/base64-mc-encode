from bolt_expressions import Scoreboard, Data
from b64:ops import lshift
storage = Data.storage(b64:convert)
score = Scoreboard("b64.tmp", "dummy")
math_score = Scoreboard("b64.math", "dummy")

def rshift(a,b):
    math_score["$a"] = a
    math_score["$b"] = b
    function b64:math/bitwise/rshift
    return math_score["$output"]


def bitwise_and(a,b):
    math_score["$a"] = a
    math_score["$b"] = b
    function b64:math/bitwise/and
    return math_score["$output"]

chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
storage.result = []
storage.padding = []
storage.tmp = []
storage.tmp_single = ""

storage.string = []
storage.tmp_section = []
storage.section = []

# generating the tree to grab the spesific character from the b64 char list
for node in generate_tree(range(len(chars)), name="get_char", root=(b64:get_b64_char)):
    append function node.parent:
        if node.partition(4):
            if score var math_score["$input"] matches node.range run function node.children
        else:
            if score var math_score["$input"] matches node.value run data modify var storage.tmp_single set value chars[node.value]

# We are grabbing the string from b64:convert input

storage.string = storage.input
execute store result score var score["$length"] run data get var storage.string
# score["$length"] = storage.string
score["$chunk"] = score["$length"] % 3

# Add "=" and '' padding to ensure string is multiple of 3 characters
if score var score["$chunk"] matches 1.. run function b64:add_padding:
    score["$iterator"] = score["$chunk"]
    if score var score["$iterator"] matches ..3 run function b64:loop:
        storage.padding.append('=')
        storage.string.append('')
        score["$iterator"] += 1
        if score var score["$iterator"] matches ..3 run function b64:loop

score["$chunk"] = 0
if score var score["$chunk"] < var score["$length"] run function b64:string_increment:

    storage.section = []
    storage.tmp_section = storage.string
    score["$chunk2"] = score["$chunk"] + 1
    score["$i"] = 0
    # tellraw @a score["$chunk"]
    if score var score["$i"] < var score["$chunk"] run function b64:substr_chunk_start:
        data remove var storage.tmp_section[0]
        score["$i"] += 1
        if score var score["$i"] < var score["$chunk"] run function b64:substr_chunk_start
        
    score["$i"] = score["$length"]
    if score var score["$i"] > var score["$chunk2"] run function b64:substr_chunk_end:
        data remove var storage.tmp_section[-1]
        score["$i"] -= 1
        if score var score["$i"] > var score["$chunk2"] run function b64:substr_chunk_end
    # We SHOULD have an array of just 3 elements.... I hope.. edit: yep
   #  tellraw @a storage.tmp_section

    for x in range(3):
        storage.input_single = storage.tmp_section[x]
        # pls make this:
        # score[f"$b{x}"] = function b64:get_bitcode
        execute store result score var score[f"$b{x}"] run function b64:get_bitcode

    # [0] << 16, [1] << 8
    score["$b0"] = lshift(score["$b0"], 16)
    score["$b1"] = lshift(score["$b1"], 8)

    score['$n'] = 0
    score["$n"] = score["$b0"] + score["$b1"] + score["$b2"]
    
    # due to some fuckery, i want to ensure they compute on their own values and not cross-contaminate
    score["$n3"] = score["$n"]
    score["$n0"] = score["$n"]
    score["$n1"] = score["$n"]
    score["$n2"] = score["$n"]

    # ($n >> 18) & 63
    score["$n3"] = bitwise_and(score["$n3"],63)
    score["$n0"] = bitwise_and(rshift(score["$n0"], 18), 63)
    score["$n1"] = bitwise_and(rshift(score["$n1"], 12), 63)
    score["$n2"] = bitwise_and(rshift(score["$n2"], 6), 63)
    # tellraw @a [score['$n0'], ",", score['$n1'],",",score['$n2'],",",score['$n3']]

    for x in [score["$n0"], score["$n1"], score["$n2"], score["$n3"]]:
        math_score["$input"] = x
        function b64:get_b64_char
        storage.result.append(storage.tmp_single)

    score["$chunk"] += 3
    if score var score["$chunk"] < var score["$length"] run function b64:string_increment
# tellraw @a storage.result

# remove the fake padding, we need to start at 1 as somehow two pads are added...
execute store result score var score["$paddinglen"] run data get var storage.padding
score["$i"] = 1
if score var score["$i"] < var score["$paddinglen"] run function b64:substr_result_end:
    data remove var storage.result[-1]
    score["$i"] += 1
    if score var score["$i"] < var score["$paddinglen"] run function b64:substr_result_end

score["$i"] = 1
if score var score["$i"] < var score["$paddinglen"] run function b64:padding_append:
    storage.result.append("=")
    score["$i"] = score["$i"] + 1
    if score var score["$i"] < var score["$paddinglen"] run function b64:padding_append

# tellraw @a [storage.result.component(interpret=true)]