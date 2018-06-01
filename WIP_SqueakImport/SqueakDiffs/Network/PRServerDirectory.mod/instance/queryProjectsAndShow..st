testing
queryProjectsAndShow: thingsToSearchForCollection 
	"query the server for all the projects that match  
	thingsToSearchForCollection"
	| url arguments string |
	url := self urlFromServer: self server directories: {'programmatic'. 'queryprojects'}.
	arguments := self getPostArgsFromThingsToSearchFor: thingsToSearchForCollection.
	""
	string := Cursor read showWhile: [
			"(HTTPClient httpPostDocument: url args:  args) contents."
			(HTTPSocket httpGetDocument: url args: arguments) contents].
	(string beginsWith: '--OK--')
		ifTrue: [^ true].
	""
	self
		inform: ('Server responded: {1}' translated format: {string}).
	^ false