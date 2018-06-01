file in/out
urlForLoading
	"compose a url that will load me in someone's browser"
	| myServer serverList myUrl downloadUrl |
	serverList := self serverList.
	serverList isEmptyOrNil
		ifTrue: [
			urlList isEmptyOrNil ifTrue: [^nil].
			downloadUrl := urlList first asUrl downloadUrl]
		ifFalse: [
			myServer := serverList first.
			myUrl := myServer altUrl.
			myUrl last == $/
				ifFalse: [myUrl := myUrl , '/'].
			downloadUrl := myUrl].
	^downloadUrl , (self name, FileDirectory dot,'html') encodeForHTTP
