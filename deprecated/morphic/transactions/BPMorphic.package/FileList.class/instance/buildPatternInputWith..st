toolbuilder
buildPatternInputWith: builder 
	| _gsSqueakTemp_textSpec |
	_gsSqueakTemp_textSpec := builder pluggableInputFieldSpec new.
	_gsSqueakTemp_textSpec model: self;
		 font: self pathAndPatternFont;
		 getText: #pathAndPattern;
		 setText: #pathAndPattern:.
	^ _gsSqueakTemp_textSpec