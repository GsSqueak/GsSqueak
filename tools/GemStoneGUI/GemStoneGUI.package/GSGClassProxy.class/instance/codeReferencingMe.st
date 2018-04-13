query assembly
codeReferencingMe

	| nonMetaClassRef |
	nonMetaClassRef := self environment codeReferencingClass: self theNonMetaClass.
	^ self isMeta
		ifTrue: ['(' , nonMetaClassRef , ') class']
		ifFalse: [nonMetaClassRef]