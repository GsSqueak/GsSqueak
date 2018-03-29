primitive support
tryLoadNewPlugin: pluginString pluginEntries: pluginEntries 
	"Load the plugin and if on Spur, populate pluginEntries with the
	prmitives in the plugin."
	| _gsSqueakTemp_plugin _gsSqueakTemp_realPluginClass _gsSqueakTemp_plugins _gsSqueakTemp_simulatorClasses |
	self transcript cr; show: 'Looking for module ' , pluginString.
	"Defeat loading of the FloatArrayPlugin & Matrix2x3Plugin since
	complications with 32-bit
	float support prevent simulation. If you feel up to tackling this start by
	implementing cCoerce: value to: cType
	^cType = 'float'
	ifTrue: [value asIEEE32BitWord]
	ifFalse: [value]
	in FloatArrayPlugin & Matrix2x3Plugin and then address the issues in
	the BalloonEnginePlugin.
	See
	http://forum.world.st/Simulating-the-BalloonEnginePlugin-FloatArrayPlugin-amp-Matrix2x3Plugin-primitives-td4734673.html "
	(#('FloatArrayPlugin' 'Matrix2x3Plugin') includes: pluginString)
		ifTrue: [self transcript show: ' ... defeated'.
			^ nil].
	pluginString isEmpty
		ifTrue: [_gsSqueakTemp_plugin := self]
		ifFalse: [_gsSqueakTemp_plugins := InterpreterPlugin allSubclasses
						select: [:psc | psc moduleName asString = pluginString asString].
			_gsSqueakTemp_simulatorClasses := (_gsSqueakTemp_plugins
						select: [:psc | psc simulatorClass notNil]
						thenCollect: [:psc | psc simulatorClass]) asSet.
			_gsSqueakTemp_simulatorClasses isEmpty
				ifTrue: [self transcript show: ' ... not found'.
					^ nil].
			_gsSqueakTemp_simulatorClasses size > 1
				ifTrue: [^ self error: 'This won''t work...'].
			(_gsSqueakTemp_plugins copyWithoutAll: _gsSqueakTemp_simulatorClasses) notEmpty
				ifTrue: [_gsSqueakTemp_plugins := _gsSqueakTemp_plugins copyWithoutAll: _gsSqueakTemp_simulatorClasses].
			_gsSqueakTemp_plugins size > 1
				ifTrue: [self transcript show: '...multiple plugin classes; choosing ' , _gsSqueakTemp_plugins last name].
			_gsSqueakTemp_realPluginClass := _gsSqueakTemp_plugins last.
			"hopefully lowest in the hierarchy..."
			_gsSqueakTemp_plugin := _gsSqueakTemp_simulatorClasses anyOne newFor: _gsSqueakTemp_realPluginClass.
			_gsSqueakTemp_plugin setInterpreter: objectMemory.
			"Ignore return value from setInterpreter"
			(_gsSqueakTemp_plugin respondsTo: #initialiseModule)
				ifTrue: [_gsSqueakTemp_plugin initialiseModule
						ifFalse: [self transcript show: ' ... initialiser failed'.
							^ nil]]].
	"module initialiser failed"
	self transcript show: ' ... loaded'.
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [| realPlugin cg |
			self transcript show: '...computing accessor depths'.
			_gsSqueakTemp_plugin class isPluginClass
				ifTrue: [realPlugin := (_gsSqueakTemp_plugin isSmartSyntaxPluginSimulator
								ifTrue: [_gsSqueakTemp_realPluginClass]
								ifFalse: [_gsSqueakTemp_plugin class]) withAllSuperclasses
								detect: [:class | class shouldBeTranslated].
					cg := realPlugin buildCodeGenerator]
				ifFalse: [cg := self codeGeneratorToComputeAccessorDepth.
					primitiveTable
						withIndexDo: [:prim :index | | depth | prim isSymbol
								ifTrue: [depth := cg accessorDepthForSelector: prim.
									self
										assert: (depth isInteger
												or: [depth isNil
														and: [(_gsSqueakTemp_plugin class whichClassIncludesSelector: prim) isNil]]).
									primitiveAccessorDepthTable at: index - 1 put: depth]]].
			cg exportedPrimitiveNames
				do: [:primName | 
					| fnSymbol |
					fnSymbol := primName asSymbol.
					pluginEntries addLast: {_gsSqueakTemp_plugin. fnSymbol. [_gsSqueakTemp_plugin perform: fnSymbol.
						self]. cg accessorDepthForSelector: fnSymbol}].
			self transcript show: '...done'].
	^ pluginString asString -> _gsSqueakTemp_plugin