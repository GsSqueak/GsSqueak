*System-Changes-fileIn/Out
fileInSilentlyAnnouncing: announcement 
	"This is special for reading expressions from text that has been formatted 
	with exclamation delimitors. The expressions are read and passed to the 
	Compiler. Answer the result of compilation.  Put up a progress report with
     the given announcement as the title."

	| val chunk |
	[self atEnd] whileFalse: 
			[self skipSeparators.
			
			[val := (self peekFor: $!) 
						ifTrue: [(Compiler evaluate: self nextChunk logged: false) scanFrom: self]
						ifFalse: 
							[chunk := self nextChunk.
							self checkForPreamble: chunk.
							Compiler evaluate: chunk logged: true]] 
					on: InMidstOfFileinNotification
					do: [:ex | ex resume: true].
			self skipStyleChunk].
	self close.
	"Note:  The main purpose of this banner is to flush the changes file."
	Smalltalk  logChange: '----End fileIn of ' , self name , '----'.
	self flag: #ThisMethodShouldNotBeThere.	"sd"
	SystemNavigation new allBehaviorsDo: 
			[:cl | 
			cl
				removeSelectorSimply: #DoIt;
				removeSelectorSimply: #DoItIn:].
	^val