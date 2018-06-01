accessing
title

	^ (title isNil or: [title isEmpty])
		ifFalse: [title]
		ifTrue: ['Choose multiple:']