github() {
	gh repo view $1 | less
}
createanewgitbranch() {
	git branch $1
	git checkout $1
	echo "created branch $1\nswitched to it"
}
gitsywitsies() {
	gh repo view $(gh search repos $1 | tail -n 30 | awk '{print $1;}' | dmenu -l 30) | less
}
additionalthonketsforgitsywitsies() {
	combinethethonks
	gitsywitsies
}
git68() {
	git add .
	git commit -m "$1"
	git push
}
clone() {
	git clone git@github.com:$1
}
updateallofmyreposffs() {
	for psychopaths in $(find . | grep ".git$" | grep "/projects/");
	do
		cd $psychopaths
		cd ..
		git68 update
		cd;
	done
}
updateallofmyreposandbequieter() {
	updateallofmyreposffs > /dev/null
}
