#!/bin/sh

if [ $# != 1 ]; then
 echo "missing inputs"
 exit 1
fi

model=$1
lexicon=data/local/dict/lexicon.txt
lm=data/lang_exp/${1}.gz
lang_dir=data/lang_exp/${1}_dir
out_dir=data/lang_${1}

#prepare new lm from new lex
utils/prepare_lang.sh data/local/dict "<unk>" data/local_em/lang ${lang_dir}


#format lm dir
utils/format_lm.sh ${lang_dir} ${lm} ${lexicon} ${out_dir}
