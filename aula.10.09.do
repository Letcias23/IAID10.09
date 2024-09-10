cd "C:\Users\c363208\Downloads"

import excel "C:\Users\c363208\Downloads\uf_data2.xlsx", firstrow clear
encode uf, generate(uf_num)

**# Bookmark #1 Para Depois de executar o comando encode, você pode verificar se a nova variável foi criada corretamente com os rótulos desejados
list uf uf_num

*Para garantir que os rótulos foram corretamente atribuídos, você pode usar o comando label(rotulo)
label list

encode uf, gen (uf_num)
generate regiao = ""

replace regiao = "North" if inlist(cd_uf, 11,12,13,14,15,16,17)
replace regiao = "Northeast" if inlist(cd_uf, 21,22, 23,24,25,26,27,28,29)
replace regiao = "Southeast" if inlist(cd_uf, 31,32,33,35)
replace regiao =  "south" if inlist(cd_uf, 41,42,43)
replace regiao = "central-West" if inlist(cd_uf, 50,51,52,53)
*histogram
*para memorizar os gráficos e deixa-los aberto
histogram expec_vida, frequency
histogram expec_vida
* loop
local i=1
foreach v of varlist renda_pc expec Fecun {
	histogram `v' name(graph_`i', replace) nodraw local i= `i' + 1
}
graph combine graph_1 graph_2 graph_3 graph_4
graph export "graph_hist.pdf", replice
 
*hstograma mesma variável

kdensity expec_vida

*para o exerício usar byshort