import os
import pdb




def gen_wav_scps(librispeech_type_dir, scp_f):
    for root, dirs, files in os.walk(librispeech_type_dir):
        path = root.split(os.sep)
        tmp_path = ''
        for p in path:
            if p == '':
                tmp_path += '/'
            else:
                tmp_path += p + '/'
        path = tmp_path
        for file in files:
            uttid = file.split('.')[0]
            if file.split('.')[-1] == 'txt':
                continue
            #scp_f.write(uttid + ' ' + path + file + '\n')
            scp_f.write('{} flac -c -d -s  {}{} |\n'.format(uttid, path, file))


def gen_trans_txt(librispeech_type_dir, txt_f):
    for root, dirs, files in os.walk(librispeech_type_dir):
        path = root.split(os.sep)
        tmp_path = ''
        for p in path:
            if p == '':
                tmp_path += '/'
            else:
                tmp_path += p + '/'
        path = tmp_path
        for file in files:
            if file.split('.')[-1] != 'txt':
                continue
            with open(path + '/' + file, 'r') as f:
                for line in f.readlines():
                    tokens = line.split()
                    uttid = tokens[0]
                    txt_f.write(uttid)
                    for wrd in tokens[1:]:
                        txt_f.write(' ' + wrd)
                    txt_f.write('\n')


def gen_phone_set(librispeech_dir, phn_f):
    phn_set = set()
    phn_set.add('sil')
    with open(librispeech_dir + '/librispeech-lexicon.txt', 'r') as f:
        for line in f.readlines():
            line = line.rstrip()
            tokens = line.split()
            tokens = tokens[1:]
            for token in tokens:
                phn_set.add(token)
        for phn in phn_set:
            phn_f.write(phn + '\n')


def gen_roots(phones_txt, roots_f):
    phn_list = []
    with open(phones_txt, 'r') as f:
        for line in f.readlines():
            phn_list.append(line.rstrip())
    for phn in phn_list:
        if phn == 'sil':
            roots_f.write('not-shared not-split sil\n')
        else:
            roots_f.write('shared split ' + phn + '\n')
