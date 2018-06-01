model access
previewKeystroke: event
	"Let the model decide if it's going to handle the event for us"

	^ keystrokePreviewSelector 
		ifNil: [ false ]
		ifNotNil: [ model perform: keystrokePreviewSelector with: event ]