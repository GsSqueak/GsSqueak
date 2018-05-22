settings
scrollBarSetback
	Smalltalk isMorphic
		ifTrue: [^ 16-3]  "width = 16; inset from border by 3"
		ifFalse: [^ 24]