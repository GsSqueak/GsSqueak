file in/out
storeDataOn: aDataStream
	"Write me out.  All references to other projects are weak references.  They only go out if they are written for another reason."
	| cntInstVars cntIndexedVars localInstVars offset |

	cntInstVars := self class instSize.
	cntIndexedVars := self basicSize.
	localInstVars := Project instVarNames.
	offset := Project superclass instSize.
	aDataStream
		beginInstance: self class
		size: cntInstVars + cntIndexedVars.
	1 to: cntInstVars do:
		[:ii | 
		(ii between: offset+1 and: offset + localInstVars size) 
			ifTrue: [(#('parentProject' 'previousProject' 'nextProject') includes: 
				(localInstVars at: ii-offset)) 
					ifTrue: [aDataStream nextPutWeak: (self instVarAt: ii)]
								"owner only written if in our tree"
					ifFalse: [aDataStream nextPut: (self instVarAt: ii)]]
			ifFalse: [aDataStream nextPut: (self instVarAt: ii)]].

	1 to: cntIndexedVars do:
		[:i | aDataStream nextPut: (self basicAt: i)]