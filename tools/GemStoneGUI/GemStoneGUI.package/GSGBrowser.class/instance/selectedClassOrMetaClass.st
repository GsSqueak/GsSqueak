metaclass
selectedClassOrMetaClass

	| cls |
	^ self metaClassIndicated
		ifTrue: [(cls := self selectedClass) ifNil: [nil] ifNotNil: [cls theMetaClass]]
		ifFalse: [self selectedClass]