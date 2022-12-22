FILE(REMOVE_RECURSE
  "CMakeFiles/docs-man"
  "man/index.man"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/docs-man.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
