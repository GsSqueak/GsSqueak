initialize
synthesizeStackFor: receiver with: args
	self push: receiver.
	argumentCount := args size.
	1 to: argumentCount do: [:i | self push: (args at: i)].