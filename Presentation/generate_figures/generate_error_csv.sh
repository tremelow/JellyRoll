#!/usr/bin/env bash

FNAME="error_exprk2_z0.csv"

touch "$FNAME"

echo -n "0 , " >> "$FNAME"
for log2dt in {2..15}; do
    echo -n "$log2dt , " >> "$FNAME"
done
echo "" >> "$FNAME"

for log2eps in {3..18}; do
    echo -n "$log2eps , " >> "$FNAME"
    for log2dt in {2..15}; do
        julia test_schemes.jl $log2eps $log2dt >> "$FNAME"
    done
    echo "" >> "$FNAME"
done
