#!/bin/bash
name="dataMemory.vhdl"
nam="dataMemory"
name1="dataMemory_tb.vhdl"
nam1="dataMemory_tb"
ghdl -s $name
if [ $? -eq 0 ]; then  
    echo Syntax-check OK
    ghdl -a $name
    if [ $? -eq 0 ]; then  
        echo Analyse OK
        ghdl -e $nam
        if [ $? -eq 0 ]; then  
            echo Build OK
        else
            echo Build Failed
        fi
    else
        echo Analyse Failed
    fi
else
    echo Syntax-check FAIL
fi
ghdl -s $name1
if [ $? -eq 0 ]; then  
    echo Syntax-check OK
    ghdl -a $name1
    if [ $? -eq 0 ]; then  
        echo Analyse OK
        ghdl -e $nam1
        if [ $? -eq 0 ]; then  
            echo Build OK
            ghdl -r $nam1 --vcd=testbench.vcd
            if [ $? -eq 0 ]; then  
                echo VCD-Dump OK
                gtkwave testbench.vcd
                if [ $? -eq 0 ]; then  
                    echo Starting GTKWave ...     
                else
                    echo Starting GTKWave Failed
                fi
            else
                echo VCD-Dump Failed
            fi
        else
            echo Build Failed
        fi
    else
        echo Analyse Failed
    fi
else
    echo Syntax-check FAIL
fi
