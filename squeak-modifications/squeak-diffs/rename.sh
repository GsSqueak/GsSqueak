for i in *.class;
do      
        mv "$i" $(echo "$i" | sed 's/.class/.mod/')
done
