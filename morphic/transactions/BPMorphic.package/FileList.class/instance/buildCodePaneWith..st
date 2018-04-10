toolbuilder
buildCodePaneWith: builder 
	| _gsSqueakTemp_textSpec |
	_gsSqueakTemp_textSpec := builder pluggableTextSpec new.
	_gsSqueakTemp_textSpec model: self;
		 getText: #contents;
		 setText: #put:;
		 selection: #contentsSelection;
		 menu: #fileContentsMenu:shifted:.
	^ _gsSqueakTemp_textSpec