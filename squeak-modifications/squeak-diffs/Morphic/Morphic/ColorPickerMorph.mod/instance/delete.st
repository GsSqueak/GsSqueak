submorphs-add/remove
delete
	"The moment of departure has come.
	If the receiver has an affiliated command, finalize it and have the system remember it.
	In any case, delete the receiver"

	(selector isNil or: [ target isNil ]) ifFalse: [
		self rememberCommand: 
			(Command new
				cmdWording: 'color change' translated;
				undoTarget: target selector: selector arguments: (self argumentsWith: originalColor);
				redoTarget: target selector: selector arguments: (self argumentsWith: selectedColor)).
	].
	super delete