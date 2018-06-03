toolbuilder
buildOsUserInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'Name of the os-user your gem will be run by (e.g. ''stlutz'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #osUser;
		editText: #osUser:;
		setText: #osUser:;
		yourself