message list
messageListIndexOf: aString
	^ (self messageList collect: [:each | each selector]) indexOf: aString.