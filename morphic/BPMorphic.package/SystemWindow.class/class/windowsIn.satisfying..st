top window
windowsIn: aWorld satisfying: windowBlock 
	| _gsSqueakTemp_windows |
	_gsSqueakTemp_windows := OrderedCollection new.
	aWorld
		ifNil: [^ _gsSqueakTemp_windows].
	"opening MVC in Morphic - WOW!"
	aWorld submorphs
		do: [:m | | s | (m isSystemWindow
					and: [windowBlock value: m])
				ifTrue: [_gsSqueakTemp_windows addLast: m]
				ifFalse: [((m isKindOf: TransformationMorph)
							and: [m submorphs size = 1])
						ifTrue: [s := m firstSubmorph.
							(s isSystemWindow
									and: [windowBlock value: s])
								ifTrue: [_gsSqueakTemp_windows addLast: s]]]].
	^ _gsSqueakTemp_windows