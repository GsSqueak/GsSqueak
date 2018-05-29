I support the navigation of the system. I act as a facade but as I could require some state
or different way of navigating the system all my behavior are on the instance side.


For example if you want to look at all methods you have written or changed in the current image do

SystemNavigation new browseAllSelect: [ :method |
       method fileIndex > 1 "only look at changes file"
       and: [ method timeStamp beginsWith: 'your-initials-here' ] ].

