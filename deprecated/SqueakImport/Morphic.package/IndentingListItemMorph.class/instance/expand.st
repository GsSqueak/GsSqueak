container protocol
expand

 	| newChildren c |

	(self isExpanded or: [self canExpand not])
		ifTrue: [^ self].
	
	(c := self getChildren) ifEmpty: [
		"Due to the guessing in #canExpand, it may still fail here."
		^ self].

	self isExpanded: true.

	newChildren := container 
		addSubmorphsAfter: self 
		fromCollection: c 
		allowSorting: true.

	firstChild := newChildren first.