*SqCollectionLiterals-*SqCollectionLiterals-copying
grownBy: length 
	"Answer a copy of receiver collection with size grown by length"
	^ (self class ofSize: self size + length)
		replaceFrom: 1 to: self size with: self startingAt: 1 ;
		yourself
