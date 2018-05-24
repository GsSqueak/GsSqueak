toolbuilder
buildContentPaneWith: builder
	| textSpec |
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #contents; 
		setText: #put:; 
		selection: #contentsSelection; 
		menu: #fileContentsMenu:shifted:.
	^textSpec
