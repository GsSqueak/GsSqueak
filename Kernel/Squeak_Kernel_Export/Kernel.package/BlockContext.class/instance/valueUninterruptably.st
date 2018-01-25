exceptions
valueUninterruptably
	"Temporarily make my home Context unable to return control to its sender, to guard against circumlocution of the ensured behavior."

	^ self ifCurtailed: [^ self]