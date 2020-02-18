
# chacha.lua
A fast way to encrypt and decrypt data.  
Created by Anarvis
**Dependencies**  
None
**Optional Dependencies**  
None

## *string* `chacha.crypt(string data, table key, table nonce[, int cntr, int round])`
Crypts `string` using `key` and `nonce`. See [http://www.computercraft.info/forums2/index.php?/topic/25474-chacha20-encryption-in-computercraft/](http://www.computercraft.info/forums2/index.php?/topic/25474-chacha20-encryption-in-computercraft/) for an example on how it works.

## *table* `chacha.getNonce(int len)`
Generates a nonce as long as `len`.

## *table* `chacha.newRNG(any seed)`