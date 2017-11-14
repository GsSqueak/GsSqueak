rendering
renderDrinkList: html
	
	html div with:[
		self core drinks do: [ :drink |
			html div 
				class: 'drink';
				with: [html anchor
					    	callback: [self processDrink: drink];
						with: [
							html image 
								resourceUrl: '/files/DrinklistWebpageFiles/', drink asString, '.png';
								altText: drink asString;
								width: '100px']]
			].
		].

	html break.
	html div 
		with: [
			html anchor
			callback: [self state: #start];
			with: 'logout'.].