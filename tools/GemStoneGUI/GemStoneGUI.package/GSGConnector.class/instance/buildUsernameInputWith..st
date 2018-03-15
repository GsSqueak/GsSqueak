toolbuilder
buildUsernameInputWith: builder

	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec
		model: self;
		help: 'Name of the user you want to login as (e.g. ''DataCurator'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #username;
		editText: #username:;
		setText: #username:.
	^ textSpec