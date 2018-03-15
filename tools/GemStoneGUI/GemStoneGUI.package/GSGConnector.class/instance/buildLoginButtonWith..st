toolbuilder
buildLoginButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Login';
			help: 'Log into the given stone using the provided username and password.';
			enabled: #loginButtonEnabled;
			action: #login.
	^ buttonSpec