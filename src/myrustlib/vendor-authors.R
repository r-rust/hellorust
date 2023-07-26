if(!require('jsonlite')) install.packages('jsonlite', repos = 'https://cloud.r-project.org')
metadata <- jsonlite::fromJSON(pipe("cargo metadata --format-version 1"))
packages <- metadata$packages
stopifnot(is.data.frame(packages))
authors <- vapply(sub("<.*>", "", packages$authors), function(x) paste(x, collapse = ', '), character(1))
lines <- sprintf(" - %s %s: %s", packages$name, packages$version, authors)
dir.create('../../inst', showWarnings = FALSE)
writeLines(c('Authors of vendored cargo crates', lines), '../../inst/AUTHORS')
