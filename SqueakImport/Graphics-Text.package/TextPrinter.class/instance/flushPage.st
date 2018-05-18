printing
flushPage
	"The current page has been set up. Send it to the printer."
	form primPrintHScale: self resolution x vScale: self resolution y landscape: self landscape.
	"Uncomment the following for testing"
	"form displayOn: Display. (Delay forSeconds: 5) wait."
