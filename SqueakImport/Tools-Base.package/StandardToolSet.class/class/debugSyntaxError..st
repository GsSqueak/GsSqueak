debugging
debugSyntaxError: aSyntaxErrorNotification
	"Handle a syntax error"
	| notifier |
	notifier :=  SyntaxError new setNotification: aSyntaxErrorNotification.
	SyntaxError open: notifier.