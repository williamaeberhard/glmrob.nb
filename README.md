glmrob.nb: R code for fitting a robust negative binomial generalized linear model
---------------------------------------------------------------------------------

The glmrob.nb R code comes as a Supplementary Material to the article by Aeberhard, Cantoni and Heritier (2014).

Updates of the attached R code can be found at https://github.com/williamaeberhard. Requests/comments/bug reports should be sent to william.aeberhard@gmail.com.

### Version History

This is glmrob.nb version 0.1. The following changes were made from the original version available at the Biometrics website on Wiley Online Library:

* Added explicit argument "offset" to the main function, with as default value is a vector of ones. Argument referenced in help.glmrob.nb.html.
* Deleted handling of "..." in the main function until more tests assess that all relevant arguments are correctly passed to all glm() and lm().

Tested on R version 3.0.2.

### Contents

Files contained in this repository:

* glmrob.nb.r: script to run for creating the glmrob.nb function. Stand alone function, only requires package MASS for the cov.rob function used for the MVE needed when weights.on.x='hard'. See the .html help file for usage and details.

* help.glmrob.nb.html: an R documentation help file for the glmrob.nb function.

* DataSimulationEstimation.r: a script allowing to source the glmrob.nb function, simulate data at the postulated model, fit a negative binomial model to these data according to the MLE and the developed robust estimators, contaminate the data by adding a positive integer to a random proportion of the response vector, and fit the model on these contaminated data for illustration purposes.

* this README file.

### References

Aeberhard, W. H., Cantoni, E. and Heritier, S. (2014) Robust Inference in the Negative Binomial Regression Model with an Application to Falls Data. Biometrics (70), 920--931.
