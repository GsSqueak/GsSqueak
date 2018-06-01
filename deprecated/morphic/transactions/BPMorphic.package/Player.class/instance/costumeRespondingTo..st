costume
costumeRespondingTo: aSelector 
	"Answer a costume that responds to the given selector, or nil if none"
	| _gsSqueakTemp_aMorph |
	((_gsSqueakTemp_aMorph := self costume renderedMorph) respondsTo: aSelector)
		ifTrue: [^ _gsSqueakTemp_aMorph].
	costumes isEmptyOrNil
		ifFalse: [costumes
				do: [:aCostume | (aCostume respondsTo: aSelector)
						ifTrue: [^ aCostume]]].
	^ nil"usually an error will result"