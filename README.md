# base64-mc-encode
Encoding any string (char array) to base64 in Minecraft 1.20

---
A datapack library for Minecraft 1.20 that converts string (char array) into a base64 encoded string (char array) that can be compacted with a seperate library.
This library does not decode the base64 code as that has been implemented before for player skull decoders (i.e. [String-Parser](https://github.com/5uso/String-Parser)).

## How to Use
Once installed, you can set the string to be encoded into the `b64:convert` storage under the NBT string array tag `input`.
Example:
```
data modify storage b64:convert input set value ["h","e","l","l","o"," ","w","o","r","l","d"]
```
To start encoding, the function is executed.
```
function b64:encode
```

The output will be found in `b64:convert` under the NBT string array tag `result`. You can concatenate the array using a library like [ostrmc](https://github.com/oligomc/ostrmc/).

### Example
```
data modify storage b64:convert input set value ["N","o","t","h","i","n","g"," ","t","o"," ","s","e","e"," ","h","e","r","e"," ","4","2"]
function b64:encode
data get storage b64:convert result
```

Output
```
Storage b64:convert has the following contents: ["T", "m", "9", "0", "a", "G", "l", "u", "Z", "y", "B", "0", "b", "y", "B", "z", "Z", "W", "U", "g", "a", "G", "V", "y", "Z", "S", "A", "0", "M", "g", "=", "="]
```
### Allowed Characters
Below are the characters that this datapack can read from the input string becore encoding.
```
 !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\"\\]^_`abcdefghijklmnopqrstuvwxyz{|}~
```

## Building
Building this datapack uses [beet](https://github.com/mcbeet/beet), [bolt](https://github.com/mcbeet/bolt), [mecha](https://github.com/mcbeet/mecha) and [bolt-expressions](https://github.com/rx-modules/bolt-expressions). You can install them with the commands below.
```
$ pip install beet bolt mecha bolt-expressions
```
and you can build using 
```
beet build
```
the built datapack will be found in the `build` folder.

## Screenshot
![image](https://github.com/Coppertine/base64-mc-encode/assets/37494321/6a3ed961-0e7a-4a61-b245-706fb67db4bf)


## Attributions
[Minecraft Phi](https://github.com/MinecraftPhi/MinecraftPhi-modules/tree/master/phi.bitwise/src/datapack)

[Algorithm Wikibook](https://en.wikibooks.org/wiki/Algorithm_Implementation/Miscellaneous/Base64#Javascript)
