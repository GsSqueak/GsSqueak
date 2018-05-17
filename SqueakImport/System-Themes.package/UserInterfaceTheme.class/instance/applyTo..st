actions
applyTo: someObjects
	"Apply this theme to the given objects. Useful if you have to re-theme a specific set of objects. Restore the current theme after that."
	
	UserInterfaceTheme current in: [:priorTheme |
		[
			UserInterfaceTheme current: self.

			someObjects
				select: [:ea | ea canApplyUserInterfaceTheme]
				thenDo: [:ea | ea applyUserInterfaceTheme].

			Project current restoreDisplay.
		] ensure: [UserInterfaceTheme current: priorTheme]].