toolbuilder
buildPasswordInputWith: builder

	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec
		model: self;
		help: 'Password for your user (e.g. ''swordfish'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #password;
		editText: #password:;
		setText: #password:.
	^ textSpec