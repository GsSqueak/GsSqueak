platform independent access
unsignedLong64At: index put: value bigEndian: bigEndian
	"Store a 64-bit unsigned integer quantity starting from the given byte index"
	
	| i j |
	value isLarge ifTrue: [
		i := value digitLength.
		bigEndian ifFalse: [
			self
				replaceFrom: index
					to: index + i - 1
					with: value 
					startingAt: 1;
				replaceFrom: index + i
					to: index + 7
					with: #[0 0 0 0 0 0 0 0]
					startingAt: 1.
			^value ].
		j := index + 8.
		i <= 7 ifTrue: [
			self
				replaceFrom: index
				to: j - i - 1
				with: #[0 0 0 0 0 0 0 0]
				startingAt: 1 ].
		[ 1 <= i ] whileTrue: [
			self at: j - i put: (value digitAt: i).
			i := i - 1 ].
		^value ].
	bigEndian ifFalse: [
		j := index - 1.
		i := value.
		[ 1 <= i ] whileTrue: [
			self at: (j := j + 1) put: (i bitAnd: 16rFF).
			i := i bitShift: -8 ].
		self replaceFrom: j + 1
			to: index + 7
			with: #[0 0 0 0 0 0 0 0]
			startingAt: 1.
		^value ].
	j := index + 8.
	i := value.
	[ 1 <= i ] whileTrue: [
		self at: (j := j - 1) put: (i bitAnd: 16rFF).
		i := i bitShift: -8 ].
	self replaceFrom: index
		to: j - 1
		with: #[0 0 0 0 0 0 0 0]
		startingAt: 1.
	^value
