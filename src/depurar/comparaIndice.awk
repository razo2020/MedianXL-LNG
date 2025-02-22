BEGIN	{
    FS = "\t"
    n = 1
    while ((getline < _ENG) > 0) {
        split($0,f,"\t")
        ind[n] = f[1]
		des[f[1]] = $0
        n = n +1
    }
} {
	if(NR == 1){
        n = split(FILENAME,na,"/")
        name = "Comparacion-"na[n]
		n = 0
		print "------------INICIO COMPARACION-------------" > name
	}
	if($1 != ind[NR]){
		print "linea "NR >> name
		print $0 >> name
		print des[ind[NR]] >> name
		n = n + 1
	}
}
END {
	print "Numero de lineas afectadas = "n >> name
}