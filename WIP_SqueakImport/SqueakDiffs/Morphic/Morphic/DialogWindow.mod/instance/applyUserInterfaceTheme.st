updating
applyUserInterfaceTheme

	super applyUserInterfaceTheme.
	
	self
		setDefaultParameters;
		setTitleParameters;
		setMessageParameters.
		
	"Update all buttons."
	selectedButton in: [:sb |
		self buttons do: [:ea |
			ea setProperty: #normalColor toValue: self defaultButtonColor.
			self deselectButton: ea].
		sb ifNotNil: [self selectButton: sb]].