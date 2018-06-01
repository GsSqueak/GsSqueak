displaying
displayStringR2L: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta 

	| destPoint font form encoding char charCode glyphInfo |
	destPoint := aPoint.
	glyphInfo := Array new: 5.
	startIndex to: stopIndex do: [:charIndex |
		char := aString at: charIndex.
		encoding := char leadingChar + 1.
		charCode := char charCode.
		font := fontArray at: encoding.
		((charCode between: font minAscii and: font maxAscii) not) ifTrue: [
			charCode := font maxAscii].
		self glyphInfoOf: char into: glyphInfo.
		form := glyphInfo first.
			(glyphInfo size > 4 and: [glyphInfo fifth notNil and: [glyphInfo fifth ~= aBitBlt lastFont]]) ifTrue: [
				glyphInfo fifth installOn: aBitBlt.
			].
		aBitBlt
			sourceForm: form;
			destX: destPoint x - form width;
			destY: destPoint y;
			sourceOrigin: 0 @ 0;
			width: form width;
			height: form height;
			copyBits.
		destPoint := destPoint x - (form width + kernDelta) @ destPoint y.
	].
