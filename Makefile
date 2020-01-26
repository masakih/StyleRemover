
LOCALIZE_FILES=StyleRemover/Sources/LocalizedStrings.swift

.PHONY: Localizable

Localizable: $(LOCALIZE_FILES)
	genstrings -s LocalizedString -o StyleRemover/Resources/ja.lproj $^
	(cd StyleRemover/Resources/ja.lproj; ${MAKE} $@;)

