instance creation
on: anArray size: size
	"Create a new heap using the first size elements of anArray as the internal array"
	
	^self
		on: anArray
		size: size
		sortBlock: nil