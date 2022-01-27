all: pepper samples

pepper:
	if wget -nc https://korpling.german.hu-berlin.de/saltnpepper/pepper/download/stable/Pepper_2021.03.01.zip -O Pepper.zip >&/dev/null; then \
		unzip Pepper.zip;\
	else \
		echo some issue 1>&2;\
	fi

samples:
	mkdir samples
	wget -nc https://corpus-tools.org/corpora/pcc2_PAULA.zip -D samples
