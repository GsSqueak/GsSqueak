accessing
url: aString

	| sd |
	aString isEmpty ifTrue: [url := nil. ^ self].

	"Expand ./ and store as an absolute url"
	sd := ServerFile new.
	sd fullPath: aString.
	url := sd realUrl.