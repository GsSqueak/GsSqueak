formatting
columnRect: n
	"Return a rectangle describing the n-th column"
	| area left right |
	area := self textArea.
	left := area left + ((n-1) * self columnWidth).
	left := left + ((n-1) * self columnSkip).
	right := left + self columnWidth.
	^(self in2pix: left @ area top) corner: 
		(self in2pix: right @ area bottom)