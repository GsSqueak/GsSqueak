private
initPattern: aString return: aBlock 
	| result |
	self
		init: (ReadStream on: aString asString)
		cue: (SqCompilationCue source: aString)
		failBlock: [^ nil].
	encoder := self.
	result := aBlock
				value: (self pattern: false inContext: nil).
	encoder := failBlock := nil.
	"break cycles"
	^ result