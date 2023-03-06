tempfile tmp 
import excel "D:\Drives\Github_Ortsang\ortsang.github.io\doc\data\2000CBSA2000FIPS.xlsx", ///
	sheet("CBSAs and CSAs June 6, 2003") cellrange(A3:K1840) firstrow clear
	
rename CBSACode CBSA2000
save `tmp'

use "D:\Drives\Github_Ortsang\ortsang.github.io\doc\data\2010CBSA2010FIPS.dta"
gen FIPS = fipsstatecode + fipscountycode
rename *, upper
rename CBSACODE CBSA2010
merge 1:1 FIPS using `tmp'

keep CBSA2010 CBSATITLE CBSA2000 CBSATitle

save "D:\Drives\Github_Ortsang\ortsang.github.io\doc\data\2010CBSA2000CBSA.dta"