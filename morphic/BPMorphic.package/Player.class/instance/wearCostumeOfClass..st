costume
wearCostumeOfClass: aClass 
	"Assume that the costume in the library has player = nil"
	| _gsSqueakTemp_newCostume |
	(costume renderedMorph isKindOf: aClass)
		ifTrue: [^ self].
	costumes
		ifNotNil: [costumes
				do: [:aCostume | aCostume class == aClass
						ifTrue: [^ self renderedCostume: aCostume]]].
	_gsSqueakTemp_newCostume := aClass new.
	self renderedCostume: _gsSqueakTemp_newCostume