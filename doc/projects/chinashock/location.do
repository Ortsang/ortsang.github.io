clear

/*
import excel "D:\Drives\Github_Ortsang\ortsang.github.io\doc\data\2000CBSA2000FIPS.xlsx", ///
	sheet("CBSAs and CSAs June 6, 2003") cellrange(A3:K1840) firstrow
destring FIPS, replace

rename *, upper
rename CBSACODE CBSA

save `tmp1993'

use "D:\Drives\OneDrive - Cuny GradCenter\issues\chinashock-substance\data\TEDS-A\tedsa_puf_1992.dta", clear
merge m:1 CBSA using `tmp1993'
*/

cd "/Users/ortsang/Library/CloudStorage/OneDrive-CityUniversityofNewYork/issues/chinashock-substance/data"


tempfile tmp2000
use "./location/2010CBSA2010FIPS.dta", clear
gen FIPS = fipsstatecode + fipscountycode
destring FIPS, replace
rename *, upper
rename CBSACODE CBSA
save `tmp2000'

use "./location/cw_cty_czone.dta", clear
rename cty_fips FIPS

merge 1:1 FIPS using `tmp2000'
drop if _m != 3
drop _m

duplicates drop CBSA czone, force
save `tmp2000', replace

use "./China Shock/112670-V1/Public-Release-Data/dta/workfile_china.dta", clear
keep if yr == 2000
merge 1:m czone using `tmp2000'
drop if _m != 3
drop _m
destring CBSA, replace
drop if CBSA == .
collapse statefip yr t2-FIPS, by(CBSA CBSATITLE)
save `tmp2000', replace

use "./TEDS-A/tedsa_puf_2007_Stata.dta", clear
append using "./TEDS-A/tedsa_puf_2001_Stata.dta"
rename CBSA2010 CBSA

gen FEMALE = (GENDER==2)
gen SUBS_WORKINGAGE = (AGE>1&AGE<12)
gen SUBS_HIGHSCHOOL = (EDUC>2)
gen SUBS_WORKING = (EMPLOY==1|EMPLOY==2)
gen SUBS_WHITE = (RACE==5)
replace SUB1 = 19 if (SUB1<2|SUB1>5)
gen SUBS_FIRSTUNDER = (FRSTUSE1<3)
gen N = 1
collapse FEMALE-SUBS_FIRSTUNDER	(count) N, by(CBSA SUB1 ADMYR)
bysort CBSA SUB1 (ADMYR): gen d_N = N[_n+1] - N
drop if ADMYR == 2007
merge m:1 CBSA using `tmp2000'
drop if _m != 3
drop _m








tempfile tmp1993
import excel "./location/2000CBSA2000FIPS.xlsx", ///
	sheet("CBSAs and CSAs June 6, 2003") cellrange(A3:K1840) firstrow clear
rename *, upper
rename CBSACODE CBSA
destring FIPS, replace
save `tmp1993'

use "./location/cw_cty_czone.dta", clear
rename cty_fips FIPS
merge 1:1 FIPS using `tmp1993'
drop if _m != 3
drop _m
duplicates drop CBSA czone, force
save `tmp1993', replace

use "./China Shock/112670-V1/Public-Release-Data/dta/workfile_china.dta", clear
keep if yr == 1990
merge 1:m czone using `tmp1993'
drop if _m != 3
drop _m
drop if CBSA == .
collapse statefip yr t2-FIPS, by(CBSA CBSATITLE)
save `tmp1993', replace

use "./TEDS-A/tedsa_puf_1992.dta", clear
rename YEAR ADMYR

gen FEMALE = (GENDER==2)
gen SUBS_WORKINGAGE = (AGE>1&AGE<12)
gen SUBS_HIGHSCHOOL = (EDUC>2)
gen SUBS_WORKING = (EMPLOY==1|EMPLOY==2)
gen SUBS_WHITE = (RACE==5)
replace SUB1 = 19 if (SUB1<2|SUB1>5)
gen SUBS_FIRSTUNDER = (FRSTUSE1<3)
gen N = 1
collapse FEMALE-SUBS_FIRSTUNDER	(count) N, by(CBSA SUB1 ADMYR)

merge m:1 CBSA using `tmp1993'
drop if _m != 3
drop _m

append using `tmp2000'




save `tmp1993', replace




use "./TEDS-A/tedsa_puf_1992.dta", clear
rename YEAR ADMYR











import excel "./location/2000CBSA2000FIPS.xlsx", ///
	sheet("CBSAs and CSAs June 6, 2003") cellrange(A3:K1840) firstrow clear
rename *, upper
rename CBSACODE CBSA
destring FIPS, replace
save `tmp1993'

use "./location/cw_cty_czone.dta", clear
rename cty_fips FIPS
merge 1:1 FIPS using `tmp1993'
drop if _m != 3
drop _m
duplicates drop CBSA czone, force
save `tmp1993', replace

use "./China Shock/112670-V1/Public-Release-Data/dta/workfile_china.dta", clear
keep if yr == 1990
merge 1:m czone using `tmp1993'
drop if _m != 3
drop _m
drop if CBSA == .
collapse statefip yr t2-FIPS, by(CBSA CBSATITLE)
save `tmp1993', replace

use "./TEDS-A/tedsa_puf_1992.dta", clear
rename YEAR ADMYR
merge m:1 CBSA using `tmp1993'
drop if _m != 3
drop _m
save `tmp1993', replace


//=======================
//  	TEDS-A 2001
// note: CBSA using 2010
//+=======================

tempfile tmp2000 tmp2007
use "./location/2010CBSA2010FIPS.dta", clear
gen FIPS = fipsstatecode + fipscountycode
destring FIPS, replace
rename *, upper
rename CBSACODE CBSA
save `tmp2000'

use "./location/cw_cty_czone.dta", clear
rename cty_fips FIPS

merge 1:1 FIPS using `tmp2000'
drop if _m != 3
drop _m

duplicates drop CBSA czone, force
save `tmp2000', replace

use "./China Shock/112670-V1/Public-Release-Data/dta/workfile_china.dta", clear
keep if yr == 2000
merge 1:m czone using `tmp2000'
drop if _m != 3
drop _m
destring CBSA, replace
drop if CBSA == .
collapse statefip yr t2-FIPS, by(CBSA CBSATITLE)
save `tmp2000', replace
save `tmp2007', replace

use "./TEDS-A/tedsa_puf_2001_Stata.dta"
rename CBSA2010 CBSA
merge m:1 CBSA using `tmp2000'
drop if _m != 3
drop _m
save `tmp2000', replace


//=======================
//  	TEDS-A 2007
// note: CBSA using 2010
//+=======================

use "./TEDS-A/tedsa_puf_2007_Stata.dta", clear 
rename CBSA2010 CBSA
merge m:1 CBSA using `tmp2007'
drop if _m != 3
drop _m
save `tmp2007', replace

append using `tmp2000'
append using `tmp1993'

gen d_tradeusch_pw_cross = l_tradeusch_pw if ADMYR == 1992
replace d_tradeusch_pw_cross = 


/*
duplicates drop CBSA, force // 21 CBSA dropped

