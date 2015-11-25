glmrob.nb: R code for fitting a robust negative binomial generalized linear model
---------------------------------------------------------------------------------

The glmrob.nb R code comes as a Supplementary Material to the article by Aeberhard, Cantoni and Heritier (2014).

Updates of the attached R code can be found at https://github.com/williamaeberhard. Requests/comments/bug reports should be sent to william.aeberhard@gmail.com.

### Contents

Files contained in this repository:

* glmrob.nb.r: script to run for creating the glmrob.nb function. Stand alone function, only requires package MASS for the cov.rob function used for the MVE needed when weights.on.x='hard'. See the .html help file for usage and details.
* help.glmrob.nb.html: an R documentation help file for the glmrob.nb function.
* DataSimulationEstimation.r: a script allowing to source the glmrob.nb function, simulate data at the postulated model, fit a negative binomial model to these data according to the MLE and the developed robust estimators, contaminate the data by adding a positive integer to a random proportion of the response vector, and fit the model on these contaminated data for illustration purposes.
* this README file.

### Version History

This is glmrob.nb version 0.2. The following changes were made from the original version available at the Biometrics website on Wiley Online Library:

* Added explicit argument "offset" to the main function, with default value being a vector of ones. Argument referenced in html help file.
* Deleted handling of "..." in the main function until more tests assess that all relevant arguments are correctly passed to all internal functions.
* Changed default values of tuning constants c.tukey.beta and c.tukey.sig to 5, as the previous ones were a little too likely to yield multiple solutions (depending on the design) which might have made the algorithm crash. Now, if the robust update of sigma given beta is unsuccessful (due to either multiple solutions or no solutions within the range defined by minsig and maxsig), the last value is kept and a warning is issued.
* All optional arguments are now documented in the html help file.
* Corrected some bugs related to how the weights on the design were passed on to some internal functions.
* Added optional arguments through a list in "options.wx" controlling some tuning aspects of the weights on the design (when not all set to one).

Tested on R version 3.2.2.

### References

Aeberhard, W. H., Cantoni, E. and Heritier, S. (2014) Robust Inference in the Negative Binomial Regression Model with an Application to Falls Data. Biometrics (70), 920--931.
