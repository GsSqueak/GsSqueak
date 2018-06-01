benchmarks
macroBenchmark
	"StackInterpreter macroBenchmark"
	| _gsSqueakTemp_dir |
	_gsSqueakTemp_dir := 'benchmark2.dir'.
	(FileDirectory default directoryExists: _gsSqueakTemp_dir)
		ifTrue: [(FileDirectory default directoryNamed: _gsSqueakTemp_dir) recursiveDeleteContents]
		ifFalse: [(FileDirectory default directoryNamed: _gsSqueakTemp_dir) assureExistence].
	([VMMaker
		makerFor: StackInterpreter
		and: nil
		with: #()
		to: (FileDirectory default pathFromURI: _gsSqueakTemp_dir)
		platformDir: 'none'
		excluding: (InterpreterPlugin withAllSubclasses
				collect: [:ea | ea name])]
		on: VMMakerException
		do: [:ex | "suppress bleats about non-existent platforms dir"
			ex resume: nil]) generateInterpreterFile.
	(FileDirectory default directoryNamed: _gsSqueakTemp_dir) recursiveDeleteContents; recursiveDelete