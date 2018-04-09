cd SqArray.package
find -name '*.st' | xargs sed -i -E 's/<prim.*>//g'
for i in *.class;
do      
        new=$(echo "$i" | sed 's/.class/.extension/')
        mv "$i" "$new"
done
for i in $(find -name '*.st');
do
	echo "*SqArray-$(cat $i)" > $i
done
find -name '*.json' | xargs sed -i -E 's/\\/\\\\/g'
