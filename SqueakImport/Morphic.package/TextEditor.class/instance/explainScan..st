explain
explainScan: string 
	"Remove beginning and trailing space, tab, cr.
	 1/15/96 sw: copied intact from BrowserCodeController"

	| c beg end |
	beg := 1.
	end := string size.
	
	[beg = end ifTrue: [^string copyFrom: 1 to: 1].
	"if all blank, tell about the first"
	c := string at: beg.
	c = Character space or: [c = Character tab or: [c = Character cr]]]
		whileTrue: [beg := beg + 1].
	
	[c := string at: end.
	c = Character space or: [c = Character tab or: [c = Character cr]]]
		whileTrue: [end := end - 1].
	^string copyFrom: beg to: end	"Return purely visible characters"