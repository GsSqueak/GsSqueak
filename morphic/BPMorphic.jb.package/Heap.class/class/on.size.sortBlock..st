instance creation
on: anArray size: size sortBlock: aBlockOrNil 
	"Create a new heap using the first size elements of anArray as the
	internal array and sorted by aBlockOrNil"
	anArray isArray
		ifFalse: [self error: 'Array expected.'].
	anArray size < size
		ifTrue: [self error: 'size must not be larger than anArray size'].
	^ super new setCollection: anArray tally: size;
		 sortBlock: aBlockOrNil;
		 yourself