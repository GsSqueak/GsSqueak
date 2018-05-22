submenu - windows
windowMenuItemLabelFor: window
	| s |
	s := WriteStream on: String new.
	window model canDiscardEdits ifFalse: [ s nextPut: $* ].
	window isCollapsed ifTrue: [ s nextPut: $( ].
	s nextPutAll: window label.
	window isCollapsed ifTrue: [ s nextPut: $) ].
	^s contents contractTo: 50