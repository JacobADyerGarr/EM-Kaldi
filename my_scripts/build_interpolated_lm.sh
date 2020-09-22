#!/bin/sh

lm=$1
lm_conf=./lm_conf/${lm}.conf
out_lm=./language_models/${lm}.gz

./ngram -lm $lm_conf -read-mix-lms -write-lm $out_lm
