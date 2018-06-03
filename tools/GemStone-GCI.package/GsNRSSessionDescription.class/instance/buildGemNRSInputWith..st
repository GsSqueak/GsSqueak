toolbuilder
buildGemNRSInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'NRS for your gem (e.g. ''!tcp@Workstation#netldi:stone340_ldi#task!gemnetobject''';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #gemNRS;
		editText: #gemNRS:;
		setText: #gemNRS:;
		yourself