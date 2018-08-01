toolbuilder
buildStoneNameInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'Name of a local stone (e.g. ''stone340''';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #stoneName;
		setText: #stoneName:;
		yourself