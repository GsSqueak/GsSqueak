accessing
color: aColor 
	"set the receiver's color and the submorphs color"
	super color: aColor.
	self
		submorphsDo: [:m | m color: aColor]