editor access
textEdited: someText 
	"Tell the model about some edits in the text if interested. This is not
	#accept, which means that it will be send on every keystroke."
	self editTextSelector
		ifNotNil: [:selector | model perform: selector with: someText]