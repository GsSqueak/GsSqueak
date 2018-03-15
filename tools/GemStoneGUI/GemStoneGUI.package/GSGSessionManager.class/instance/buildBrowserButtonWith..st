toolbuilder
buildBrowserButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Browser';
			help: 'Open a browser on the current session''s classes';
			action: #openBrowser.
	^ buttonSpec