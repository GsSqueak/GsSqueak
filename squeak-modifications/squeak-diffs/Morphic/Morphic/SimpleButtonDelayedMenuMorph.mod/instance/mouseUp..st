event handling
mouseUp: evt

	didMenu == true ifFalse: [^super mouseUp: evt].
	oldColor ifNotNil: [
		self color: oldColor.
		oldColor := nil
	].