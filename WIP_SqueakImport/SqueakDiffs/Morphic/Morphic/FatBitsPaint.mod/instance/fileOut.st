menu
fileOut

        | fileName |

	fileName := FileSaverDialog openOn: FileDirectory default.
	fileName ifNil: [^Beeper beep].
	
 	Cursor normal showWhile:  [self unmagnifiedForm writeOnFileNamed: fileName]