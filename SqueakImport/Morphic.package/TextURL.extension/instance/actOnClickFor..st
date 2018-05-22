*Morphic
actOnClickFor: anObject
	"Do what you can with this URL.  Later a web browser."

	| m |

	(url beginsWith: 'sqPr://') ifTrue: [
		ProjectLoading thumbnailFromUrl: (url copyFrom: 8 to: url size).
		^ true		"should not get here, but what the heck"
	].
	(url beginsWith: 'code://') ifTrue: [
		Project current addDeferredUIMessage: [self open: (Compiler evaluate: (url allButFirst: 7))].
		^ true		"should not get here, but what the heck"
	].
	"if it's a web browser, tell it to jump"
	anObject isWebBrowser
		ifTrue: [anObject jumpToUrl: url. ^ true]
		ifFalse: [((anObject respondsTo: #model) and: [anObject model isWebBrowser])
				ifTrue: [anObject model jumpToUrl: url. ^ true]].

		"if it's a morph, see if it is contained in a web browser"
		(anObject isKindOf: Morph) ifTrue: [
			m := anObject.
			[ m ~= nil ] whileTrue: [
				(m isWebBrowser) ifTrue: [
					m  jumpToUrl: url.
					^true ].
				(m hasProperty: #webBrowserView) ifTrue: [
					m model jumpToUrl: url.
					^true ].
				m := m owner. ]
		].

	"no browser in sight.  ask if we should start a new browser"
	WebBrowser defaultOrNil
		ifNil: [Clipboard clipboardText: url]
		ifNotNil: [:wb |
			(UIManager default
				confirm: ('Do you want to open this URL in a Web browser?\\{1}' translated withCRs format: {url})
				title: 'Open Web Page' translated)
					ifTrue: [wb openOnUrl: url].
					^ true ].

	"Couldn't display in a browser.  Offer to put up just the source"
	(UIManager default
		confirm: ('There is no Web browser installed but the URL was copied to the clipboard:\{1}\\Do you want to view the Web page''s source/response anyway?' translated withCRs format: {url})
		title: 'Open Web Page' translated)
		
		ifTrue: [
			(Smalltalk classNamed: 'WebClient')
				ifNotNil: [:wc | Project current addDeferredUIMessage: [(wc httpGet: url) explore]]
				ifNil: [HTTPSocket httpShowPage: url]].
	
	^ true