event handling
handle: dropStream in: pasteUp dropEvent: anEvent 
	"the file was just droped, let's do our job"
	| fileName services chosen |
	fileName := dropStream name.
	services := self servicesForFileNamed: fileName.

	"no service, default behavior"
	services isEmpty 
		ifTrue: [^UIManager default edit: dropStream contentsOfEntireFile].

	chosen := self chooseServiceFrom: services.
	chosen ifNotNil:[chosen performServiceFor: dropStream]