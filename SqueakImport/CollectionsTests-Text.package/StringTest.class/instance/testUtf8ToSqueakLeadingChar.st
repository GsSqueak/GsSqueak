tests - converting
testUtf8ToSqueakLeadingChar
	"Ensure utf8ToSqueak inserts the leading char just like UTF8TextConverter does"
	| data |
	data := #[ 227 129 130 227 129 132 227 129 134 227 129 136 227 129 138 ] asString "aiueo in Japanese".
	self assert: data utf8ToSqueak = (data convertFromEncoding: #utf8)

