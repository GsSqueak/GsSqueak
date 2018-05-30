toolbuilder
buildTextInputWith: builder
	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec 
		model: self;
		font: self textViewFont;
		getText: #inputText; 
		setText: #inputText:.
	^textSpec
