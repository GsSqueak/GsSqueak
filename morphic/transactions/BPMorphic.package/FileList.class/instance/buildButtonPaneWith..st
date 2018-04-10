toolbuilder
buildButtonPaneWith: builder 
	| _gsSqueakTemp_panelSpec |
	_gsSqueakTemp_panelSpec := builder pluggablePanelSpec new.
	_gsSqueakTemp_panelSpec model: self;
		 children: #getButtonRow;
		 layout: #horizontal.
	^ _gsSqueakTemp_panelSpec