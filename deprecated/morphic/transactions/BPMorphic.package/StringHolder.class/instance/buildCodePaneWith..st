toolbuilder
buildCodePaneWith: builder 
	| _gsSqueakTemp_textSpec |
	_gsSqueakTemp_textSpec := builder pluggableTextSpec new.
	_gsSqueakTemp_textSpec model: self;
		 getText: #contents;
		 setText: #contents:notifying:;
		 selection: #contentsSelection;
		 menu: #codePaneMenu:shifted:.
	^ _gsSqueakTemp_textSpec