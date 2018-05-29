toolbuilder
buildUtilityButtonsWith: builder

	| panelSpec refresh |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		yourself.
		
	refresh := builder pluggableButtonSpec new
			model: self;
			label: 'refresh';
			help: 'Refresh all content';
			action: #invalidate;
			yourself.
			
	panelSpec children addAll: {
		refresh
	}.

	^ panelSpec