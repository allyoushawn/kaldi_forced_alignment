#
#htk_root=/home/m1010/Tools/htk
#openfst_root=/home/m1010/Tools/kaldi-trunk/tools/openfst
#kaldi_root=/home/m1010/Tools/kaldi-trunk/src
#vulcan_root=/home/m1010/Tools/vulcan

openfst_root=/home/allyoushawn/kaldi/tools/openfst
kaldi_root=/home/allyoushawn/kaldi/src

PATH=$openfst_root/bin:$PATH
PATH=$kaldi_root/bin:$PATH
PATH=$kaldi_root/fstbin/:$PATH
PATH=$kaldi_root/gmmbin/:$PATH
PATH=$kaldi_root/featbin/:$PATH
PATH=$kaldi_root/sgmmbin/:$PATH
PATH=$kaldi_root/sgmm2bin/:$PATH
PATH=$kaldi_root/fgmmbin/:$PATH
PATH=$kaldi_root/latbin/:$PATH
PATH=$kaldi_root/nnetbin/:$PATH
PATH=$kaldi_root/lmbin/:$PATH
export PATH=$PATH

export feat_loc=feat
export dev_feat_setup="cat $feat_loc/dev.39.cmvn.scp | copy-feats scp:- ark:- |"
export test_feat_setup="cat $feat_loc/test.39.cmvn.scp | copy-feats scp:- ark:- |"
export train_feat_setup="cat $feat_loc/train.39.cmvn.scp | copy-feats scp:- ark:- |"

export dev_feat_mlp="cat $feat_loc/dev.39.cmvn.scp | "
export test_feat_mlp="cat $feat_loc/test.39.cmvn.scp | "
export train_feat_mlp="cat $feat_loc/train.39.cmvn.scp | "

export cpu_num=4
