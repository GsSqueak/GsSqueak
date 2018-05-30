submenu - windows
closeAllWindowsButWorkspaces

	(UserDialogBoxMorph
		confirm: 'There might be unsaved changes.\Do you really want to close all windows\that are no workspaces?' withCRs
		title: 'Only keep workspaces') ifTrue: [
			self allVisibleWindows
				reject: [:each | each model isKindOf: Workspace]
				thenDo: [:each | [each delete] valueSupplyingAnswer: true]].