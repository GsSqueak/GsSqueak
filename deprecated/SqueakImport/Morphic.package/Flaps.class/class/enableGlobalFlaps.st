menu support
enableGlobalFlaps
	"Start using global flaps, given that they were not present."

	Cursor wait showWhile:
		[SharedFlapsAllowed := true.
		self globalFlapTabs. "This will create them"
		Smalltalk isMorphic ifTrue:
			[ActiveWorld addGlobalFlaps.
			self doAutomaticLayoutOfFlapsIfAppropriate.
			FlapTab allInstancesDo:
				[:aTab | aTab computeEdgeFraction].
			ActiveWorld reformulateUpdatingMenus]]