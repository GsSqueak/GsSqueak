mv Kernel.package SqNumbers.package
cd SqNumbers.package
find -name '*.st' | xargs sed -i -E 's/<prim.*>/self halt./g'
find -name '*.json' | xargs sed -i -E 's/Kernel-Numbers/SqNumbers/g'
for i in *.class;
do      
        new=$(echo "$i" | sed 's/.class/.extension/')
        mv "$i" "$new"
done
for i in $(find -name '*.st');
do
	echo "*SqNumbers-$(cat $i)" > $i
done
find -name '*.json' | xargs sed -i -E 's/\\/\\\\/g'
