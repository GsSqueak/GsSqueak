selecting
select: evt
	
	super select: evt.
	subMenu ifNotNil: [
		evt hand newKeyboardFocus: subMenu ]