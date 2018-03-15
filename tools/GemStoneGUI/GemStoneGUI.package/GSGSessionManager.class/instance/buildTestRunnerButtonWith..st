toolbuilder
buildTestRunnerButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'TestRunner';
			help: 'Open a test runner executing its test for the current session';
			action: #openTestRunner.
	^ buttonSpec