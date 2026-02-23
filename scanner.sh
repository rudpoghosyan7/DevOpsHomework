read -p "Enter Directory: " PathName
read -p "Scan subdirectories (y/n): " recursively

echo $PathName

if [ "$recursively" == "y" ]; then 

    temp=""
    size=0
    for file in $(find "$PathName" -type f); do
        s=$(stat -f%z "$file")
        if [ "$s" -gt "$size" ]; then
            size=$s
            temp=$file
        fi
    done
    echo "$temp"


elif [ "$recursively" == "n" ]; then

    temp=$(ls -lS "$PathName" | grep -v '^total' | head -n 1)
    echo $temp


else
    echo "Something went wrong. Try again!"
fi