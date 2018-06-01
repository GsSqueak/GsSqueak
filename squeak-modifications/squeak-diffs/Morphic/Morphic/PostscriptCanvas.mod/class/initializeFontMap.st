font mapping
initializeFontMap
	"Initialize the dictionary mapping font names to substitutions for Postscript code generation."
	"PostscriptCanvas initializeFontMap"
	| f |
	FontMap := Dictionary new.
	FontMap
		at: 'NewYork' put: (f := self fontsForNewYork);
		at: 'Accuny' put: f;

		at: 'Helvetica' put: (f := self fontsForHelvetica);
		at: 'Accujen' put: f;
				
		at: 'Palatino' put: self fontsForPalatino;
		
		at: 'ComicBold' put: (f := self fontsForComicBold);
		at: 'Accuat' put: self fontsForAccuAt;
		
		at: 'Bitmap DejaVu Sans' put: self fontsForDejaVuSans;
		
		at: 'ComicPlain' put: self fontsForComicPlain