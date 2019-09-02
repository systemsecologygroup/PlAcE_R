# PlAcER: Plastic Accumulation Estimation using R


> ## Overview

A computational toolbox for performing simulations on the prevalence of debris in bird nests, based on bootstrap replicates. The package allows for calculating bootstrapped 95% confidence intervals for the estimated prevalence of debris. CIs are taken as the 2.5 and 97.5 percentiles of the distributions resulting from each sample size (Efron & Tibshirani, 1993). Combined with a Bayesian approach for detecting change points in a curve with values of prevalence as functions of sample size, i.e. number of nests, the resampling simulations can be also used to define appropriate sample sizes to detect prevalence of plastics. The method has wide application, and can also be applied to estimate confidence intervals and define sample sizes for the prevalence of plastics ingested by any other organisms. The method is described in Tavares et al. Submitted to Methods in Ecology and Evolution.

> ##Features

Efficient for performing simulation on how accurate is the estimated prevalence of plastic debris accumulated in any kind of organism or environment by using bootstrap replicates. This method works regardless of any data distribution assumptions.

Allows for assessing how many samples should be considered for obtaining an appropriate accuracy level for the estimated prevalence of debris desired in a given application.

> ## Installation

To install the package, type in the R console:
install.packages(‘placer’)

```ruby
install.packages('placer')
```

> ## Usage

Load data containing observations of presence of plastic in nests of Caspian terns. This data comprises 529 nests of Caspian terns observed in Senegal, where “yes” = debris present and “no” = debris absent. Data obtained from Tavares et al. (2019).

```{r, echo=FALSE}
library("placer"); library(rmarkdown)
library(knitr);
# data(ctern)
ctern[1:10,] %>% tbl_df %>% select(-nest_code) %>% kable(align=rep('c', 8), linesep = "\\addlinespace", booktabs = TRUE)
#  row_spec(0, bold = T, color = "white", background = "gray")
```

Calculate the bootstrap prevalence probability of plastic based on a specific
number of samples. Then from the resampled data the 95% confidence intervals (CI)
are computed. To quantify the prevalence probability and the CI simply provide
the presence/absense data, the maximum number of sample sizes to test (default 300),
and the number of bootstrap simulations (default 1000) as:

```ruby
ternsci<-placer::plastic.ci(cterns$debris_presence, 300, 1000)#300 is the maximum number 
#of nests to be considered, and 1000 is the number of replicates, for each sample size, 
#from 1 to 300. Increasing maximum sample size substantially increases computational time. 
```

Plot the plastic preevalence probability and the confidence interval 
as function of sample size: 
```{r plots, echo=FALSE, fig.cap = "Add here the figure caption"}
library(knitr)    # For knitting document and include_graphics function
ternsci<-placer::plastic.ci(ctern$debris_presence, 60, 100) 
placer::prevalence_plot(ternsci$prevprob,
ternsci$cidtf$N,
ternsci$cidtf$lower_ci,
ternsci$cidtf$upper_ci)
```

> ##Where to get help

placer_R@gmail.com for questions about placer usage and more general questions on bootstrap simulations and applications to frequency data.

> ## References

Efron, B., & Tibshirani, R. (1993). An introduction to the Bootstrap. Boca Raton: Chapman & Hall.

Tavares, D. C., Moura, J. F., & Merico, A. (2019). Anthropogenic debris accumulated in nests of seabirds in an uninhabited island in West Africa. Biological Conservation, 236, 586–592.

Tavares, D.C., Moura, J.F., Acevedo-Trejos, E., Crawford, M., Makhado, A., Lavers, J.L., Witteveen, M., Ryan, P., Merico, A. Submitted to Methods in Ecology and Evolution. 2019.