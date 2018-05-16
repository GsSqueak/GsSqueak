browse
browseHierarchy: aBehavior
	| targetClass |
	targetClass := aBehavior isMeta
				ifTrue: [aBehavior theNonMetaClass]
				ifFalse: [aBehavior ].
	ToolSet browseHierarchy: targetClass selector: nil.