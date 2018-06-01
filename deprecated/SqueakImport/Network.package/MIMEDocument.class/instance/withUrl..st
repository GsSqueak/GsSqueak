converting
withUrl: newUrl
	"return an identical document except that the URL has been modified"
	^MIMEDocument contentType: self contentType  content: self content url: newUrl