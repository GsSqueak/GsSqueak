private
writeProcset
	target print:'

%%BeginProcset: Squeak-Level2-Emulation
/level1 /languagelevel where { 
	pop  languagelevel 2 lt
} {true } ifelse def
level1
{
	/rectclip {
		4 2 roll moveto
		1 index 0 rlineto
		 0 exch rlineto
		neg 0 rlineto closepath
		clip newpath
	} bind def
	/setcolorspace { pop } bind def
	/makeDict {
		counttomark 2 idiv dup dict begin
		{  def } repeat
		currentdict end exch pop
	} bind def
	/defaultDict [ /MultipleDataSources  false makeDict def
	/image {
		dup type /dicttype eq {
			defaultDict begin
			begin
				Width
				Height
				BitsPerComponent
				ImageMatrix 
				/DataSource load MultipleDataSources { aload pop } if				MultipleDataSources
				Decode length 2 idiv
			end
			end
		} if
		colorimage 
		currentfile ( ) readstring pop pop
	} bind def

	/_imagemask /imagemask load def
	/imagemask {
		dup type /dicttype eq {
			begin
				Width
				Height
				Decode 0 get 1 eq
				ImageMatrix
				/DataSource load
			end
		} if
		_imagemask 
		currentfile ( ) readstring pop pop
	} bind def
	/transparentimage {
		pop image
	} bind def

} {
	/makeDict { >> } bind def
	/transparentimage {
	  gsave
	  32 dict begin
	  /tinteger exch def
	  /transparent 1 string def
	  transparent 0 tinteger put
	  /olddict exch def
	  olddict /DataSource get dup type /filetype ne {
	    olddict /DataSource 3 -1 roll 0 () /SubFileDecode filter put
	  } {
	    pop
	  } ifelse
	  /newdict olddict maxlength dict def
	  olddict newdict copy pop
	  /w newdict /Width get def
	  /str w string def
	  /substrlen 2 w log 2 log div floor exp cvi def
	  /substrs [
	  {
	     substrlen string
	     0 1 substrlen 1 sub {
	       1 index exch tinteger put
	     } for
	     /substrlen substrlen 2 idiv def
	     substrlen 0 eq {exit} if
	  } loop
	  ] def
	  /h newdict /Height get def
	  1 w div 1 h div matrix scale
	  olddict /ImageMatrix get exch matrix concatmatrix
	  matrix invertmatrix concat
	  newdict /Height 1 put
	  newdict /DataSource str put
	  /mat [w 0 0 h 0 0] def
	  newdict /ImageMatrix mat put
	  0 1 h 1 sub {
	    mat 5 3 -1 roll neg put
	    olddict /DataSource get str readstring pop pop
	    /tail str def
	    /x 0 def
	    {
	      tail transparent search dup /done exch not def
	      {exch pop exch pop} if
	      /w1 1 index length def
	      w1 0 ne {
	        newdict /DataSource 3 -1 roll put
	        newdict /Width w1 put
	        mat 4 x neg put
	        /x x w1 add def
	        newdict image
	        /tail tail w1 tail length w1 sub getinterval def
	      } if
	      done {exit} if
	      tail substrs {
	        anchorsearch {pop} if
	      } forall
	      /tail exch def
	      tail length 0 eq {exit} if
	      /x w tail length sub def
	    } loop
	  } for
	  end
	  grestore
	} bind def
} ifelse

%%EndProcset
%%BeginProcset: Squeak-Printing
/_showpageSqueak /showpage load def
/showpage { gsave _showpageSqueak grestore } bind def
/countspaces {
	[ exch { dup 32 ne { pop } if  } forall ] length 
} bind def
/jshow { 
	10 dict begin
	/width exch def
	/str exch def
	str length 0 gt {
		str dup length 1 sub get 32 eq { /str str dup length 1 sub 0 exch getinterval def } if
		/strw str stringwidth pop def
		/diffwidth width strw sub def
		/numspaces str countspaces def
		numspaces 0 eq { /numspaces 1 def } if
		/adjspace width strw sub numspaces div def
		/adjchar 0 def
		diffwidth 0 lt {
			/adjspace adjspace 0.2 mul def
			/adjchar diffwidth str length div 0.8 mul def
		} if
		adjspace 0 32 adjchar 0 str awidthshow

	} if
	end
} bind def

/copydict {
	dup length dict begin 
		 { 1 index /FID eq 2 index /UniqueID eq and {pop pop} {  def  } ifelse } forall
	currentdict end
} bind def
/getSymbolcharproc {
	1 dict begin 
		/charstring exch def 
	 [ 550 0 0 0 650 600 /setcachedevice cvx 50 100 /translate cvx  /pop cvx 
		1 dict begin /setbbox { pop pop pop } bind def currentdict end /begin cvx   

		gsave  /Symbol 600 selectfont 0 0 moveto charstring false charpath false upath grestore

	 /exec cvx /fill cvx /end cvx ] cvx bind 
	end
} bind def
/adjustFontForSqueak		% converts _ to left-arrow, ^to upArrow and tab -> 4 spaces
{ 
	gsave dup 1000 selectfont
	dup dup findfont copydict
	begin
	CharStrings 
	/CharStrings exch copydict
	dup /leftarrow (\254) getSymbolcharproc  put
	dup /uparrow (\255) getSymbolcharproc  put
	dup /tab [ /pop cvx ( ) stringwidth pop 6 mul 0 0 0 0 0  /setcachedevice cvx ] cvx bind  put
	def
	/Encoding Encoding dup length array copy 
	dup 94 /uparrow put
	dup 95 /leftarrow put
	dup 9 /tab put
	def
	currentdict end definefont pop pop
	grestore
} bind def

%%EndProcset
'.
