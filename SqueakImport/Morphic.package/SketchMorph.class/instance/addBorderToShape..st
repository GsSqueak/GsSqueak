menu
addBorderToShape: evt
	| str borderWidth borderedForm r |
	str := UIManager default
		request: 'Please enter the desired border width' translated
		initialAnswer: '0'.
	borderWidth := Integer readFrom: (ReadStream on: str).
	(borderWidth between: 1 and: 10) ifFalse: [^ self].

	"Take care of growing appropriately.  Does this lose the reg point?"
	borderedForm := originalForm shapeBorder: Color black width: borderWidth.
	r := borderedForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	self form: (borderedForm copy: r).
