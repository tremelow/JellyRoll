#!/usr/bin/env bash

FNAME="error_strang_x_v2.csv"
echo "Generating $FNAME"

touch "$FNAME"

echo -n "0 , " >> "$FNAME"
for log2dt in {2..14}; do
    echo -n "$log2dt , " >> "$FNAME"
done
echo "" >> "$FNAME"

for log2eps in {6..21}; do
    echo -n "$log2eps , " >> "$FNAME"
    for log2dt in {2..14}; do
        julia test_schemes.jl $log2eps $log2dt >> "$FNAME"
    done
    echo "" >> "$FNAME"
    echo "Done with eps = 2^-$log2eps"
done
