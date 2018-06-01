Mac reader
strikeFromHex: file width: w height: h
	"read in just the raw strike bits from a hex file.  No spaces or returns.  W is in words (2 bytes), h in pixels." 
	| newForm theBits offsetX offsetY str num cnt |
	offsetX  := 0.
	offsetY := 0.
	offsetX > 32767 ifTrue: [offsetX := offsetX - 65536]. "stored two's-complement"
	offsetY > 32767 ifTrue: [offsetY := offsetY - 65536]. "stored two's-complement"
	newForm := Form extent: strikeLength @ h offset: offsetX @ offsetY.
	theBits := newForm bits.
	cnt := 0.		"raster may be 16 bits, but theBits width is 32" 
	1 to: theBits size do: [:i | 
		(cnt := cnt + 32) > strikeLength 
		  ifTrue: [cnt := 0.
			num := Number readFrom: (str := file next: 4) base: 16]
		  ifFalse: [
			cnt = strikeLength ifTrue: [cnt := 0].
			num := Number readFrom: (str := file next: 8) base: 16].
		theBits at: i put: num].
	glyphs := newForm.