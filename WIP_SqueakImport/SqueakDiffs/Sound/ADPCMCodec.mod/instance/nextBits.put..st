bit streaming
nextBits: n put: anInteger
	"Write the next n bits to my bit stream."

	| buf bufBits bitsAvailable shift |
	<inline: true>

	buf := anInteger.
	bufBits := n.
	[
		bitsAvailable := 8 - bitPosition.
		shift := bitsAvailable - bufBits.  "either left or right shift"
		"append high bits of buf to end of currentByte:"
		shift < 0
			ifTrue: [  "currentByte buffer filled; output it"
				currentByte := currentByte + (buf >> (0 - shift)).
				encodedBytes at: (byteIndex := byteIndex + 1) put: currentByte.
				bitPosition := 0.
				currentByte := 0.
				"clear saved high bits of buf:"
				buf := buf bitAnd: (1 << (0 - shift)) - 1.
				bufBits := bufBits - bitsAvailable]
			ifFalse: [  "still some bits available in currentByte buffer"
				currentByte := currentByte + (buf << shift).
				bitPosition := bitPosition + bufBits.
				^ self]] repeat
