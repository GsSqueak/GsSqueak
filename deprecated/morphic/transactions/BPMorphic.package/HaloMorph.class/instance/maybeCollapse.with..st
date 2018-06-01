private
maybeCollapse: evt with: collapseHandle 
	"Ask hand to collapse my target if mouse comes up in it."
	evt hand obtainHalo: self.
	self delete.
	(collapseHandle containsPoint: evt cursorPoint)
		ifTrue: [target collapse]
		ifFalse: [target addHalo: evt]