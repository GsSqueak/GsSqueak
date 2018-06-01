ui requests
chooseFont: titleString for: aModel setSelector: setSelector getSelector: getSelector
	"Open a font-chooser for the given model"
	^FontChooserTool default
		openWithWindowTitle: titleString 
		for: aModel 
		setSelector: setSelector 
		getSelector: getSelector