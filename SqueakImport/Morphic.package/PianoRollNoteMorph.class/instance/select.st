selecting
select

	selected ifTrue: [^ self].
	selected := true.
	self changed