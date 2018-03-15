metaclass
setClassDefinition
	"Remember the current class definition."
	
	classDefinition := nil.
	metaClassDefinition := nil.
	self hasClassSelected ifFalse: [^ self].
	classDefinition := metaClassDefinition := self topazProxy classDefinitionFor: selectedClassName