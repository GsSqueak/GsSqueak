initialization
initializeWithSource: aTextOrString context: aContext receiver: recObject class: aClass environment: anEnvironment requestor: reqObject
	"self flag: #'hack'"
	"necessary to create a GS Readstream"

	self initialize.
	source := (aTextOrString isKindOf: PositionableStream)
		ifTrue: [ (GemstoneSmalltalk _env0 classNamed: #'ReadStream') _env0  on: aTextOrString contents]
		ifFalse: [ (GemstoneSmalltalk _env0 classNamed: #'ReadStream') _env0 on: aTextOrString asString ].
	context := aContext.
	receiver := recObject.
	class := aClass.
	environment := anEnvironment.
	requestor := reqObject
