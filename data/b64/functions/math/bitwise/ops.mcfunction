from bolt_expressions import Scoreboard
from ../pow import pow
import sys

score = Scoreboard("b64.math")
# inputs: $a, $b
# output: $output
def lshift(a, b):
    output = score["$output"]
    output = a
    output = output * pow(2, b)
    return output
