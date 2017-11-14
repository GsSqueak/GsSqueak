rendering
renderContentOn: html
	|userID|
	
	html heading: 'Drinky'.
	
	state == #start 
		ifTrue: [
			html form:[
				html textInput
					callback: [:value | userID := value.].
				html submitButton 
					callback: [self identifyUser: userID];
					with: 'Login']]
		 ifFalse: [
			self renderDrinkList: html.
			]