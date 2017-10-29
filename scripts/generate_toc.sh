#!/bin/sh -eu
#
# Table of Contentsを自動生成する。
#
# テキストからH2ヘッダを抜きだしToCを生成する。
# ToCは、H2ヘッダへのリンクの一覧。リンクのテキストはH2のテキスト。
#
# 使用方法:
#   cat Readme.md | generate_toc.sh
#
awk '
/## [a-zA-Z ]+/{ 
     header = substr($0, 4)
     link=tolower(header)
     gsub(" ", "-", link)
     gsub(/[+":,.]/, "", link)
     printf "[%s](#%s)\n", header, link
}
'
