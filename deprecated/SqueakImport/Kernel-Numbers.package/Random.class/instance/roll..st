die rolling
roll: diceString
	"Roll some dice, DnD-style, according to this mini-grammar:
		dice := epxr {pm expr}
		pm := '+' | '-'
		expr := num | num dD | dD numP | num dD numP
		dD := 'd' | 'D'
		num := digit+
		numP := num | '%'"

	| stream op result |
	stream := diceString readStream.
	result := 0.
	op := #+.
	[ | res range dice token |
	token := self diceToken: stream.
	token isNumber
		ifTrue: [dice := token.
				token := self diceToken: stream]
		ifFalse: [token == $d
			ifTrue: [dice := 1]
			ifFalse: [res := 0]].
	token == $d
		ifTrue: [token := self diceToken: stream.
				token isNumber
					ifTrue: [range := token.
							token := self diceToken: stream]
					ifFalse: [token == $%
						ifTrue: [range := 100.
								token := self diceToken: stream]
						ifFalse: [range := 6]].
				res := 0.
				dice timesRepeat: [res := res + (self nextInt: range)]].
	result := result perform: op with: res.
	token ifNil: [^ result].
	(token == $+ or: [token == $-])
		ifFalse: [self error: 'unknown token ' , token].
	op := token asSymbol] repeat