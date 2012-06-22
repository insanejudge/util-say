install:
	javac -cp . -s src -d . src/se/kth/maandree/utilsay/*.java
	jar -cfm util-say.jar META-INF/MANIFEST.MF se/kth/maandree/utilsay/*.class
	rm -r se
	./build.sh --build-scripts
	install -d "${DESTDIR}/usr/bin"
	install -m 755 util-say{,.jar} "${DESTDIR}/usr/bin"
	install -d "${DESTDIR}/usr/share/bash-completion/completions"
	install -m 644 share/bash-completion/completions/util-say "${DESTDIR}/usr/share/bash-completion/completions/util-say"

uninstall:
	unlink "${DESTDIR}/usr/bin/util-say"
	unlink "${DESTDIR}/usr/bin/util-say.jar"
	unlink "${DESTDIR}/usr/share/bash-completion/completions/util-say"