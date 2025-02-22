BEGIN	{
    FS = "\t"
    n = 1
    while ((getline < _ENG) > 0) {
        split($0,f,"\t")
        ind[n] = f[1]
		des[f[1]] = f[2]
        n = n +1
    }
} {
	if(NR == 1){
        n = split(FILENAME,na,"/")
        name = na[n]
		print ind[NR]"\t"$2 > name
	}else{
		if(des[ind[NR]]~/[uU]nused/){
			print ind[NR]"\t"des[ind[NR]] >> name
		}else{
			print ind[NR]"\t"$2 >> name
		}
	}
}