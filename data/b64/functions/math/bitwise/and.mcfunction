# inputs: $a, $b
# output: $output
# Credit: phi
# https://github.com/MinecraftPhi/MinecraftPhi-modules/tree/master/phi.bitwise/src/datapack/data/phi.bitwise/functions
from bolt_expressions import Scoreboard
from ../pow import pow
score = Scoreboard("b64.math")
# Apparently, phi attmempts to multiply a and b by 2 until it overflows.
output = score["$output"]
output = 0
i = 2147483647
while i > 0:
    if i == 2147483647:
        if score var score["$a"] matches ..-1 if score var score["$b"] matches ..-1 run scoreboard players set var output -2147483648
    else:
        score["$a"] *= 2
        score["$b"] *= 2
        itemp = i + 1
        if score var score["$a"] matches ..-1 if score var score["$b"] matches ..-1 run scoreboard players add var output int(itemp)
    i = int(i / 2)

# one more for 1
score["$a"] *= 2
score["$b"] *= 2
if score var score["$a"] matches ..-1 if score var score["$b"] matches ..-1 run scoreboard players add var output 1