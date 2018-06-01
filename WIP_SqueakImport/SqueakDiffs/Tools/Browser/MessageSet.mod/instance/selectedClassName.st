class list
selectedClassName
	"Answer the name of class of the currently selected message. Answer nil if no selection 
	exists."

	| cls |
	(cls := self selectedClass) ifNil: [^ nil].
	^ cls name