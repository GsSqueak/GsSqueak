initialization
reverseBytesFrom: begin to: end
	"Byte-swap the given range of memory (not inclusive!)."
	| wordAddr |
	wordAddr := begin.
	memory swapBytesFrom: wordAddr // 4 + 1 to: end // 4