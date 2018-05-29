toolbuilder
buildLoadButtonWith: builder

	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Load GsSqueak';
		help: 'Destroy your current stone.';
		action: #loadSqueak;
		yourself