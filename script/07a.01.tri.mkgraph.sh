
if [ -f setup.sh ]; then
  . setup.sh;
else
  echo "ERROR: setup.sh is missing!";
  exit 1;
fi
dir=graph/tri
mdl=exp/tri/final.mdl
tree=exp/tri/tree

L=decode/L.fst
G=decode/G.fst
disambig_phones=decode/disambig_phones.list

context_size=3
central_position=1
transition_scale=1.0
loop_scale=0.1

mkdir -p $dir

echo "Composing L & G to LG -> $dir/LG.fst"
fsttablecompose decode/L.fst decode/G.fst \
  | fstdeterminizestar --use-log=true \
  | fstminimizeencoded \
  > $dir/LG.fst || exit 1

echo "Composing C & LG to CLG -> $dir/CLG.fst"
fstcomposecontext --context-size=$context_size --central-position=$central_position \
 --read-disambig-syms=$disambig_phones \
 --write-disambig-syms=$dir/disambig_ilabels.list \
  $dir/ilabels < $dir/LG.fst > $dir/CLG.fst || exit 1

echo "Generating H -> $dir/Ha.fst"
make-h-transducer --disambig-syms-out=$dir/disambig_tid.list \
  --transition-scale=$transition_scale $dir/ilabels $tree $mdl \
  > $dir/Ha.fst || exit 1

echo "Composing Ha & CLG to HCLG -> $dir/HCLG.fst"
fsttablecompose $dir/Ha.fst $dir/CLG.fst \
  | fstdeterminizestar --use-log=true \
  | fstrmsymbols $dir/disambig_tid.list \
  | fstrmepslocal \
  | fstminimizeencoded \
  | add-self-loops --self-loop-scale=$loop_scale --reorder=true $mdl \
  > $dir/HCLG.fst || exit 1

sec=$SECONDS

echo ""
echo "Execution time for whole script = `utils/timer.pl $sec`"
echo ""

