testing - largeIntegers
testLargeIntegerBugFixedInVMMakerOscog1744
	"LargeIntegersPlugin bug fixed in VMMaker.oscog-nice.1743 VMMaker-dtl.379"

	"Date: Sun, 27 Mar 2016 19:03:48 +0200
	Subject: Re: [Vm-dev] vm problem on cog and stack spur
	From: Nicolas Cellier <nicolas.cellier.aka.nice@gmail.com>
	To: Squeak Virtual Machine Development Discussion <vm-dev@lists.squeakfoundation.org>

	I reduced the failing test to:
	"

	| a b |
	a := 1598335257761788022467377781654101148543282249044465229239888363328190330275719997501596724768507889233831388734160190922469363547795602076820594918.
	b := 49612.
	self assert: a - ((a quo: b)*b) < b


	