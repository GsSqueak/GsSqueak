toolbuilder
buildContinueButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Continue';
			help: 'Continue the current transaction.';
			action: #continueTransaction.
	^ buttonSpec