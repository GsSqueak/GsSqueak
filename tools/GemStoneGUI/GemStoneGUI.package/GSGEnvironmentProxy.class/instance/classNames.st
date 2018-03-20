classes and traits
classNames

	^ (self allClasses collect: [:class | class name]) sort