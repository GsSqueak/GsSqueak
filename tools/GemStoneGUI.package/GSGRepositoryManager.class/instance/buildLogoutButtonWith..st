toolbuilder
buildLogoutButtonWith: builder

	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Logout';
		help: 'Close the current session';
		action: #logoutButtonHit;
		yourself