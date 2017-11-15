#!/bin/bash
# Copyright 2017 Aleksander Gajewski <adiog@brainfuck.pl>
#   created:  wto, 31 paź 2017, 21:14:55
#   modified: wto, 31 paź 2017, 21:39:59

# BASH_CLEANUP {{{
BASH_CLEANUP_FILE=`mktemp`
trap BASH_CLEANUP EXIT

function BASH_CLEANUP() {
  BASH_CLEANUP_FILE_REV=`mktemp`
  tac $BASH_CLEANUP_FILE > $BASH_CLEANUP_FILE_REV
  . $BASH_CLEANUP_FILE_REV
  rm $BASH_CLEANUP_FILE $BASH_CLEANUP_FILE_REV
}

function BASH_FINALLY() {
  echo "$*" >> $BASH_CLEANUP_FILE
}

function BASH_MKTEMP() {
  BASH_TMP=`mktemp`
  echo "rm $BASH_TMP" >> $BASH_CLEANUP_FILE
  echo $BASH_TMP
}

function BASH_MKTEMP_DIR() {
  BASH_TMP=`mktemp -d`
  echo "rm -fr $BASH_TMP" >> $BASH_CLEANUP_FILE
  echo $BASH_TMP
}
# }}}

BRANCH=release_50

clone()
{
  REPO=$1
  TARGET=$2
  mkdir -p $(dirname ${TARGET})
  git clone --recursive https://github.com/llvm-mirror/${REPO} ${TARGET}
  (cd ${TARGET} && git checkout ${BRANCH})
}

clone llvm              /llvm
clone clang             /llvm/tools/clang
clone clang-tools-extra /llvm/tools/clang/tools/extra
clone lld               /llvm/tools/lld
clone polly             /llvm/tools/polly
clone compiler-rt       /llvm/projects/compiler-rt
clone openmp            /llvm/projects/openmp
clone libcxx            /llvm/projects/libcxx
clone libcxxabi         /llvm/projects/libcxxabi

