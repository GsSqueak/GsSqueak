class list
selectedClass 
	"Return the base class for the current selection.  1/17/96 sw fixed up so that it doesn't fall into a debugger in a msg browser that has no message selected"

	| aClass |
	^ (aClass := self selectedClassOrMetaClass) == nil
		ifTrue:
			[nil]
		ifFalse:
			[aClass theNonMetaClass]