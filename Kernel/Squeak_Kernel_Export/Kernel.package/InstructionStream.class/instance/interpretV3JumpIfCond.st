decoding - private - v3 plus closures
interpretV3JumpIfCond
	"If the instruction at pc is a conditional jump, interpret it, advancing the pc,
	 and answering the jump distance. Otherwise answer nil."

	"152-159 	10011iii 		Pop and Jump 0n False iii +1 (i.e., 1 through 8)
	 168-171 	101010ii jjjjjjjj 	Pop and Jump On True ii *256+jjjjjjjj
	 172-175 	101011ii jjjjjjjj 	Pop and Jump On False ii *256+jjjjjjjj"
	| byte |
	byte := self method at: pc.
	(byte between: 152 and: 159) ifTrue:
		[pc := pc + 1.
		 ^byte - 151].
	(byte between: 168 and: 175) ifTrue:
		[pc := pc + 2.
		 ^(byte bitAnd: 3) * 256 + (self method at: pc - 1)].
	^nil