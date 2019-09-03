# PlAcER: Plastic Accumulation Estimate using R


> ## Overview

A computational toolbox for performing simulations on the prevalence of debris in bird's nests, based on bootstrap replicates. The package allows for calculating bootstrapped 95% confidence intervals (CI) for the estimated prevalence of debris. CIs are taken as the 2.5 and 97.5 percentiles of the distributions resulting from each sample size (Efron & Tibshirani, 1993). Combined with a Bayesian approach for detecting change points in a curve with values of prevalence as functions of sample size, i.e. number of nests, the resampling simulations can be also used to define appropriate sample sizes to detect prevalence of plastics. The method has wide application, and can also be applied to estimate confidence intervals and define sample sizes for the prevalence of plastics ingested by any other organisms.

> ## Features

Efficient for performing simulation on how accurate is the estimated prevalence of plastic debris accumulated in any kind of organism or environment by using bootstrap replicates. This method works regardless of any data distribution assumptions.

Allows for assessing how many samples should be considered for obtaining an appropriate accuracy level for the estimated prevalence of debris desired in a given application.

> ## Installation

To install the package, type in the R console:

```r
install.packages('placer')
```

> ## Usage

Load the pacakge and the data containing observations of presence of plastic in nests of Caspian terns. This data comprises 529 nests of Caspian terns observed in Senegal, where “yes” = debris present and “no” = debris absent. Data obtained from Tavares et al. (2019).

```r
library("placer")
data(ctern)
```

Calculate the bootstrap prevalence probability of plastic based on a specific
number of samples. Then from the resampled data the 95% confidence intervals (CI)
are computed. To quantify the prevalence probability and the CI simply provide
the presence/absense data, the maximum number of sample sizes to test (default 300),
and the number of bootstrap simulations (default 1000) as:

```r
ternsci<-placer::plastic.ci(cterns$debris_presence, 300, 1000)
```
Where the user must first specify the presence/absence data (cterns$debris_presence), followed by he maximum number of nests considered (300), and last the number of replicates (1000). Consider that by increasing the maximum sample size the computational time substantially increases.

Plot the plastic preevalence probability and the confidence interval 
as function of sample size: 

```r
placer::prevalence_plot(ternsci$prevprob,
ternsci$cidtf$N,
ternsci$cidtf$lower_ci,
ternsci$cidtf$upper_ci)
```

Where the user must firts specify the calculated prevalence probability as obtained from plastic.ci function, then plot the correspoing sample size, confidence interval values. 

> ## Where to get help

For questions or issues about placer usage and more general questions on bootstrap simulations and applications to frequency data please use github repository (https://github.com/systemsecologygroup/PlAcE_R).

> ## References

Efron, B., & Tibshirani, R. (1993). An introduction to the Bootstrap. Boca Raton: Chapman & Hall.

Tavares, D. C., Moura, J. F., & Merico, A. (2019). Anthropogenic debris accumulated in nests of seabirds in an uninhabited island in West Africa. Biological Conservation, 236, 586–592.

Tavares, D.C., Moura, J.F., Acevedo-Trejos, E., Crawford, M., Makhado, A., Lavers, J.L., Witteveen, M., Ryan, P., Merico, A. Submitted.
