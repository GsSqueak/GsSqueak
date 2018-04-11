rounding
cornerStyle: aSymbol 
	"Set the receiver's corner style. But, in this case, do *not*"
	self removeProperty: #cornerStyle.
	self changed