private
defaultEncoderFor: aFileName

	"This method just illustrates the stupidest possible implementation of encoder selection."
	| l |
	l := aFileName asLowercase.
"	((l endsWith: FileStream multiCs) or: [
		l endsWith: FileStream multiSt]) ifTrue: [
		^ UTF8TextConverter new.
	].
"
	((l endsWith: FileStream cs) or: [
		l endsWith: FileStream st]) ifTrue: [
		^ MacRomanTextConverter new.
	].

	^ Latin1TextConverter new.

	