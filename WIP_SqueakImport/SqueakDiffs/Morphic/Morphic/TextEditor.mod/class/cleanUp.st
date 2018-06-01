class initialization
cleanUp

	TextEditor allSubInstancesDo: [:editor |
		editor history ifNotNil: [:h | 
			h current ifNotNil: [editor closeTypeIn].
			h reset]].