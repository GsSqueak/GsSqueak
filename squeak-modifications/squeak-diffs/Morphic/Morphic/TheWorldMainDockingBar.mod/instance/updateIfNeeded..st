private
updateIfNeeded: aDockingBar 
	"Update the given docking bar if needed"
	| timeStamp |
	timeStamp := aDockingBar
					valueOfProperty: #mainDockingBarTimeStamp
					ifAbsent: [].
	timeStamp ~= self class timeStamp
		ifTrue:
			[aDockingBar
				 release;
				 removeAllMorphs.
			 self fillDockingBar: aDockingBar]
		ifFalse:
			[self labelIfNeeded: aDockingBar]