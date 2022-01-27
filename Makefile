all: pepper samples

pepper:
	! wget -nc https://korpling.german.hu-berlin.de/saltnpepper/pepper/download/stable/Pepper_2021.03.01.zip -O Pepper.zip;
	unzip Pepper.zip

samples:
	mkdir samples
	wget -nc https://corpus-tools.org/corpora/pcc2_PAULA.zip -D samplesq
