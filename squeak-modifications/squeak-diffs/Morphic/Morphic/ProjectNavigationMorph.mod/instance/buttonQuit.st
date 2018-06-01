the buttons
buttonQuit
	"Make and answer a button whose pressing will result in quitting out of Squeak."

	^self makeButton: 'QUIT' translated balloonText: 'Quit Etoys (without saving)' translated for: #quitSqueak
