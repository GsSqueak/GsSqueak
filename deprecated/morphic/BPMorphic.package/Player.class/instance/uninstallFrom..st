misc
uninstallFrom: aPlayfield 
	"The receiver is about to be supplanted by another instance which is
	about to be installed as the current 'card' in the playfield. Exit
	gracefully "
	self runAllClosingScripts.
	self commitCardPlayerDataFrom: aPlayfield