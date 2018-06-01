private
warnAboutShadowed: name 
	requestor addWarning: name , ' is shadowed'.
	selector
		ifNotNil: [Transcript cr; show: cue getClass name , '>>' , selector , '(' , name , ' is shadowed)']