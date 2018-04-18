A LazyCharacterSet is a kind of CharacterSet which does not know in advance which Character it contains or not.
If will lazily evaluate a block on demand if ever one ask whether it includes: a character.
It is not feasible to enumerate a LazyCharacterSet, because there are way too many characters.

Instance Variables
	block:		<BlockContext | Symbol>
	byteArrayMapCache:		<ByteArray | nil>

block
	- a valuable, answering either true or false when sent the message value: - true means that this set includes the character passed as value: argument.

byteArrayMapCache
	- a cache holding 0 or 1 for the first 256 character codes - 0 meaning not included, 1 included. This is used in some priitives
