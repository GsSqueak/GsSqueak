annotation
defaultButtonPaneHeight
	"Answer the user's preferred default height for new button panes."

	^ Preferences parameterAt: #defaultButtonPaneHeight ifAbsentPut: [25]