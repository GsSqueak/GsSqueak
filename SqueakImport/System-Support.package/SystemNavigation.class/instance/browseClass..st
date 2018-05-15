browse
browseClass: aBehavior
	| targetClass |
	targetClass := aBehavior isMeta
				ifTrue: [aBehavior theNonMetaClass]
				ifFalse: [aBehavior ].
	ToolSet browse: targetClass selector: nil