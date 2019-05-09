#!/bin/sh

# generating
cd MODELS
if [ ! -e "./h-NSF" ];then
    tar -xzvf models.tar.gz
fi
cd ../



# Configuration in init.sh
# Please change the PATH of TEMP_CURRENNT_PROJECT_PYTOOLS_PATH and TEMP_CURRENNT_PROJECT_CURRENNT_PATH
export TEMP_CURRENNT_PROJECT_PYTOOLS_PATH=/work/smg/wang/GIT/TEAM/project-CURRENNT-public/pyTools/
export TEMP_CURRENNT_PROJECT_CURRENNT_PATH=/work/smg/wang/GIT/TEAM/project-CURRENNT-public/CURRENNT_codes/build/currennt
export PYTHONPATH=${PYTHONPATH}:${TEMP_CURRENNT_PROJECT_PYTOOLS_PATH}
export TEMP_CURRENNT_PROJECT_SOX_PATH=None
export TEMP_CURRENNT_PROJECT_SV56_PATH=None

# Which pre-trained model?
# s-NSF: simplified NSF
# h-NSF: harmonic-plus-noise NSF
# h-sinc-NSF: h-NSF with sinc-based trainable filters

MODEL=s-NSF

# input feature directory (equivalent to path_test_acous_feats in config.py)
export TEMP_WAVEFORM_MODEL_INPUT_DIRS=$PWD/../TESTDATA-for-pretrained/mfbsp,$PWD/../TESTDATA-for-pretrained/f0
# equivalent to gen_model_dir in config.py
export TEMP_WAVEFORM_MODEL_DIRECTORY=$PWD/MODELS/${MODEL}
# output directory for generated waveforms (equivalent to gen_output_dir in config.py)
export TEMP_WAVEFORM_OUTPUT_DIRECTORY=$PWD/MODELS/${MODEL}/output
# equivalent to gen_network_path in config.py
export TEMP_WAVEFORM_MODEL_NETWORK_PATH=$PWD/MODELS/${MODEL}/trained_network.jsn
# a temporary directory to save intermediate files (which will be deleted after generation)
export TEMP_WAVEFORM_TEMP_OUTPUT_DIRECTORY=$PWD/MODELS/${MODEL}/output_trained_tmp


python ../SCRIPTS/02_genwaveform.py config