toolbuilder
buildSearchPaneWith: builder
	
	| panelSpec textSpec buttonSpec |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		children: OrderedCollection new;
		yourself.

	textSpec := builder pluggableInputFieldSpec new.
	textSpec 
		model: searchString;
		help: 'Type here, then hit Search.' translated;
		getText: #contents; 
		setText: #contents:;
		softLineWrap: true.
	panelSpec children add: textSpec.
		
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec 
		model: self;
		label: 'Search';
		action: #doSearch;
		horizontalResizing: #shrinkWrap.
	panelSpec children add: buttonSpec.
			
	^ panelSpec