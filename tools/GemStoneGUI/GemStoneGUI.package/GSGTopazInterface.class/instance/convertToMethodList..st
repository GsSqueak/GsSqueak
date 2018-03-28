parsing topaz output
convertToMethodList: topazOutput
  | methodProxys |

  methodProxys := Array new.
  topazOutput lines groupsOf: 4 atATimeDo: [:group | 
			methodProxys add: (GSGMethodProxy new
			   						inClass: group first;
									selector: group second;
									envId: group third;
									category: group fourth)].		
 ^methodProxys.