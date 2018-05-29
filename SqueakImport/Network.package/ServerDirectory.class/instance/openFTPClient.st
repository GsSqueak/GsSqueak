dis/connect
openFTPClient

	| loginSuccessful |
	client
		ifNotNil: [client isConnected
			ifTrue: [^client]
			ifFalse: [client := nil]].
	client := FTPClient openOnHostNamed: server.
	loginSuccessful := false.
	[loginSuccessful]
		whileFalse: [
			[loginSuccessful := true.
			client loginUser: self user password: self password]
				on: LoginFailedException
				do: [:ex | 
					| what |
					passwordHolder := nil.
					what := UIManager default 
						chooseFrom: #('enter password' 'give up') 
						title: 'Would you like to try another password?'.
					what = 1 ifFalse: [self error: 'Login failed.'. ^nil].
					loginSuccessful := false]].
	client changeDirectoryTo: directory.
	^client