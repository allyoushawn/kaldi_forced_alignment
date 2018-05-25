#!/bin/bash

kaldi_root=/home/allyoushawn/kaldi
kaldi_src=$kaldi_root/src
export librispeech_root=/media/hdd/csie/corpus/librispeech
export librispeech_type=train-clean-100
export feat_loc=/media/hdd/csie/features/librispeech_feat
export data_loc=/media/hdd/csie/librispeech_data
#export frame_rate=16000



openfst_root=$kaldi_root/tools/openfst
PATH=$openfst_root/bin:$PATH
PATH=$kaldi_src/bin:$PATH
PATH=$kaldi_src/fstbin/:$PATH
PATH=$kaldi_src/gmmbin/:$PATH
PATH=$kaldi_src/featbin/:$PATH
PATH=$kaldi_src/sgmmbin/:$PATH
PATH=$kaldi_src/sgmm2bin/:$PATH
PATH=$kaldi_src/fgmmbin/:$PATH
PATH=$kaldi_src/latbin/:$PATH
PATH=$kaldi_src/nnetbin/:$PATH
export PATH=$PATH

