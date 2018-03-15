typing/selecting keys
changeStyle: aKeyboardEvent 
	"Put up the style-change menu"
	self insertAndCloseTypeIn.
	self changeStyle.
	^ true