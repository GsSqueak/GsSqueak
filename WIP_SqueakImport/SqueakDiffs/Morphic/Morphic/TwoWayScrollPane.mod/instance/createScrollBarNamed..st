initialization
createScrollBarNamed: aString 
"creates a scroll bar named as aString"
	| result |
	result := ScrollBar new model: self slotName: aString.
	result borderWidth: 2;
		 borderColor: #inset.
	^ result