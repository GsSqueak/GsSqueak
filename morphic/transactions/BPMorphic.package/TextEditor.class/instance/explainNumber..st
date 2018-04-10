explain
explainNumber: string 
	"Is string a Number?"
	| _gsSqueakTemp_strm _gsSqueakTemp_c |
	(_gsSqueakTemp_c := string at: 1) isDigit
		ifFalse: [(_gsSqueakTemp_c = $-
					and: [string size > 1
							and: [(string at: 2) isDigit]])
				ifFalse: [^ nil]].
	_gsSqueakTemp_strm := ReadStream on: string.
	_gsSqueakTemp_c := Number readFrom: _gsSqueakTemp_strm.
	_gsSqueakTemp_strm atEnd
		ifFalse: [^ nil].
	_gsSqueakTemp_c printString = string
		ifTrue: [^ '"' , string , ' is a ' , _gsSqueakTemp_c class name , '"']
		ifFalse: [^ '"' , string , ' (= ' , _gsSqueakTemp_c printString , ') is a ' , _gsSqueakTemp_c class name , '"']