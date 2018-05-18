docking bars support
showWorldMainDockingBarString
	^ (self showWorldMainDockingBar
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'show main docking bar (M)' translated