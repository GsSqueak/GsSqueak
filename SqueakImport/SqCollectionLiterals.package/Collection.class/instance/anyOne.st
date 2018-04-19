*SqCollectionLiterals-*SqCollectionLiterals-accessing
anyOne
	"Answer a representative sample of the receiver. This method can
	be helpful when needing to preinfer the nature of the contents of 
	semi-homogeneous collections."

	self do: [:each | ^ each].
	self errorEmptyCollection
