metaclass
setClassDefinition
	"Remember the current class definition."
	
	| theClass |
	classDefinition := nil.
	metaClassDefinition := nil.
	self hasClassSelected ifFalse: [^ self].
	theClass := self selectedClass ifNil: [ ^self ].
	classDefinition := theClass definition.
	metaClassDefinition := theClass theMetaClass definition.