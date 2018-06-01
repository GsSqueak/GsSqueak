menu
menuPageSoundForThisPage: evt

	currentPage ifNotNil:
		[^ self menuPageSoundFor: currentPage event: evt]