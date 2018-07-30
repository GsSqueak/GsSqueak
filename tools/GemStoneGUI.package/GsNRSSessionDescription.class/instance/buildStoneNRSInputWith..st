toolbuilder
buildStoneNRSInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'NRS for your stone (e.g. ''!tcp@Workstation#server!stone340''';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #stoneNRS;
		setText: #stoneNRS:;
		yourself