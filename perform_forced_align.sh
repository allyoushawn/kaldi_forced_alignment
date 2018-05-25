model=exp/mono/final.mdl
frame_shift=0.01
print_silence=false
oov=`cat lang/oov.int` || exit 1;

linear-to-nbest ark:exp/mono/dev.ali \
      ark:"utils/kaldi_sym2int.pl --map-oov $oov -f 2- lang/words.txt material/dev.text |" '' '' ark:- | \
lattice-align-words lang/phones/word_boundary.int $model ark:- ark:- | \
nbest-to-ctm --frame-shift=$frame_shift --print-silence=$print_silence ark:- - | \
utils/kaldi_int2sym.pl -f 5 lang/words.txt >dev.ctm
