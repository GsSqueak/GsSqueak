opening
windowTitle: titleString for: anObject setSelector: setSelector getSelector: getSelector
	| instance |
	
	instance := self new.
	instance 
		title: titleString;
		target: anObject;
		setSelector: setSelector;
		getSelector: getSelector.
	^instance open