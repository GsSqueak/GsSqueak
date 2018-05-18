toolbuilder
buildLoadButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Load GsSqueak';
			help: 'Destroy your current stone.';
			action: #loadSqueak.
	^ buttonSpec