code pane menu
toggleStylingLabel

	^self shouldStyle 
		ifTrue: [ '<on> syntax highlighting' ]
		ifFalse: [ '<off> syntax highlighting' ]