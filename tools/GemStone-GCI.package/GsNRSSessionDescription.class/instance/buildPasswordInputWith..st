toolbuilder
buildPasswordInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'Password for your user (e.g. ''swordfish'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #password;
		setText: #password:;
		yourself