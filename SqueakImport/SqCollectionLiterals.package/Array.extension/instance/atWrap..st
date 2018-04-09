*SqCollectionLiterals-*SqArray-accessing
atWrap: index 
	"Optimized to go through the primitive if possible"
	
	^ self at: index - 1 \ self size + 1
