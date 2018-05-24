toolbuilder
buildWith: builder

	^ (builder build: (builder pluggableInputFieldSpec new
		model: self;
		getText: #searchTerm;
		setText: #smartSearch:in:;
		editText: #searchTermSilently:;
		menu: #menu:shifted:;
		selection: #selection;
		indicateUnacceptedChanges: false;
		help: 'Search or evaluate...' translated))
			name: #searchBar;
			wantsFrameAdornments: false;
			yourself