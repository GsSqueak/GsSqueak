as yet unclassified
testCompiler
	| myMString cc |

	myMString := 'myTestMethod
		Transcript show: # (1 - 2).'.
		
	cc := CompilationCue source: myMString class: BPCompilerTest requestor: self.
	^ (Parser new parse: myMString class: (self class)) preen.
	"Compiler new compile: cc ifFail: [self halt.]."