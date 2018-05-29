get the page
httpShowPage: url
	"Display the exact contents of the given URL as text. See examples in httpGet:"

	| doc |
	doc := (self httpGet: url accept: 'application/octet-stream') contents.
	doc size = 0 ifTrue: [^ self error: 'Document could not be fetched' translated].
	(StringHolder new contents: doc) openLabel: url.
