#!/data/data/com.termux/files/usr/bin/bash -e
#
#
[[ -z $1 ]] && printf "\n[ Escoga tipo de arquictectura aarch64 | arm ]\n\n\tuse: $0 aarch64\n\n" && exit 1
if [[ $1 = 'arm' ]]
then
	ARCH=arm
elif [[ $1 = 'aarch64' ]]
then
	ARCH=aarch64
else
	printf "[ No hay arquictectura encontrada ]\n\n"
	exit 1
fi
	#
	#
	#
cd ~/s/
dpkg-scanpackages --arch $ARCH pool/ > dists/stable/main/binary-$ARCH/Packages
#
cat dists/stable/main/binary-$ARCH/Packages | gzip -9 > dists/stable/main/binary-$ARCH/Packages.gz
#
#
#
cd ~/s/dists/stable && rm -rf Release
~/generate-release.sh > Release
