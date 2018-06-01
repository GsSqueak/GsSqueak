writing
nextPutAllWordArray: aWordArray

	| ba hackwa hackba blt rowsAtATime sourceOrigin rowsRemaining |

	self flag: #bob.		"do we need to be concerned by bytesPerElement??"
	ba := nil.
	rowsAtATime := 2000.		"or 8000 bytes"
	hackwa := Form new hackBits: aWordArray.
	sourceOrigin := 0@0.
	[(rowsRemaining := hackwa height - sourceOrigin y) > 0] whileTrue: [
		rowsAtATime := rowsAtATime min: rowsRemaining.
		(ba isNil or: [ba size ~= (rowsAtATime * 4)]) ifTrue: [
			ba := ByteArray new: rowsAtATime * 4.
			hackba := Form new hackBits: ba.
			blt := (BitBlt toForm: hackba) sourceForm: hackwa.
		].
		blt 
			combinationRule: Form over;
			sourceOrigin: sourceOrigin;
			destX: 0 destY: 0 width: 4 height: rowsAtATime;
			copyBits.
		self bufferStream nextPutAll: ba.
		self flushBuffer.
		sourceOrigin := sourceOrigin x @ (sourceOrigin y + rowsAtATime).
	].
