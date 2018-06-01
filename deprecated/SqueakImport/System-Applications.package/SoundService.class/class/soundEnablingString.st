preferences
soundEnablingString
	^ self soundEnabled
		ifFalse:
			['turn sound on' translated]
		ifTrue:
			['turn sound off' translated]