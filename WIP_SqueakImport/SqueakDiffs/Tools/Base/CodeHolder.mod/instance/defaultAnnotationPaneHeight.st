annotation
defaultAnnotationPaneHeight
	"Answer the receiver's preferred default height for new annotation panes."

	^ Preferences parameterAt: #defaultAnnotationPaneHeight ifAbsentPut: [25]