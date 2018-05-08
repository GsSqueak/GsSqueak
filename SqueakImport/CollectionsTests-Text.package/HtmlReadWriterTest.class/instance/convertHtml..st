running
convertHtml: anHtmlString

	html := anHtmlString.
	text :=	(readWriter on: html readStream) nextText.