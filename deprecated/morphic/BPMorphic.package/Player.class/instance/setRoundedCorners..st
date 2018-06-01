card/stack commands
setRoundedCorners: aBoolean 
	"Set the rounded-corners attribute as indicated"
	costume renderedMorph
		cornerStyle: (aBoolean
				ifTrue: [#rounded]
				ifFalse: [#square])