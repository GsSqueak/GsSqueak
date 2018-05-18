reading
pbmGetLine
	"Get the next non-comment line from the PBM stream
	Look for 'pragmas' - commands hidden in the comments"
	
 	| line |
	[
		line := self cleanLine.
		line ifNil: [^nil].
		(line size > 0 and:[(line at: 1) = $#]) ifTrue:[
			self pbmParam: line.
		].
		(line size = 0) or:[(line at: 1) = $#]
	]
 	whileTrue: [].
	^line