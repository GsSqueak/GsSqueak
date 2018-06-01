private
addNameBeneath: outerRectangle string: aString 
	"Add a name display centered beneath the bottom of the outer
	rectangle. Return the handle."
	| _gsSqueakTemp_nameMorph _gsSqueakTemp_namePosition _gsSqueakTemp_w |
	_gsSqueakTemp_w := self world
				ifNil: [target world].
	_gsSqueakTemp_nameMorph := NameStringInHalo contents: aString font: Preferences standardHaloLabelFont.
	_gsSqueakTemp_nameMorph wantsYellowButtonMenu: false.
	_gsSqueakTemp_nameMorph color: Color black.
	_gsSqueakTemp_nameMorph useStringFormat; target: innerTarget; putSelector: #tryToRenameTo:.
	_gsSqueakTemp_namePosition := outerRectangle bottomCenter - (_gsSqueakTemp_nameMorph width // 2 @ (self handleSize negated // 2 - 1)).
	_gsSqueakTemp_nameMorph
		position: (_gsSqueakTemp_namePosition min: _gsSqueakTemp_w viewBox bottomRight - _gsSqueakTemp_nameMorph extent y + 2).
	_gsSqueakTemp_nameMorph balloonTextSelector: #objectNameInHalo.
	self addMorph: _gsSqueakTemp_nameMorph.
	^ _gsSqueakTemp_nameMorph