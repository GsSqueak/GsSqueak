focus
lookUnfocused
	"See #lookFocused, #activate, and #passivate."

	self isLookingFocused ifFalse: [^ self].
	self isLookingFocused: false.

	label ifNotNil: [ label color: (self userInterfaceTheme unfocusedLabelColor ifNil: [Color darkGray]) ].
	self dimWindowButtons.
	self paneColorToUseWhenNotActive in: [ : col |
		self
			 setStripeColorsFrom: col ;
			 adoptPaneColor: col ]