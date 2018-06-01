user interface
morphicPatternPane
   | pane |
    pane := PluggableTextMorph 
		on: self 
		text: #pattern 
		accept: #pattern:.
    pane acceptOnCR: true.
   ^pane
		
