Mac reader
aComment
	"To read Mac font resources.  
1) Use ResEdit in the Fonts folder in the System Folder.  Open the file of the Font you want.  (A screen font, not a TrueType outline font).
2) Open the FOND resource and scroll down to the list of sizes and resource numbers. Note the resource number of the size you want.
3) Open the NFNT resource.  Click on the number you have noted.
4) Choose 'Open Using Hex Editor' from the resource editor.
5) Copy all of the hex numbers and paste into a text editor.  Save the file into the Smalltalk folder under the name 'FontName 12 hex' (or other size).
6) Enter the fileName below and execute: 

TextStyle default fontAt: 8 put: (StrikeFont new readMacFontHex: 'fileName').

Select text and type Command-7 to change it to your new font.

(There is some problem in the ParagraphEditor with the large size of Cairo 18.  Its line heights are not the right.)
	"