# inputs: $a, $b
# output: $output
# Credit: phi
# https://github.com/MinecraftPhi/MinecraftPhi-modules/tree/master/phi.bitwise/src/datapack/data/phi.bitwise/functions
from bolt_expressions import Scoreboard
from b64:pow import pow
score = Scoreboard("b64.math")
a = score["$a"]
b = score["$b"]
output = score["$output"]
if score var a matches 1.. run function b64:math/bitwise/rshift_sign_prop:
    output = a
    output = output / pow(2, b)
if score var a matches ..-1 run function b64:math/bitwise/rshift_zero_filling_neg:
    # overflow to clear sign bit
    a += 2147483647
    a += 1
    a = a / pow(2,b)
    b -= 31
    b *= -1
    output = a + pow(2,b)