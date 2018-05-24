private
recenter
	| position |
"This method is no longer used, but kept for a while longer to ensure no difficulties updating via the trunk."
	"Put ourself in the center of the display"
	self align: self fullBounds center with: Display boundingBox center.
	"Check to see if labels are wider than progress bars. In that case do
	a centered instead of the default left aligned layout."
	position :=	self width > (Inset x * 2 + (self borderWidth * 2) + BarWidth)
					ifTrue: [#topCenter]
					ifFalse: [#leftCenter].
	self cellPositioning: position