misc
color: myColor sees: externalColor 
	"Answer whether any pixel of one color on my costume is coincident
	with any pixel of a second color in its surround. Returns false if the
	costume is not currently in the world"
	self costume isInWorld
		ifFalse: [^ false].
	^ self costume color: myColor sees: externalColor