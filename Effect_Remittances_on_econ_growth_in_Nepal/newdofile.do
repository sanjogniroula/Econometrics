************Created by Sanjog Niroula*****************


*importing data downloaded from world bank**


import delimited "/Users/sanjogniroula/Downloads/P_Data_Extract_From_World_Development_Indicators-2/c7467847-8f9a-4933-862d-564f82258d02_Data.csv" 
drop if countrycode==""
drop timecode seriesname countrycode seriescode
rename value gfcf
rename countryname country
egen countryno=group(country)
tsset countryno time

synth_runner gfcf gfcf(1990) gfcf(1989) gfcf(1988) gfcf(1987) gfcf(1986) gfcf(1985) gfcf(1984) gfcf(1983) gfcf(1982) gfcf(1981) gfcf(1980),trunit(12) trperiod(1991) gen_vars

single_treatment_graphs, trlinediff(1) raw_gname(cigsale1_raw) effects_gname(cigsale1_effects) effects_ylabels(-30(10)30) effects_ymax(35) effects_ymin(-35)

effect_graphs , trlinediff(1) effect_gname(cigsale1_effect) tc_gname(cigsale1_tc)
	
pval_graphs , pvals_gname(cigsale1_pval) pvals_std_gname(cigsale1_pval_t)
