replacement
replaceGlobalFlapwithID: flapID
	"If there is a global flap with flapID, replace it with an updated one."

	| replacement tabs |
	(tabs := self globalFlapTabsWithID: flapID) size = 0 ifTrue: [^ self].
	tabs do: [:tab |
		self removeFlapTab: tab keepInList: false].
	flapID = 'Stack Tools' translated ifTrue: [replacement := self newStackToolsFlap].
	flapID = 'Supplies' translated ifTrue: [replacement := self newSuppliesFlapFromQuads: 
		(Preferences eToyFriendly
			ifFalse: [self quadsDefiningSuppliesFlap]
			ifTrue: [self quadsDefiningPlugInSuppliesFlap]) positioning: #right].
	flapID = 'Tools' translated ifTrue: [replacement := self newToolsFlap].
	flapID = 'Widgets' translated ifTrue: [replacement := self newWidgetsFlap].
	flapID = 'Navigator' translated ifTrue: [replacement := self newNavigatorFlap].
	flapID = 'Squeak' translated ifTrue: [replacement := self newSqueakFlap].
	replacement ifNil: [^ self].
	self addGlobalFlap: replacement.
	self currentWorld ifNotNil: [self currentWorld addGlobalFlaps]

"Flaps replaceFlapwithID: 'Widgets' translated "