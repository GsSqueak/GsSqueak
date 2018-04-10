private
defaultEncoderFor: aFileName 
	"This method just illustrates the stupidest possible implementation of
	encoder selection."
	| _gsSqueakTemp_l |
	_gsSqueakTemp_l := aFileName asLowercase.
	"((l endsWith: FileStream multiCs) or: [
	l endsWith: FileStream multiSt]) ifTrue: [
	^ UTF8TextConverter new.
	]
	"
	((_gsSqueakTemp_l endsWith: FileStream cs)
			or: [_gsSqueakTemp_l endsWith: FileStream st])
		ifTrue: [^ MacRomanTextConverter new].
	^ Latin1TextConverter new