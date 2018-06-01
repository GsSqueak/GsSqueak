class list
classList
	"List of classes that refer to dependencies"
	classDeps ifNil: [^ #()].
	
	"classList stores the actual classes displayed in my class list, corresponding to the collection of Strings returned by self classList. This allows us to unambiguously determine the class or metaclass currently being browsed simply by knowing the index of the selected class."
	classList := ((classDeps at: self classDepsSelection ifAbsent:[#()]) 
		collect:[:mref| mref actualClass] as: Set) asArray sort: [:a :b | a name < b name].
		
	^ classList collect: #name.