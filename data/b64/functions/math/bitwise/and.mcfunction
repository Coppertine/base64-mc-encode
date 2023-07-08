# inputs: $a, $b
# output: $output
# Credit: phi
# https://github.com/MinecraftPhi/MinecraftPhi-modules/tree/master/phi.bitwise/src/datapack/data/phi.bitwise/functions
from bolt_expressions import Scoreboard
from b64:pow import pow
score = Scoreboard("b64.math")
# Apparently, phi attmempts to multiply a and b by 2 until it overflows.

# NOTE; refrain from using *= 2 way too many times, it's used 992 times over
# Extra note.. don't optimise, it's intended to loop 31 times...
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