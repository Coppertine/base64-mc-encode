from bolt_expressions import Scoreboard, Data
from nbtlib import Byte
l = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz /@_~^!#{:}$%&'()|*+,-.;<=>?[\"\\]`"

# TODO: get_bitcode still reads all other commands even if only 1 command is properly executed. Try to optimise this.
# Could try a binary tree, but we don't have a number represenation of a string character.
# Edit, this is possibly the most optimised we could get knowing return stops all leading commands.
# Now we have up to n amount of nbt checks
for i in range(len(l)):
    execute if data storage b64:convert {"input_single":l[i]} run return ord(l[i])
    # We are outputing as a number, doing it as a scoreboard takes less of an impact.