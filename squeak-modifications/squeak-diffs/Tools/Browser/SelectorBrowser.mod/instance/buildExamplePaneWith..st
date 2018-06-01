toolbuilder
buildExamplePaneWith: builder
	| textSpec |
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #byExample; 
		setText: #byExample:; 
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	^textSpec