toolbuilder
buildPatternInputWith: builder
	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec 
		model: self;
		font: self pathAndPatternFont;
		getText: #pathAndPattern; 
		setText: #pathAndPattern:.
	^textSpec
