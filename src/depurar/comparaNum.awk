BEGIN	{
    FS = "\t"
    while ((getline < _ENG) > 0)
		des[$1] = $2
} {
	if(NR == 1){
        n = split(FILENAME,na,"/")
        name = "Comparacion-"na[n]
		n = 0
		print "------------INICIO COMPARACION-------------" > name
	}
	if($2~/[0-9]+/){
		origen = $0
		destino = $1"\t"des[$1]
		gsub(/(ÿc[0-9]{1}|(-)?[a-zA-ZáéíóúÁÉÍÓÚñ]+(\.|,)?|[:¡!\\\/\(\) \']*)/,"",$2)
		gsub(/ÿc[0-9]{1}|(-)?[a-zA-Z]+(\.|,)?|[:¡!\\\/\(\) \']*/,"",des[$1])
		if($2!=des[$1]&&$2~/[0-9]+/&&des[$1]~/[0-9]+/){
			print "linea "NR >> name
			print "----------------------\n"$2"\n"des[$1]"\n-----------------" >> name
			print origen >> name
			print destino >> name
			n = n + 1
		}
	}
}
END {
	print "---------------------------Numero de lineas afectadas = "n"---------------" >> name
}