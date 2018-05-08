tests - converting
testUtf8ToSqueakByteOrderMark
	"Ensure that utf8ToSqueak ignores Byte order mark (BOM) just like UTF8TextConverter does"

	{
		#('ï»¿' '').
		#('ï»¿abc' 'abc').
		"Make sure that we remove inner BOMs for maximal compatibility with UTF8TextConverter"
		#('abcï»¿' 'abc').
		{ 'abï»¿cÓ'. 'abc', (Unicode value: 1234) asString }
	} do: [ :each |
		self assert: each first utf8ToSqueak = each second ]