toolbuilder
buildEditViewWith: builder
	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec 
		model: self;
		getText: #contents; 
		setText: #contents:notifying:; 
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	^textSpec