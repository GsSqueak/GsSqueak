menus
uncollapseSketch
	| uncollapsedVersion w whomToDelete |
	(w := self world)
		ifNil: [^ self].
	uncollapsedVersion := self valueOfProperty: #uncollapsedMorph.
	uncollapsedVersion
		ifNil: [^ self].
	whomToDelete := self valueOfProperty: #collapsedMorphCarrier.
	uncollapsedVersion setProperty: #collapsedPosition toValue: whomToDelete position.
	whomToDelete delete.
	w addMorphFront: uncollapsedVersion