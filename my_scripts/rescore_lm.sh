##!/bin/sh

lm=$1

if [ $# != 1 ]; then
 echo "Missing inputs"
 exit 1
fi

#vars
mic=ihm
old_lm=data/lang_ami_fsh.o3g.kn.pr1-7
new_lm=data/lang_${lm}
data=data/em/eval_amiconf_mfcc
in_decode=exp/${mic}/chain_cleaned/tdnn1j_sp_bi/decode_eval_amiconf_mfcc
out_decode=exp/em/lm_${lm}/${mic}

#rescore_lats
./steps/lmrescore.sh --self-loop-scale 1.0 $old_lm $new_lm $data $in_decode $out_decode
