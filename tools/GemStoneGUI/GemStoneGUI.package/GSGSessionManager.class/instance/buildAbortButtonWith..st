toolbuilder
buildAbortButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Abort';
			help: 'Abort the current transaction.';
			action: #abortTransaction.
	^ buttonSpec