bit streaming
nextBits: n
	"Answer the next n bits of my bit stream as an unsigned integer."

	| result remaining shift |
	<inline: true>

	result := 0.
	remaining := n.
	
	[
		shift := remaining - bitPosition.
		shift > 0
			ifTrue: [  "consumed currentByte buffer; fetch next byte"
				result := result + (currentByte << shift).
				remaining := remaining - bitPosition.			
				currentByte := (encodedBytes at: (byteIndex := byteIndex + 1)).
				bitPosition := 8]
			ifFalse: [  "still some bits left in currentByte buffer"
				result := result + (currentByte >> (0 - shift)).
				bitPosition := bitPosition - remaining.
				"mask out the consumed bits:"
				currentByte := currentByte bitAnd: (255 >> (8 - bitPosition)).
				^ result]] repeat
