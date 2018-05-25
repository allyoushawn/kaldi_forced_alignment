from utils import gen_wav_scps, gen_trans_txt, gen_phone_set
from utils import gen_roots
import os
import pdb

librispeech_dir = os.environ['librispeech_root']
librispeech_type = os.environ['librispeech_type']
librispeech_type_dir = librispeech_dir + '/' + librispeech_type

#prepare wav.scp
scp = open('tmp.wav.scp', 'w')
gen_wav_scps(librispeech_type_dir, scp)
scp.close()

#prepare transcription
trans = open('tmp.text', 'w')
gen_trans_txt(librispeech_type_dir, trans)
trans.close()

