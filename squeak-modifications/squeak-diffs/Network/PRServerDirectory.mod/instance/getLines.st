private
getLines
	"private - answer a collection of lines with the server response"
	| url lines string |
	url := self urlFromServer: self server directories: {'programmatic'} , self directories.
	url := url , self slash.
	""
	string := Cursor read showWhile: [
		(HTTPClient httpGetDocument: url)	contents].
	(string beginsWith: '--OK--')
		ifFalse: [^ nil].
	""
	lines := OrderedCollection new.
	(string allButFirst: 6)
		linesDo: [:line | lines add: line squeakToIso].
	""
	^ lines