from bolt_expressions import Scoreboard, Data
score = Scoreboard("b64.tmp")

score["$foo"] = 1
# score["$foo"] << 2