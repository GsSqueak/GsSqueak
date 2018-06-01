user interface
morphicFileContentsPane

	^PluggableTextMorph 
		on: self 
		text: #contents 
		accept: #put:
		readSelection: #contentsSelection 
		menu: #fileContentsMenu:shifted:
