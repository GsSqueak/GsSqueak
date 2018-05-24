toolbuilder
buildButtonPaneWith: builder
	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec 
		model: self;
		children: #getButtonRow;
		layout: #horizontal.
	^panelSpec
