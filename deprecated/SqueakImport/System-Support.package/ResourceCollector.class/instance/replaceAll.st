accessing
replaceAll
	"Replace all resources by their originals. Done after the resource have been collected to get back to the original state."
	originalMap keysAndValuesDo:[:k :v|
		v ifNotNil:[k replaceByResource: v].
	].