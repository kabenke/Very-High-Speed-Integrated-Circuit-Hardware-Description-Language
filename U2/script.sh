#!/bin/bash



wait_for_result () {
    local result
    {
        ghdl $1 $2 &&
        result="OK"
    } || {
        check_result="Failed"
    }
    echo "$result"

}

wait_for_dump () {
    local result
    {
        ghdl -r $1 --vcd=$2 &&
        result="OK"
    } || {
        check_result="Failed"
    }
    echo "$result"
}

for file in "$@"
do
    filename="$(basename -- $file)"
    filepath="${file%/$filename}/"
    
    syntax_check_result="$(wait_for_result -s $file)"
    echo "$file: Syntax-Check $syntax_check_result"
    if [ "$syntax_check_result" = "Failed" ]; then
        continue
    fi
    
    analyse_check_result="$(wait_for_result -a $file)"
    echo "$file: Analyse-Check $analyse_check_result"
    if [ "$analyse_check_result" = "Failed" ]; then
        continue
    fi
    
    entity="$(grep -o -P '(?<=entity ).*(?= is)' $file)"      
    dump_result="$(wait_for_dump $entity $entity.vcd)"
    echo "$file $entity: VCD-Dump $dump_result"
    if [ "$dump_result" = "Failed" ]; then
        continue
    fi
    
    echo "Startet GTKWave"
    gtkwave "$entity.vcd"
    continue
done


