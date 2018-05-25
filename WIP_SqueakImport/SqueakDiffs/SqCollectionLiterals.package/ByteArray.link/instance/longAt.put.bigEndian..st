*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqByteArray-platform independent access
longAt: index put: value bigEndian: bigEndian
	"Store a 32-bit signed integer quantity starting from the given byte index"
	
	| v v2 |
	value isLarge ifTrue: [
		bigEndian ifFalse: [
			value positive ifTrue: [
				self 
					replaceFrom: index
					to: index + 3
					with: value
					startingAt: 1.
				^value ].
			v := 0.
			[ v <= 3 and: [ (v2 := ((value digitAt: v + 1) bitXor: 16rFF) + 1) = 16r100 ] ] whileTrue: [
				self at: index + v put: 0.
				v := v + 1 ].
			self at: index + v put: v2.
			v := v + 1.
			[ v <= 3 ] whileTrue: [
				self at: index + v put: ((value digitAt: (v := v + 1)) bitXor: 16rFF) ].
			^value ].
		value positive ifTrue: [
			self
				at: index put: (value digitAt: 4);
				at: index + 1 put: (value digitAt: 3);
				at: index + 2 put: (value digitAt: 2);
				at: index + 3 put: (value digitAt: 1).
			^value ].
		v := 3.
		[ 0 <= v and: [ (v2 := ((value digitAt: 4 - v) bitXor: 16rFF) + 1) = 16r100 ] ] whileTrue: [
			self at: index + v put: 0.
			v := v - 1 ].
		self at: index + v put: v2.
		[ 0 <= (v := v - 1) ] whileTrue: [
			self at: index + v put: ((value digitAt: 4 - v) bitXor: 16rFF) ].
		^value ].
	v := value bitShift: -24.
	0 <= (v := (v bitAnd: 16r7F) - (v bitAnd: 16r80)) ifFalse: [
		v := v + 16r100 ].
	bigEndian ifFalse: [
		self 
			at: index put: (value bitAnd: 16rFF);
			at: index + 1 put: ((value bitShift: -8) bitAnd: 16rFF);
			at: index + 2 put: ((value bitShift: -16) bitAnd: 16rFF);
			at: index + 3 put: v.
		^value ].
	self
		at: index put: v;
		at: index + 1 put: ((value bitShift: -16) bitAnd: 16rFF);
		at: index + 2 put: ((value bitShift: -8) bitAnd: 16rFF);
		at: index + 3 put: (value bitAnd: 16rFF).
	^value
