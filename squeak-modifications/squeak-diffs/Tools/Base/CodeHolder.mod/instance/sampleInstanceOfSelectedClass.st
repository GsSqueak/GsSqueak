misc
sampleInstanceOfSelectedClass
	| aClass |
	"Return a sample instance of the class currently being pointed at"
	(aClass := self selectedClassOrMetaClass) ifNil: [^ nil].
	^ aClass theNonMetaClass initializedInstance