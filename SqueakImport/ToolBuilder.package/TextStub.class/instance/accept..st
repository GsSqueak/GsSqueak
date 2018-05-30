simulating
accept: aString
	state at: #getText put: aString.
	^ self model perform: spec setText with: aString asText