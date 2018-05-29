private
getOnly: numberOfBytes ofProjectContents: aString 
	"private - get numberOfBytes of the project contents"
	| url args contents |
	self flag: #todo.
	"use an LRUCache"
	url := self urlFromServer: self server directories: {'programmatic'. aString}.
	""
	args := numberOfBytes isNil
				ifFalse: ['numberOfBytes=' , numberOfBytes asString].
	""
	contents := Cursor read showWhile: [
			(HTTPSocket httpGetDocument: url args: args) contents].
	""
	(contents beginsWith: '--OK--')
		ifFalse: [^ nil].
	""
	^ contents allButFirst: 6