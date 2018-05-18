instance creation
withCaption: cap chooseFrom: labels 
	"Simply put up a menu. Get the args in the right order with the caption 
	first. labels may be either an array of items or a string with CRs in it. 
	May use backslashes for returns."

	^ (labels isString
		ifTrue: [self labels: labels withCRs lines: nil]
		ifFalse: [self labelArray: labels lines: nil])
		startUpWithCaption: cap withCRs