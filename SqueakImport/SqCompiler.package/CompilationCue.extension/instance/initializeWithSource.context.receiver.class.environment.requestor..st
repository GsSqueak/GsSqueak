*SqCompiler-initialization
initializeWithSource: aTextOrString context: aContext receiver: recObject class: aClass environment: anEnvironment requestor: reqObject
	self initialize.
	source := (aTextOrString isKindOf: PositionableStream)
		ifTrue: [ aTextOrString ]
		ifFalse: [ ReadStream on: aTextOrString asString ].
	context := aContext.
	receiver := recObject.
	class := aClass.
	environment := anEnvironment.
	requestor := reqObject
