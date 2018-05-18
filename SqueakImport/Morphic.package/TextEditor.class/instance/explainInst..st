explain
explainInst: string 
	"Is string an instance variable of this class?"
	| classes cls |

	(model respondsTo: #selectedClassOrMetaClass) ifTrue: [
		cls := model selectedClassOrMetaClass].
	cls ifNil: [^ nil].	  "no class known"
	classes := (Array with: cls)
				, cls allSuperclasses.
	classes := classes detect: [:each | each instVarNames anySatisfy: [:name | name = string]] ifNone: [^nil].
	classes := classes printString.
	^ '"is an instance variable of the receiver; defined in class ' , classes , 
		'"\' withCRs , classes , ' systemNavigation browseAllAccessesTo: ''' , string , ''' from: ', classes, '.'