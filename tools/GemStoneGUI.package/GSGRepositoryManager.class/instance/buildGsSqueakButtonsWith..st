toolbuilder
buildGsSqueakButtonsWith: builder

	| panelSpec load save |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		yourself.
	
	load := builder pluggableActionButtonSpec new
				model: self;
				label: 'Load GsSqueak';
				help: 'Destroy your current stone.';
				action: #loadGsSqueak;
				yourself.
				
	save := builder pluggableActionButtonSpec new
				model: self;
				label: 'Save GsSqueak';
				help: 'Destroy your current diffs.';
				action: #saveGsSqueak;
				yourself.
				
	panelSpec children addAll: {
		load.
		builder pluggableSpacerSpec new.
		save
	}.

	^ panelSpec