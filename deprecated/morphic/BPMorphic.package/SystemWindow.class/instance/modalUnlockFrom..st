polymorph
modalUnlockFrom: aSystemWindow 
	"Unlock the receiver as a modal owner of the given window."
	aSystemWindow removeProperty: #modalOwner.
	self removeProperty: #modalChild.
	self beKeyWindow