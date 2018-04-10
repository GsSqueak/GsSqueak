-Tools
browseLocalSenders
	self selectedClass
		ifNotNil: [:cls | 
			| token |
			token := UIManager default request: 'browse for selector or literal'.
			token isEmpty
				ifTrue: [^ self].
			Scanner new
				typedScan: token
				do: [:scannedToken :tokenType | 
					token := tokenType = #word
								ifTrue: [(Symbol findInterned: token)
										ifNil: [^ UIManager default inform: 'no such selector: ' , token]
										ifNotNil: [:symbol | symbol]]
								ifFalse: [scannedToken].
					self systemNavigation browseAllCallsOn: token localTo: cls]]