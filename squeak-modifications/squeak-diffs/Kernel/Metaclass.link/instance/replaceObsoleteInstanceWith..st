private
replaceObsoleteInstanceWith: newInstance
	destClass class == self ifTrue:[^self error:'I am fine, thanks'].
	newInstance class == self ifFalse:[^self error:'Not an instance of me'].
	destClass := newInstance.
