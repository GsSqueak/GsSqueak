scraps
trashTitle
	| label pgs |
	label := 'T R A S H' translated.
	^ (pgs := book pages size) < 2
		ifTrue:
			[label]
		ifFalse:
			[label, ('  ({1} pages)' translated format:{pgs})]