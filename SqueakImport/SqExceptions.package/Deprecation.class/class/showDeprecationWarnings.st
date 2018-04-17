preferences
showDeprecationWarnings
	<preference: 'Show deprecation warnings' category: 'debug' description: 'Warn the user when a deprecated method is used.' type: #Boolean>
	^ ShowDeprecationWarnings ifNil: [false]