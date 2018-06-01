do-its
printIt: code result: object

	| focusedWidget |
	focusedWidget := self currentHand keyboardFocus.

	self removeResultsWidget.
	
	ToolBuilder default in: [:builder |
		resultsWidget := (builder build: (StringHolder new
			contents: object asString;
			buildCodePaneWith: builder)).
		"This might cause the widget disappear to early. Especially if the textMorph is to small but the container needs to maintain a larger size because of its scroll bars."
		resultsWidget textMorph
			on: #mouseLeave send: #delete to: resultsWidget.
		resultsWidget
			extent: 1000@1000; fullBounds; "give text a chance to layout good"
			width: 250; fullBounds;
			height: (resultsWidget extentToFit y min: 300);
			position: (focusedWidget
				ifNotNil: [:w | w owner boundsInWorld bottomLeft]
				ifNil: [self currentHand position]);
			color: (BalloonMorph balloonColor alpha: 1.0).
			
		Preferences menuAppearance3d
			ifTrue: [resultsWidget addDropShadow].
			
		resultsWidget openInWorld].