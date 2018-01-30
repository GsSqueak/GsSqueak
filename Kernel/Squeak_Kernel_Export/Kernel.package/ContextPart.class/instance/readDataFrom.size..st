objects from disk
readDataFrom: aDataStream size: varsOnDisk
	"Fill in the fields of self based on the contents of aDataStream.  Answer self.
	 Read in the instance-variables written by Object>>storeDataOn:.
	 NOTE: This method must send beginReference: before reading any objects from aDataStream that might reference it.
	 Allow aDataStream to have fewer inst vars.  See SmartRefStream.
	 Override to not store nil stack contents beyond stack pointer."
	| cntInstVars cntIndexedVars |

	cntInstVars := self class instSize.
	cntIndexedVars := varsOnDisk - cntInstVars.
	cntIndexedVars < 0 ifTrue:
		[self error: 'Class has changed too much.  Define a convertxxx method'].

	aDataStream beginReference: self.
	1 to: cntInstVars do:
		[:i | self instVarAt: i put: aDataStream next].
	1 to: stackp do:
		[:i | self basicAt: i put: aDataStream next].
	stackp + 1 to: cntIndexedVars do:
		[:i | aDataStream next ~~ nil ifTrue:
			[self error: 'Reading a Context''s contents expects only nil beyond top of stack']].
	"Total number read MUST be equal to varsOnDisk!"
	^self	"If we ever answer something other than self, fix calls 
			on (super readDataFrom: aDataStream size: anInteger)"