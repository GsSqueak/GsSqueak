accessing
beFlap: aBool
	"Mark the receiver with the #flap property, or unmark it"

	aBool
		ifTrue:
			[self setProperty: #flap toValue: true.
			self hResizing: #rigid.
			self vResizing: #rigid]
		ifFalse:
			[self removeProperty: #flap]