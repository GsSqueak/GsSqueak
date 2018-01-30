WiW support
morphicLayerNumberWithin: anOwner 
	"helpful for insuring some morphs always appear in front of or behind
	others. smaller numbers are in front"
	^ (owner isNil
			or: [owner isWorldMorph
					or: [anOwner == owner]])
		ifTrue: [self
				valueOfProperty: #morphicLayerNumber
				ifAbsent: [100]]
		ifFalse: [owner morphicLayerNumber]"leave lots of room for special things"