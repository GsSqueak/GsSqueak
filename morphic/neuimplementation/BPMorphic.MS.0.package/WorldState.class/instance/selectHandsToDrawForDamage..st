hands
selectHandsToDrawForDamage: damageList 
	"Select the set of hands that must be redrawn because either (a) the
	hand itself has changed or (b) the hand intersects some damage
	rectangle. "
	| result |
	result := OrderedCollection new.
	hands
		do: [:h | h needsToBeDrawn
				ifTrue: [h hasChanged
						ifTrue: [result add: h]
						ifFalse: [| hBnds |
							hBnds := h fullBounds.
							(damageList
									anySatisfy: [:r | r intersects: hBnds])
								ifTrue: [result add: h]]]].
	^ result