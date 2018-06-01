-Tools
someTextPaneWithSelector: aSelector 
	"Try to find the text pane for aSelector in my dependents or my
	window. Not beautiful tho"
	^ (self dependentTextPaneWithSelector: aSelector)
		ifNil: [self textPaneWithSelector: aSelector]