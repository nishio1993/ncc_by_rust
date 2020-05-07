#!/bin/bash
try() {
    expected="$1"
    input="$2"

    ./target/debug/ncc_by_rust "$input" > tmp.s
    gcc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $expected OK"
    else
        echo "$input => $expected NG"
        echo "Execution result is $actual"
        clean_up
        exit 1
    fi
}
clean_up() {
    rm -rf ./tmp
    rm -rf ./tmp.s
}

cargo build

try 0 0
try 123 123

echo OK
clean_up

