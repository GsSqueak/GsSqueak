*System-Changes-fileIn/Out
backChunk
	"Answer the contents of the receiver back to the previous terminator character.  Doubled terminators indicate an embedded terminator character."

	| output character |
	output := WriteStream on: (String new: 1000).
	self back. "oldBack compatibility"
	[ (character := self back) == nil ] whileFalse: [
		character == $! ifTrue: [
			self back == $! ifFalse: [ 
				self skip: 2. "oldBack compatibility"
				^output contents reversed ] ].
		output nextPut: character].
	self skip: 1. "oldBack compatibility"
	^output contents reversed