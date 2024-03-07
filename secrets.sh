#!/bin/bash

cat target.txt | gau | sort -u >> allfile_links.txt;
cat target.txt | httpx -mc 200 -silent | katana -jc -aff -d 5 -jsl -kf all -iqp -silent | sort -u >> allfile_links.txt;
cat allfile_links.txt | grep -iE "\.js$" | sort -u >> jsfile_links.txt;
cat jsfile_links.txt | sort -u | httpx -mc 200 -follow-redirects -silent > live_jsfile_links.txt;

mkdir -p jsfiles
interlace -tL live_jsfile_links.txt -threads 100 -c "bash ./tools/getjsbeautify.sh '_target_'" -v

trufflehog filesystem jsfiles/ | tee trufflehog_results.txt
