fileIn/Out
writeTape
	| args b fileName |
	args := (b := self button: 'writeTape') isNil
				ifTrue: [#()]
				ifFalse: [b arguments].
	(args notEmpty
			and: [args first notEmpty])
		ifTrue: [args first.
			self writeTape: args first]
		ifFalse: [fileName := UIManager default saveFilenameRequest: 'Tape to write' initialAnswer: 'tapeName.tape'.
			fileName ifNil: [^ self].
			^ self writeTape: fileName]