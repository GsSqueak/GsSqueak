initialization
directory: dir
	"Set the path of the volume to be displayed."

	self okToChange ifFalse: [^ self].

	self modelSleep.
	directory := dir.
	self modelWakeUp.

	sortMode == nil ifTrue: [sortMode := #date].
	volList := Array with: '[]'.
	directory ifNotNil: [
		volList := volList, directory pathParts.  "Nesting suggestion from RvL"
	].
	volList := volList withIndexCollect: [:each :i | ( String new: i-1 withAll: $ ), each].
	self changed: #relabel.
	self changed: #volumeList.
	self pattern: pattern.
	directoryChangeBlock ifNotNil: [directoryChangeBlock value: directory].