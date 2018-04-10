menu messages
explain
	"Try to shed some light on what kind of entity the current selection is. 
	The selection must be a single token or construct. Insert the answer
	after 
	the selection. Send private messages whose names begin with
	'explain' 
	that return a string if they recognize the selection, else nil."
	Cursor execute
		showWhile: [| string numbers delimitors cgVars reply selectors tiVars symbol sorry |
			sorry := '"Sorry, I can''t explain that.  Please select a single
token, construct, or special character.'.
			sorry := sorry
						, (morph canDiscardEdits
								ifTrue: ['"']
								ifFalse: ['  Also, please cancel or accept."']).
			(string := self selection asString) isEmpty
				ifTrue: [reply := '']
				ifFalse: [string := self explainScan: string.
					"Remove space, tab, cr"
					"Temps and Instance vars need only test strings that
					are all letters"
					(string
							allSatisfy: [:char | char isLetter
									or: [char isDigit]])
						ifTrue: [tiVars := self explainTemp: string.
							tiVars == nil
								ifTrue: [tiVars := self explainInst: string]].
					(tiVars == nil
							and: [model respondsTo: #explainSpecial:])
						ifTrue: [tiVars := model explainSpecial: string].
					tiVars == nil
						ifTrue: [tiVars := '']
						ifFalse: [tiVars := tiVars , '\' withCRs].
					"Context, Class, Pool, and Global vars, and Selectors
					need 
					only test symbols"
					(Symbol
							hasInterned: string
							ifTrue: [:s | symbol := s])
						ifTrue: [cgVars := self explainCtxt: symbol.
							cgVars == nil
								ifTrue: [cgVars := self explainClass: symbol.
									cgVars == nil
										ifTrue: [cgVars := self explainGlobal: symbol]].
							"See if it is a Selector (sent here or not)"
							selectors := self explainMySel: symbol.
							selectors == nil
								ifTrue: [selectors := self explainPartSel: string.
									selectors == nil
										ifTrue: [selectors := self explainAnySel: symbol]]]
						ifFalse: [selectors := self explainPartSel: string].
					cgVars == nil
						ifTrue: [cgVars := '']
						ifFalse: [cgVars := cgVars , '\' withCRs].
					selectors == nil
						ifTrue: [selectors := '']
						ifFalse: [selectors := selectors , '\' withCRs].
					string size = 1
						ifTrue: ["single special characters"
							delimitors := self explainChar: string]
						ifFalse: ["matched delimitors"
							delimitors := self explainDelimitor: string].
					numbers := self explainNumber: string.
					numbers == nil
						ifTrue: [numbers := ''].
					delimitors == nil
						ifTrue: [delimitors := ''].
					reply := tiVars , cgVars , selectors , delimitors , numbers].
			reply size = 0
				ifTrue: [reply := sorry].
			self afterSelectionInsertAndSelect: reply]