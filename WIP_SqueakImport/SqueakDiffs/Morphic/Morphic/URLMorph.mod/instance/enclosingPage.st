private
enclosingPage
	"Answer the inner-most SqueakPage contents that contains this morph, or nil if there isn't one."

	self allOwnersDo:
		[:m | (m isKindOf: PasteUpMorph)
			ifTrue: [(SqueakPageCache pageForMorph: m) ifNotNil: [:pg | ^ pg]]].
	^ nil
