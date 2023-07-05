# Author: TheWii
# https://canary.discord.com/channels/900530660677156924/1057459352635719690/1057645088173461516

from bolt_expressions import Scoreboard, identifier_generator 

identifiers = identifier_generator(ctx)

value = Scoreboard.objective("b64.math")

def pow(base, exp):
    _base, _exp, _result = value["$pow_base", "$pow_exp", "$pow_result"]

    _base = base
    _exp = exp
    _result = 1

    if score var _exp matches 1.. function ./exp:
        _result *= _base
        _exp -= 1

        if score var _exp matches 1..
            function ./exp

    _output = value["$" + next(identifiers)]
    _output = _result
    
    return _output
