instance management
freeId

	| ids |
	ids := self instanceDict values.
	ids withIndexDo: [:id :index |
		id ~= index ifTrue: [^ index]].
	^ ids size + 1