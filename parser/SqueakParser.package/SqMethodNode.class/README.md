I am the root of the parse tree..

Instance Variables
	arguments:			<SequenceableCollection>
	block:				<BlockNode>
	encoder:			<BytecodeEncoder>
	localsPool:			<IdentitySet>
	locationCounter:	<Integer>
	precedence:		<Integer>
	primitive:			<Integer>
	properties:			<AdditionalMethodState|nil>
	selectorOrFalse:	<Object>
	sourceText:		<String|Text>
	temporaries:		<SequenceableCollection>

arguments
	- the collection of parsed or decompiled method arguments

block
	- the BlockNode holding the method's statements

encoder
	- the object that comprises the copiler's scope table, literal pool and back-end bytecode generator

localsPool
	- a set used to determine the set of copied values for each block in the method

locationCounter
	- an integer used to mark block scopes for the purposes of the closure transformation.  See BlockNode>>#analyseArguments:temporaries:rootNode:

precedence
	- the precedence of the method's selector (see Symbol>>precedence)

primitive
	- if non-zero this is the integer code of the method's primitive

properties
	- the object used to accumulate method properties (a.k.a. pragmas)

selectorOrFalse
	- the method's selector or false if this is a doit

sourceText
	- the source test from which the method was compiled

temporaries
	- the collection of parsed or decompiled method temporaries
