instance creation
requestPassword: queryString
	"Create an instance of me whose question is queryString. Invoke it centered at the cursor, and answer the string the user accepts. Answer the empty string if the user cancels."
	"use password font"
	"FillInTheBlankMorph requestPassword: 'Password?'"

	^ self
		requestPassword: queryString
		initialAnswer: ''
		centerAt: Sensor cursorPoint
		inWorld: Project current world
		onCancelReturn: ''
		acceptOnCR: true
