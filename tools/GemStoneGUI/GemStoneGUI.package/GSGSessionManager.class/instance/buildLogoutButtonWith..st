toolbuilder
buildLogoutButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Logout';
			help: 'Close the current session';
			action: #logoutButtonHit.
	^ buttonSpec