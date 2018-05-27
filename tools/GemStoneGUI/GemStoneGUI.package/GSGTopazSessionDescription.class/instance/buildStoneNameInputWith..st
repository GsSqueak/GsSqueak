toolbuilder
buildStoneNameInputWith: builder

	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec
		model: self;
		help: 'Name of the stone you want to connect to (e.g. ''stone340'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #stoneName;
		editText: #stoneName:;
		setText: #stoneName:.
	^ textSpec