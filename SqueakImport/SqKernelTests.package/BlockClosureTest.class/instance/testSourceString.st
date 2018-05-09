tests - printing
testSourceString
	self assert: [] sourceString equals: '[]'.
	self assert: (#((#'[' #':arg' #| nil #']') (#'[' #':arg' #| #']')) includes: (Scanner new scanTokens: [:arg|] sourceString)).
	self assert: (Scanner new scanTokens: [ : stream | self printSourceOn: stream ] sourceString)
		equals:  #(#'[' #':stream' #| #self #printSourceOn: #stream #']')