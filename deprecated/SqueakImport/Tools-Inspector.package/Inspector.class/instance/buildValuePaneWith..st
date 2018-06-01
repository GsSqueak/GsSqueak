toolbuilder
buildValuePaneWith: builder
	| textSpec |
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #contents; 
		setText: #accept:; 
		help: 'Selection details.';
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	^textSpec