#!/bin/bash

. ./cmd.sh
. ./path.sh
. ./utils/parse_options.sh

mic=sdm1

steps/online/nnet2/extract_ivectors_online.sh --cmd "$train_cmd" --nj 30 \
data/em/eval_amiconf_mfcc \
exp/${mic}/nnet3_cleaned/extractor \
exp/${mic}/nnet3_cleaned/ivectors_eval_amiconf_mfcc

steps/nnet3/decode.sh --acwt 1.0 --post-decode-acwt 10.0 --nj 30 --cmd "$decode_cmd" \
--online-ivector-dir exp/${mic}/nnet3_cleaned/ivectors_eval_amiconf_mfcc \
--scoring-opts "--min-lmwt 5" \
exp/${mic}/chain_cleaned/tdnn1j_sp_bi/graph_ami_fsh.o3g.kn.pr1-7 \
data/em/eval_amiconf_mfcc \
exp/${mic}/chain_cleaned/tdnn1j_sp_bi/decode_eval_amiconf_mfcc

