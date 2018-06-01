editors
openImage: aForm name: fullName saveResource: aBoolean
	"Open a view on an image. If aBoolean is true, save the image as a project resource."

	aBoolean ifTrue:
		[self resourceManager 
			addResource: aForm 
			url: (FileDirectory urlForFileNamed: fullName) asString].
	(world drawingClass withForm: aForm) openInWorld
