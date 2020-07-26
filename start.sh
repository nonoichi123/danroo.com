#!/bin/bash

if [ $# -eq "1" ]; then
  JEKYLL_ENV=production bundle exec jekyll build
else
  bundle exec jekyll serve
fi

