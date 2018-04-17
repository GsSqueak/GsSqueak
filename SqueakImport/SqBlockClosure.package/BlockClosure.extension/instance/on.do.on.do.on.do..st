*SqBlockClosure-exceptions
on: exception1 do: block1 on: exception2 do: block2 on: exception3 do: block3

	^[
		self
			on: exception1
			do: block1 ]
		on: exception2
		do: block2
		on: exception3
		do: block3
