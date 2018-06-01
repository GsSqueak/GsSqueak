construction
addStayUpIcons
	| title closeBox pinBox |
	title := submorphs
				detect: [:ea | ea hasProperty: #titleString]
				ifNone: [
					"Called too soon. Will add stay-up icons when title is added."
					self setProperty: #needsTitlebarWidgets toValue: true.
					^ self].
	closeBox := SystemWindowButton new target: self;
				 actionSelector: #delete;
				 labelGraphic: self class closeBoxImage;
				 color: Color transparent;
				 extent: self class closeBoxImage extent;
				 borderWidth: 0.
	pinBox := SystemWindowButton new target: self;
				 actionSelector: #stayUp:;
				 arguments: {true};
				 labelGraphic: self class pushPinImage;
				 color: Color transparent;
				 extent: self class pushPinImage extent;
				 borderWidth: 0.
	Preferences noviceMode ifTrue: [
		closeBox setBalloonText: 'close this menu'.
		pinBox setBalloonText: 'keep this menu up'].
		
	title
		addMorphFront: closeBox;
		addMorphBack: pinBox.
		
	self setProperty: #hasTitlebarWidgets toValue: true.
	self removeProperty: #needsTitlebarWidgets.
	self removeStayUpItems