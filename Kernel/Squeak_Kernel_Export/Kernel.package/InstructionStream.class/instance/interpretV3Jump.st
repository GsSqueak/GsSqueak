decoding - private - v3 plus closures
interpretV3Jump
	"If the instruction at pc is an unconditional jump, interpret it, advancing the pc,
	 and answering the target pc. Otherwise answer nil."

	"144-151 	10010iii 		Jump iii + 1 (i.e., 1 through 8)
	 160-167 	10100iii jjjjjjjj 	Jump(iii - 4) *256+jjjjjjjj"
	| byte |
	byte := self method at: pc.
	(byte between: 144 and: 151) ifTrue:
		[pc := pc + 1.
		 ^byte - 143].
	(byte between: 160 and: 167) ifTrue:
		[pc := pc + 2.
		 ^(byte - 164) * 256 + (self method at: pc - 1)].
	^nil