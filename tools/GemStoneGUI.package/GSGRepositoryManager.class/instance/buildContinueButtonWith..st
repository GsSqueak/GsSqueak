toolbuilder
buildContinueButtonWith: builder

	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Continue';
		help: 'Continue the current transaction.';
		action: #continueTransaction;
		yourself