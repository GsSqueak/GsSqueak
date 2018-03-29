debug printing
print: s 
	"For testing in Smalltalk, this method should be overridden in a
	subclass. "
	self cCode: 'fputs(s, stdout)'