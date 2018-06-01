private
reposition
	"Put ourself in the requested position on the display, but ensure completely within the bounds of the display"
	| position |
	self bounds:
		((self fullBounds
			align: self fullBounds center
			with: (self requestedPosition ifNil: [ self fullBounds center ])) translatedToBeWithin: Display boundingBox).
	"Check to see if labels are wider than progress bars. In that case do
	a centered instead of the default left aligned layout."
	position := self width > (Inset x * 2 + (self borderWidth * 2) + BarWidth)
		ifTrue: [ #topCenter ]
		ifFalse: [ #leftCenter ].
	self cellPositioning: position