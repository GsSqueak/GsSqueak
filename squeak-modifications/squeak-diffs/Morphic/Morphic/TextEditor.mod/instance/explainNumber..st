explain
explainNumber: string 
	"Is string a Number?"

	| strm c |
	(c := string at: 1) isDigit ifFalse: [(c = $- and: [string size > 1 and: [(string at: 2) isDigit]])
			ifFalse: [^nil]].
	strm := ReadStream on: string.
	c := Number readFrom: strm.
	strm atEnd ifFalse: [^nil].
	c printString = string
		ifTrue: [^'"' , string , ' is a ' , c class name , '"']
		ifFalse: [^'"' , string , ' (= ' , c printString , ') is a ' , c class name , '"']