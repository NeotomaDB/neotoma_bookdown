### Searching for Sites

There are several ways to find sites in `neotoma2` using the R package. We think of `sites` as being primarily spatial objects. `sites` have names, locations, and are found within the context of geopolitical units. Within the API and in the package, the site itself does not have associated information about taxa, dataset types or ages. The site is the container into which we add that information.  So, when we search for sites we can search by:

| Parameter | Description |
| --------- | ----------- |
| sitename | A valid site name (case insensitive) using `%` as a wildcard. |
| siteid | A unique numeric site id from the Neotoma Database |
| loc | A bounding box vector, geoJSON or WKT string. |
| altmin | Lower altitude bound for sites. |
| altmax | Upper altitude bound for site locations. |
| database | The constituent database from which the records are pulled. |
| datasettype | The kind of dataset (see `get_tables(datasettypes)`) |
| datasetid | Unique numeric dataset identifier in Neotoma |
| doi | A valid dataset DOI in Neotoma |
| gpid | A unique numeric identifier, or text string identifying a geopolitical unit in Neotoma |
| keywords | Unique sample keywords for records in Neotoma. |
| contacts | A name or numeric id for individuals associuated with sites. |
| taxa | Unique numeric identifiers or taxon names associated with sites. |

All sites in Neotoma contain one or more datasets. It's worth noting that the results of these search parameters may be slightly unexpected. For example, searching for sites by sitename, latitude, or altitude will return all of the datasets for the particular site. Searching for terms such as datasettype, datasetid or taxa will return the site, but the only datasets returned will be those matching the dataset-specific search terms. We'll see this later.

#### Site names: `sitename="%Lago%"`

We may know exactly what site we're looking for ("Lago Grande di Monticchio"), or have an approximate guess for the site name (for example, we know it's something like "Lago Grande", or "Grande Lago Grande", but we're not sure how it was entered specifically), or we may want to search all sites that have a specific term, for example, *Lago*.

We use the general format: `get_sites(sitename="%Lago%")` for searching by name.

PostgreSQL (and the API) uses the percent sign as a wildcard.  So `"%Lago%"` would pick up ["Lago Grande di Monticchio"](https://data.neotomadb.org/26607) for us (and picks up "Lago di Martignano" and "Lago Padule").  Note that the search query is also case insensitive, so you could simply write `"%LAGO%"`.

##### Code

```{r sitename, eval=FALSE}
lac_sites <- neotoma2::get_sites(sitename = "%Lago %")
plotLeaflet(lac_sites)
```

##### 3.1.1.2. Result

```{r sitenamePlot, echo=FALSE}
lac_sites <- neotoma2::get_sites(sitename = "%Lago %")
plotLeaflet(lac_sites)
```

#### 3.1.2. Location: `loc=c()` {.tabset}

The original `neotoma` package used a bounding box for locations, structured as a vector of latitude and longitude values: `c(xmin, ymin, xmax, ymax)`.  The `neotoma2` R package supports both this simple bounding box, but also more complex spatial objects, using the [`sf` package](https://r-spatial.github.io/sf/). Using the `sf` package allows us to more easily work with raster and polygon data in R, and to select sites from more complex spatial objects.  The `loc` parameter works with the simple vector, [WKT](https://arthur-e.github.io/Wicket/sandbox-gmaps3.html), [geoJSON](http://geojson.io/#map=2/20.0/0.0) objects and native `sf` objects in R.

As an example of searching for sites using a location, we've created a rough representation of Italy as a polygon.  To work with this spatial object in R we also transformed the `geoJSON` element to an object for the `sf` package.  There are many other tools to work with spatial objects in R. Regardless of how you get the data into R, `neotoma2` works with almost all objects in the `sf` package.

```{r boundingBox}
geoJSON <- '{"coordinates":
  [[
      [8.22, 44.13],
      [12.44, 41.72],
      [15.86, 37.82],
      [18.61, 39.99],
      [12.20, 45.39],
      [13.62, 45.86],
      [13.45, 46.46],
      [12.21, 47.11],
      [10.41, 46.69],
      [6.99, 45.97],
      [6.87, 44.34],
      [8.22, 44.13]
      ]],
  "type":"Polygon"}'

italy_sf <- geojsonsf::geojson_sf(geoJSON)

# Note here we use the `all_data` flag to capture all the sites within the polygon.
# We're using `all_data` here because we know that the site information is relatively small
# for Italy. If we were working in a new area or with a new search we would limit the
# search size.
italy_sites <- neotoma2::get_sites(loc = italy_sf, all_data = TRUE)
```

You can always simply `plot()` the `sites` objects, but you will lose some of the geographic context.  The `plotLeaflet()` function returns a `leaflet()` map, and allows you to further customize it, or add additional spatial data (like our original bounding polygon, `sa_sf`, which works directly with the R `leaflet` package):

##### 3.1.2.1. Code

```{r plotL, eval=FALSE}
neotoma2::plotLeaflet(italy_sites) %>% 
  leaflet::addPolygons(map = ., 
                       data = italy_sf, 
                       color = "green")
```

##### 3.1.2.2. Result

```{r plotLeaf, echo=FALSE}
neotoma2::plotLeaflet(italy_sites) %>% 
  leaflet::addPolygons(map = ., 
                       data = italy_sf, 
                       color = "green")
```
