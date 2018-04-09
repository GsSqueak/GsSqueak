*SqCollectionLiterals-internet
squeakToMac
	"Convert the receiver from Squeak to MacRoman encoding"
	^ self collect: [:each | each squeakToMac]
