RM=/bin/rm
SED=/usr/bin/sed
ICONV=/usr/bin/iconv

Localize_template=Localizable.strings.sed
temp_file=l.text
working_enc=utf-8

Localizable: Localizable.strings
	${ICONV} -f utf-16 -t ${working_enc} $< | ${SED} -f ${Localize_template} > ${temp_file}
	${ICONV} -f ${working_enc} -t utf-16 ${temp_file} > $<
	${RM} ${temp_file}

checkLocalizable:
	plutil Localizable.strings