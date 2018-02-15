private
maybeDismiss: evt with: dismissHandle 
	"Ask hand to dismiss my target if mouse comes up in it."
	evt hand obtainHalo: self.
	(dismissHandle containsPoint: evt cursorPoint)
		ifTrue: [target resistsRemoval
				ifTrue: [(UIManager default chooseFrom: {'Yes' translated. 'Um, no, let me reconsider' translated} title: 'Really throw this away' translated)
							= 1
						ifFalse: [^ self]].
			evt hand removeHalo.
			self delete.
			target dismissViaHalo.
			ActiveWorld presenter flushPlayerListCache]
		ifFalse: [self delete.
			target addHalo: evt]