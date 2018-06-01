as yet unclassified
bobsTest
	| wa answer |
"
WordArray bobsTest
"
	answer := OrderedCollection new.
	wa := WordArray with: 16r01020304 with: 16r05060708.
	{false. true} do: [ :pad | | rawData s1 s2 wa2 |
		0 to: 3 do: [ :skip |
			s1 := RWBinaryOrTextStream on: ByteArray new.

			s1 next: skip put: 0.		"start at varying positions"
			wa writeOn: s1.
			pad ifTrue: [s1 next: 4-skip put: 0].	"force length to be multiple of 4"

			rawData := s1 contents.
			s2 := RWBinaryOrTextStream with: rawData.
			s2 reset.
			s2 skip: skip.			"get to beginning of object"
			wa2 := WordArray newFromStream: s2.
			answer add: {
				rawData size. 
				skip. 
				wa2 = wa. 
				wa2 asArray collect: [ :each | each radix: 16]
			}
		].
	].
	^answer explore