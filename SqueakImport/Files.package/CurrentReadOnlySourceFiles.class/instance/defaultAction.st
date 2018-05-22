handling
defaultAction
	"Return a read-only copy of SourceFiles."

	^SourceFiles collect: [ :each |
		each ifNotNil: [
			[ each readOnlyCopy ]
				on: FileDoesNotExistException
				do: [ :ex | nil "file does not exist happens in secure mode" ] ] ]