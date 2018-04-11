-Etoys-geometry
scaleFactor: newScale 
	"Backstop for morphs that don't have to do something special to set
	their 
	scale"
	| _gsSqueakTemp_toBeScaled |
	_gsSqueakTemp_toBeScaled := self.
	newScale = 1.0
		ifTrue: [(self heading isZero
					and: [self isFlexMorph])
				ifTrue: [_gsSqueakTemp_toBeScaled := self removeFlexShell]]
		ifFalse: [self isFlexMorph
				ifFalse: [_gsSqueakTemp_toBeScaled := self addFlexShellIfNecessary]].
	_gsSqueakTemp_toBeScaled scale: newScale.
	_gsSqueakTemp_toBeScaled == self
		ifTrue: [newScale = 1.0
				ifTrue: [self removeProperty: #scaleFactor]
				ifFalse: [self setProperty: #scaleFactor toValue: newScale]]