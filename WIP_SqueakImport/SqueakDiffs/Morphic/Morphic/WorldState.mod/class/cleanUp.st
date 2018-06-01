class initialization
cleanUp
	"Reset command histories"

	self allInstances do: [ :ea | ea clearCommandHistory ].