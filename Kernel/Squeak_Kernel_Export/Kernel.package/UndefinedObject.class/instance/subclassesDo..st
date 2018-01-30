class hierarchy
subclassesDo: aBlock
	"Evaluate aBlock with all subclasses of nil."
	^Class subclassesDo:[:cl| 
		cl isMeta ifTrue:[aBlock value: cl soleInstance]].