*SqClasses-compiling
newCompiler
	"Answer a Compiler suitable for compiling this Behavior"
	^self compilerClass new parser: self newParser
