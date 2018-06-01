as yet unclassified
serverPasswords
	"Get the server passwords off the disk and decode them. The file 'sqk.info' must be in some folder that Squeak thinks is special (vm folder, or default directory).  (Note: This code works even if you are running with no system sources file.)"

	| sfile |
	(sfile := FileDirectory lookInUsualPlaces: 'sqk.info') ifNil: [^ nil].
		"If not there, Caller will ask user for password"
		"If you don't have this file, and you really do want to release an update, 
		 contact Ted Kaehler."
	^ (self decode: (sfile contentsOfEntireFile)) lines
