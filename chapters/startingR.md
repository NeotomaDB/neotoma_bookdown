## Using R

The [`neotoma2` R package](https://github.com/NeotomaDB/neotoma2) provides a set of functions to download and work with data from Neotoma within the R programming environment. The package has been designed for users who wish to work with multiple sites or datasets, and supports users who wish to add their own data into Neotoma.

The functions in the R package act as *wrappers* for the API calls, and also provide some secondary services to help the data work efficiently in the R environment. For example, a user who wishes to search for all sites named 'Marion Lake' using R simply uses the `get_sites()` function:

```{r}
library(neotoma2)
marion <- get_sites(sitename = "Marion Lake")
marion
```

The following sections will detail several workflows using the R package. To help the end user we have created an instance of RStudio that is available from the browser, with all packages installed. You can access this version of RStudio from the [myBinder link](https://mybinder.org/v2/gh/NeotomaDB/Current_Workshop/main?urlpath=rstudio):

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/NeotomaDB/Current_Workshop/main?urlpath=rstudio)

While many of our examples are drawn directly from existing workshop materials, you may find more complete details about using the R package on the GitHub page for the package, or in one or more of our posted workshops:

* European Pollen Database Workshop (May 22, 2022 -- [https://open.neotomadb.org/EPD_binder/simple_workflow.html]())
* AMQUA Pollen Workshop (May 22, 2022 -- [https://open.neotomadb.org/Workshops/AMQUA-June2022/simple_workflow.html]())
* IAL/IPA Diatom Workshop (November 2022 -- SPANISH [https://open.neotomadb.org/Workshops/IAL_IPA-November2022/simple_workflow_ES.html])

Other workshop materials are available within the [Neotoma Workshops GitHub repository](https://github.com/NeotomaDB/Workshops). Some workshops are highly specialized, and some contain links to cloud-based versions of RStudio so that users can work on the problems and workflows under standardized conditions.
