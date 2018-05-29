toolbuilder
buildTransactionButtonsWith: builder

	| panelSpec commit continue abandon |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		yourself.
		
	commit := builder pluggableButtonSpec new
			model: self;
			label: 'commit';
			help: 'Commit to the repository';
			action: #commitTransaction;
			yourself.

	continue := builder pluggableButtonSpec new
			model: self;
			label: 'continue';
			help: 'Continue only really makes sense in a GemStone context...';
			action: #continueTransaction;
			yourself.
	
	abandon := builder pluggableButtonSpec new
			model: self;
			label: 'abort';
			help: 'Show class hierarchy';
			action: #abortTransaction;
			yourself.
	
	panelSpec children addAll: {
		commit. continue. abandon
	}.

	^ panelSpec