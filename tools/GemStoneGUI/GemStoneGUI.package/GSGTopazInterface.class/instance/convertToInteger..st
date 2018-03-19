parsing topaz output
convertToInteger: topazOutput

	^ [topazOutput asNumber asInteger] ifError: [self error: 'expected output to be an integer']