instances
forClass: aClass
    | categoriesDict sum |

	^ self organizationDict
		at: aClass
		ifAbsentPut: [
		    categoriesDict := aClass _env0 _unifiedCategorys: 7.
		    sum := 0.

		    self new
		        basicElements: (categoriesDict values inject: Array new into: [ :accum :each | accum, (each _env0 asArray)]);
		        basicStops: (categoriesDict values collect: [ :each | sum := sum + each _env0 asArray size. sum ]);
	            setSubject: aClass;		            
                basicCategories: categoriesDict keys;
                yourself ]
                
                
                "defaultList: "
