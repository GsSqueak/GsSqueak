tests - instance creation
testCreationFromBytes3
	"self run: #testCreationFromBytes3"

	"it is illegal for a LargeInteger to be less than SmallInteger maxVal." 
	"here we test that Integer>>byte!byte2:byte3:byte4: resconstructs (SmallInteger maxVal - 1) as an instance of SmallInteger. "
	| maxSmallInt hexString 
    builtInteger bytes |
	maxSmallInt := SmallInteger maxVal.
	hexString := (maxSmallInt - 1) printStringHex.
	hexString size odd ifTrue:
		[hexString := '0', hexString].
	self assert: hexString size / 2 =  maxSmallInt digitLength.
	bytes := ((1 to: hexString size by: 2) collect:
				[:i| Number readFrom: (hexString copyFrom: i to: i + 1) base: 16]) reversed.
	builtInteger := bytes size > 4
					ifTrue:
						[Integer
							byte1: (bytes at: 1) byte2: (bytes at: 2) byte3: (bytes at: 3) byte4: (bytes at: 4)
							byte5: (bytes at: 5) byte6: (bytes at: 6) byte7: (bytes at: 7) byte8: (bytes at: 8)]
					ifFalse:
						[Integer
							byte1: (bytes at: 1) byte2: (bytes at: 2) byte3: (bytes at: 3) byte4: (bytes at: 4)].
	self assert: builtInteger = (maxSmallInt - 1).
	self assert: builtInteger class = SmallInteger
