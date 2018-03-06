closure analysis
absorbHoistedTemp: aTempVar 
	"Collapse aTempVar into the receiver, being sure to update any closure
	analysis."
	aTempVar copyScopeAccessTo: self.
	aTempVar becomeForward: self