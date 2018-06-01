tests - bitLogic
testLowBit
	| suite |

	suite := (0 to: 1024) asArray , #(16rFDFD 16rFFFF 16r1000 16r1000000 16r1000001 16r70000000 16r7AFAFAFA ) , {SmallInteger maxVal . SmallInteger maxVal+1}.
	suite := suite , (suite collect: [:e | e raisedTo: 20]).
	
	suite do: [:anInteger |
		| lowBit |
		lowBit := (anInteger respondsTo: #bitAt:)
			ifTrue: [(1 to: anInteger highBit) detect: [:bitIndex | (anInteger bitAt: bitIndex) ~= 0] ifNone: [0]]
			ifFalse: [(1 to: anInteger highBit) detect: [:bitIndex | (anInteger bitAnd: (1 bitShift: bitIndex-1)) ~= 0] ifNone: [0]].
		self assert: anInteger lowBit = lowBit.
		self assert: anInteger negated lowBit = lowBit].