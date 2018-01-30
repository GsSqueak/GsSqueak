printing
decimalDigitLength
	"Answer the number of digits printed out in base 10.
	 Note that this only works for positive SmallIntegers up to 63-bits."
	
	self <= 99999999 "8" ifTrue: [
		self <= 9999 "4" ifTrue: [
			self <= 99 "2" ifTrue: [
				self <= 9 "1" ifTrue: [ ^1].
				^2 ].
			self <= 999 "3" ifTrue: [ ^3].
			^4 ].
		self <= 999999 "6" ifTrue: [
			self <= 99999 "5" ifTrue: [ ^5 ].
			^6 ].
		self <= 9999999 "7" ifTrue: [ ^7 ].
		^8 ].
	self <= 1073741823 "10" ifTrue: [ "This is here only to avoid LargeInteger comparisons in 32-bit VMs"
		self <= 999999999 "9" ifTrue: [ ^9 ].
		^10 ].
	self <= 999999999999999 "15" ifTrue: [
		self <= 9999999999999 "13" ifTrue: [
			self <= 99999999999 "11" ifTrue: [
				self <= 9999999999 "10" ifTrue: [ ^10 ].
				^11 ].
			self <= 999999999999 "12" ifTrue: [ ^12 ].
			^13 ].
		self <= 99999999999999 "14" ifTrue: [ ^14 ].
		^15 ].
	self <= 99999999999999999 "17" ifTrue: [
		self <= 9999999999999999 "16" ifTrue: [ ^16 ].
		^17 ].
	self <= 999999999999999999 "18" ifTrue: [ ^18 ].
	^19 "(1 << 60 - 1) asString size"