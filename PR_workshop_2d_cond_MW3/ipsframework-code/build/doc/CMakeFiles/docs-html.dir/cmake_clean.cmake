FILE(REMOVE_RECURSE
  "CMakeFiles/docs-html"
  "html/index.html"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/docs-html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
