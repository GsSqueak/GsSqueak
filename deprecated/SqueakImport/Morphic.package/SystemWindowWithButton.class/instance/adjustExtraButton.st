geometry
adjustExtraButton
	| leftMargin |
	buttonInTitle ifNil: [^ self].
	leftMargin := self boxExtent x + 3.
	self class moveMenuButtonRight ifTrue: [leftMargin := leftMargin * 2].
	buttonInTitle align: buttonInTitle topRight with: self innerBounds topRight - (leftMargin@0)