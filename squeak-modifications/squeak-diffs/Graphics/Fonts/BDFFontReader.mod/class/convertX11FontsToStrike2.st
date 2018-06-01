resource download
convertX11FontsToStrike2  "BDFFontReader convertX11FontsToStrike2"
	"Given a set of standard X11 BDF font files (probably downloaded via BDFFontReader downloadFonts), produce .sf2 format fonts.  The source and destination directory is the current directory."

	"Charter currently tickles a bug in the BDF parser.  Skip it for now."
	"self convertFilesNamed: 'charR' toFamilyNamed: 'Charter' inDirectoryNamed: ''."

	self convertFilesNamed: 'courR' toFamilyNamed: 'Courier' inDirectoryNamed: ''.
	self convertFilesNamed: 'helvR' toFamilyNamed: 'Helvetica' inDirectoryNamed: ''.

	self convertFilesNamed: 'lubR' toFamilyNamed: 'LucidaBright' inDirectoryNamed: ''.
	self convertFilesNamed: 'luRS' toFamilyNamed: 'Lucida' inDirectoryNamed: ''.
	self convertFilesNamed: 'lutRS' toFamilyNamed: 'LucidaTypewriter' inDirectoryNamed: ''.

	self convertFilesNamed: 'ncenR' toFamilyNamed: 'NewCenturySchoolbook' inDirectoryNamed: ''.
	self convertFilesNamed: 'timR' toFamilyNamed: 'TimesRoman' inDirectoryNamed: ''.