accessing
nextImage
	"Read in the next xbm image from the stream."
	| form long incount chunks byteWidth pad fourway outcount total |
	stream reset.
	stream ascii.
	self readHeader.
	form := ColorForm extent: width@height depth: 1.
	incount := 0.	outcount :=1.
	chunks := Array new: 4.	byteWidth := width + 7 // 8.
	total := byteWidth * height.
	byteWidth > 4
		ifTrue: [ pad := byteWidth \\ 4]
		ifFalse: [ pad := 4 - byteWidth ].
	fourway := 0.
	[(incount = total)] whileFalse: [
		incount := incount + 1.
		fourway := fourway + 1.
		chunks at: fourway put: (Flipbits at: ((self parseByteValue) +1)).
		(pad > 0 and: [(incount \\ byteWidth) = 0]) ifTrue: [
			1 to: pad do:
				[:q |	
  			fourway := fourway + 1.	
			chunks at: fourway put: 0]
		].
		fourway = 4 ifTrue: [
			long := Integer
				byte1: (chunks at: 4)
				byte2: (chunks at: 3)
				byte3: (chunks at: 2)
				byte4: (chunks at: 1).
			(form bits) at: outcount put: long.
			fourway := 0.
			outcount := outcount + 1].
		].
	 ^ form 