---
layout: post
title:  "CJR research"
tags: Research
categories: [Research]
mathjax: on
---
# Introduction
We use a parametric regression discontinuity design to examine how hospitals respond to CMS’ Hospital-acquired Conditions Reduction Program that imposes financial penalties on
the quartile of hospitals with the worst HAC scores. We use data from the from the Healthcare Cost and Utilization Project (HCUP) State Inpatient Database (SID) in this study. We
find no significant effects of HACRP on outcomes among Medicare patients but find that the imposition of HACRP penalties leads to significantly longer lengths of stay and more
procedures among patients covered by private insurance, accompanied by higher costs and charges per patient. On the assumption that charges reflect revenues collected, our results imply that hospitals increase the profitability of privately insured patients. Such changes are evidence of cost shifting in hospitals.

Hospital-acquired complications (HACs) are undesirable and unintended clinical conditions distinct from the main admitting diagnosis \citep{bohlouli2016risk}, which is pervasive and expensive. Report shows that, though in a decreasing trend, the rate of HACs is 86 per 1000 discharges in 2017, which equates to 2,550,000 HACs \citep{ARHQ2017HACs}. The added costs associated with these HACs are ranged from $600 to $48,000 per case. To motivate hospitals to reduce the HACs, the Centers for Medicare and Medicare Services (CMS) designed and implemented the Hospital-Acquired Conditions Reduction Program (HACRP). Under HARRP, hospitals are given an evaluation score based on different measures related to HACs. Those hospitals rank in the worst performance quantile will subject to a payment reduction punishment from CMS. In Fiscal Year 2018, 707 hospitals were penalized, which resulted in a $ 294 millions payment reduction to these hospitals \citep{vsevolozhskaya2021measurement}.


# Progress Log
2023-04-05 [rdd-costlos2-v1.do]/[rdd-costlos2_10p-v1]
regression with controls is more significant than the regression without controls:
```
	eststo: glm totcost i.payr_i payr_iXhacsdis ///
	i.year i.female age i.race i.atype i.mdc ndx i.id, ///
	link(log) family(gamma) vce(cluster id) iter(20)
	margins if u<0.1, dydx(payr_i)
```
