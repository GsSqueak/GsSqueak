instance creation
string: message for: morph corner: symbol

	^ self new
		balloonOwner: morph;
		setText: message;
		orientation: symbol;
		yourself