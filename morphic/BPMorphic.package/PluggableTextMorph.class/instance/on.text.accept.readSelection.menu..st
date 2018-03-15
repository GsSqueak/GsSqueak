initialization
on: anObject text: getTextSel accept: setTextSel readSelection: getSelectionSel menu: getMenuSel 
	self model: anObject.
	getTextSelector := getTextSel.
	setTextSelector := setTextSel.
	getSelectionSelector := getSelectionSel.
	getMenuSelector := getMenuSel.
	self setText: self getText.
	self setSelection: self getSelection