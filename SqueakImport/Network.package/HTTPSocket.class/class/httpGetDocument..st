get the page
httpGetDocument: url
	"Return the exact contents of a web page or other web object. The parsed header is saved.  Use a proxy server if one has been registered.  tk 7/23/97 17:21"
	"	HTTPSocket httpShowPage: 'http://www.altavista.digital.com/index.html'	 "
	"	HTTPSocket httpShowPage: 'www.webPage.com/~kaehler2/ab.html'	 "
	"	HTTPSocket httpShowPage: 'www.exploratorium.edu/index.html'	 "
	"	HTTPSocket httpShowPage: 'www.apple.com/default.html'	 "
	"	HTTPSocket httpShowPage: 'www.altavista.digital.com/'	 "
	"	HTTPSocket httpShowPage: 'jumbo/tedk/ab.html'	 "

	^ self httpGetDocument: url args: nil accept: 'application/octet-stream' request: ''
