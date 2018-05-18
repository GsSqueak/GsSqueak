submenu - windows
closeAllWindowsUnsafe

	(UserDialogBoxMorph
		confirm: 'There might be unsaved changes.\Do you really want to close all windows?' withCRs
		title: 'Close All Windows') ifTrue: [
			self allVisibleWindows do: [:each | [each delete] valueSupplyingAnswer: true]].