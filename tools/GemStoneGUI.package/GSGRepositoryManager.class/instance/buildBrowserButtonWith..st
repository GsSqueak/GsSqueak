toolbuilder
buildBrowserButtonWith: builder

	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Open Browser';
		help: 'Open a browser on the current session''s classes';
		action: #openBrowser;
		yourself