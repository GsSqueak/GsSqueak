fileIn/Out
verboseFileOut
	"File out the receiver, to a file whose name is a function of the change-set name and either of the date & time or chosen to have a unique numeric tag, depending on the preference 'changeSetVersionNumbers'"

	ChangeSet current fileOut.
	Transcript cr; show: 'Changes filed out ', Date dateAndTimeNow printString