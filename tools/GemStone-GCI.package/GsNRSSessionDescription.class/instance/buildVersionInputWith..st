toolbuilder
buildVersionInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'The stone''s version of GemStone (e.g. ''3.4.0'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #version;
		setText: #version:;
		yourself