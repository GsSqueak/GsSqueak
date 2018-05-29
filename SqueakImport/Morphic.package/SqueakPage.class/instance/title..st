accessing
title: aString

	aString isEmpty
		ifTrue: [title := nil]
		ifFalse: [title := aString].
