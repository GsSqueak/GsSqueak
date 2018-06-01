class list
recent
	"Let the user select from a list of recently visited classes.  11/96 stp.
	 12/96 di:  use class name, not classes themselves.
	 : dont fall into debugger in empty case"

	| className class recentList |
	recentList := (RecentClasses reject: [:s | s = self selectedClassName]) select: [:n | Smalltalk hasClassNamed: n].
	recentList size = 0 ifTrue: [^ Beeper beep].
	className := UIManager default chooseFrom: recentList values: recentList.
	className == nil ifTrue: [^ self].
	
	self okToChange ifFalse: [^ self].

	class := Smalltalk at: className.
	self selectCategoryForClass: class.
	self classListIndex: (self classListIndexOf: class name)