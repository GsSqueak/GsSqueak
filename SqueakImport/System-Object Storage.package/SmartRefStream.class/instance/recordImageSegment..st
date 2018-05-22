read write
recordImageSegment: refs
	"Besides the objects being written out, record the structure of instances inside the image segment we are writing out."

	| list |
	"Do not record Player class inst vars.  They are in the segement."
	refs keysDo: [:each | | cls | 
		cls := each class.
		cls isObsolete ifTrue: [self error: 'Trying to write ', cls name].
		cls class == Metaclass 
			ifFalse: [structures at: cls name put: false.
				(each isKindOf: ImageSegment) ifTrue: [
					each outPointers do: [:out |
						(out isKindOf: Class) ifTrue: [
							structures at: out theNonMetaClass name put: false].
						out class == DiskProxy ifTrue: [
							out simpleGlobalOrNil ifNotNil: [
								(out simpleGlobalOrNil isKindOf: Class) ifTrue: [
									structures at: out simpleGlobalOrNil name put: false]]]].
					"each arrayOfRoots do: [:rr | (rr isKindOf: Class) ifTrue: [
							structures at: rr theNonMetaClass name put: false]]."
					 	"all classes in roots are local to seg"]]].
	list := refs at: #BlockReceiverClasses ifAbsent: [^ self].
	list do: [:meta | structures at: meta name put: false].
		"Just the metaclasses whose instances are block receivers.  Otherwise metaclasses are not allowed."