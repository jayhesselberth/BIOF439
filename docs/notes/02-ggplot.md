# Starting DataViz using R: ggplot2







### What is ggplot2?

- A second (and final) iteration of the ggplot
- Implementation of Wilkerson's Grammar of Graphics in R
- Conceptually, a way to layer different elements onto a canvas to create a data visualization
- Started as Dr. Hadley Wickham's PhD thesis (with Dr. Dianne Cook)
- Won the John M. Chambers Statistical Software Award in 2006

- Mimicked in other software platforms
  - `ggplot` and `seaborn` in Python
  - Translated in `plotly`


### ggplot2 uses the __grammar__ of __graphics__

.pull-left[
#### A grammar ...

- compose and re-use small parts
- build complex structures from simpler units

]

--

.pull-right[
#### of graphics ...

- Think of yourself as a painter
- Build a visualization  using layers on a canvas
- Draw layers on top of each other
]


### A dataset


```r
library(tidyverse) # do this once per session
beaches <- read_csv('data/sydneybeaches3.csv')
```

```
#>  # A tibble: 344 x 12
#>     date        year month   day season rainfall temperature enterococci
#>     <date>     <dbl> <dbl> <dbl>  <dbl>    <dbl>       <dbl>       <dbl>
#>   1 2013-01-02  2013     1     2      1      0          23.4         6.7
#>   2 2013-01-06  2013     1     6      1      0          30.3         2  
#>   3 2013-01-12  2013     1    12      1      0          31.4        69.1
#>   4 2013-01-18  2013     1    18      1      0          46.4         9  
#>   5 2013-01-24  2013     1    24      1      0          27.5        33.9
#>   6 2013-01-30  2013     1    30      1      0.6        26.6        26.5
#>   7 2013-02-05  2013     2     5      1      0.1        25.7        66.9
#>   8 2013-02-11  2013     2    11      1      8          22.2       118. 
#>   9 2013-02-17  2013     2    17      1     13.6        26.3        75  
#>  10 2013-02-23  2013     2    23      1      7.2        24.8       311. 
#>  # … with 334 more rows, and 4 more variables: day_num <dbl>,
#>  #   month_num <dbl>, month_name <chr>, season_name <chr>
```

<p align="right" style="font-size: 10pt;">Credit: D. J. Navarro</p>

## Building a graph


.pull-left[
#### Start with a blank canvas


```r
ggplot()
```
]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-3-1.png" width="672" />

]


.pull-left[
#### Add a data set


```r
ggplot(
  data = beaches #<<
)
```
]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-4-1.png" width="672" />

]


.pull-left[
#### Add a mapping from data to elements


```r
ggplot(
  data = beaches,
  mapping = aes( #<<
    x = temperature, #<<
    y = rainfall #<<
  )
)
```

What goes in 

- the x and y axes
- the color of markers
- the shape of markers
]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-5-1.png" width="672" />

]


.pull-left[
#### Add a geometry to draw


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point() #<<
```

What to draw:

- Points, lines
- histogram, bars, pies
]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-6-1.png" width="672" />

]


.pull-left[
#### Add options for the geom


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(size = 4) #<<
```


]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-7-1.png" width="672" />

]


.pull-left[
#### Add a mapping to modify the geom


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(
    mapping = aes(color = season_name), #<<
    size = 4
  )
```

> Anything data-driven has to be a mapping, driven by the `aes` function

]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-8-1.png" width="672" />

]


.pull-left[
#### Split into facets


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(
    mapping = aes(color = season_name),
    size = 4
  ) +
  facet_wrap( ~ season_name) #<<
```

]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-9-1.png" width="672" />

]


.pull-left[
#### Remove the legend


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(
    mapping = aes(color = season_name),
    size = 4,
    show.legend = FALSE #<<
  ) +
  facet_wrap( ~ season_name) 
```

]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-10-1.png" width="672" />

]


.pull-left[
#### Change the background


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(
    mapping = aes(color = season_name),
    size = 4,
    show.legend = FALSE
  ) +
  facet_wrap( ~ season_name) +
  theme_bw() #<<
```

]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-11-1.png" width="672" />

]


.pull-left[
#### Update the labels


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(
    mapping = aes(color = season_name),
    size = 4,
    show.legend = FALSE
  ) +
  facet_wrap( ~ season_name) +
  theme_bw() +
  labs(x = 'Temperature (C)', y = 'Rainfall (mm)') #<<
```

]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-12-1.png" width="672" />

]


.pull-left[
#### Add titles


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(
    mapping = aes(color = season_name),
    size = 4,
    show.legend = FALSE
  ) +
  facet_wrap( ~ season_name) +
  theme_bw() +
  labs(x = 'Temperature (C)', 
       y = 'Rainfall (mm)',
       title = 'Sydney weather by season', #<<
       subtitle = "Data from 2013 to 2018") #<<
```

]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-13-1.png" width="672" />

]


.pull-left[
#### Customize


```r
ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall
  )
) +
  geom_point(
    mapping = aes(color = season_name),
    size = 4,
    show.legend = FALSE
  ) +
  facet_wrap( ~ season_name) +
  theme_bw() +
  labs(x = 'Temperature (C)', 
       y = 'Rainfall (mm)',
       title = 'Sydney weather by season', 
       subtitle = "Data from 2013 to 2018") +
  theme(axis.title = element_text(size = 14), #<<
        axis.text = element_text(size = 12), #<<
        strip.text = element_text(size = 12)) #<<
```

]
.pull-right[

#### 

<img src="02-ggplot_files/figure-html/unnamed-chunk-14-1.png" width="672" />

]


### The grammar

- Data
- Aesthetics (or aesthetic mappings)
- Geometries (as layers)
- Facets
- Themes
- (Coordinates)
- (Scales)


## Exercise 1


## Peeking under the hood

.pull-left[
#### If I write...


```r
ggplot(
  data = beaches,
  aes(x = temperature,
      y = rainfall)
) + 
  geom_point()
```

]
--
.pull-right[
#### what's really run is ...


```r
ggplot(
  data = beaches, 
  mapping = aes(
    x = temperature, y = rainfall)) + 
layer(
  geom = "point",
  stat = "identity",
  position = "identity") + 
facet_null() +
theme_grey() + 
coord_cartesian() + 
scale_x_continuous() + 
scale_y_continuous()
```

]

--

#### Each element can be adapted and tweaked to create graphs


## Exploring aesthetics


### Mapping color

.pull-left[

```r
ggplot(
  data=beaches,
  aes(x = date,
      y = log10(enterococci),
      color = season_name)
) + 
  geom_line()
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-17-1.png" width="672" />

]


### Adding groups to the mapping

.pull-left[

```r
ggplot(
  data=beaches,
  aes(x = date,
      y = log10(enterococci),
      color = season_name,
      group = 1) #<<
) + 
  geom_line()
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-18-1.png" width="672" />

]


### Fixing the legend ordering

.pull-left[

```r
ggplot(
  data=beaches,
  aes(x = date,
      y = log10(enterococci),
      color = fct_relevel(season_name, c('Spring','Summer','Autumn','Winter')), #<<
      group = 1)
) + 
  geom_line()
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-19-1.png" width="672" />

]

--

## Whoops!!!


### Fixing the legend ordering

.pull-left[

```r
ggplot(
  data=beaches,
  aes(x = date,
      y = log10(enterococci),
      color = fct_relevel(season_name, c('Spring','Summer','Autumn','Winter')),
      group = 1)
) + 
  geom_line()+
  labs(color = 'Seasons') #<<
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-20-1.png" width="672" />

]


### You can also fill based on data

.pull-left[

```r
ggplot(
  data=beaches,
  aes(x = log10(enterococci),
      fill = season_name))+
  geom_histogram()
```


This is not a great plot. We'll refine this idea later

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-21-1.png" width="672" />

]


## Exercise 2


## Exploring geometries


## Univariate plots


### Histograms

.pull-left[

```r
library(tidyverse)
library(rio)
dat_spine <- import('data/Dataset_spine.csv', 
                    check.names = T)

ggplot(
  data=dat_spine,
  aes(x = Degree.spondylolisthesis))+
  geom_histogram()
```
]
.pull-right[

```
#>  `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

<img src="02-ggplot_files/figure-html/unnamed-chunk-22-1.png" width="672" />

]



### Histograms

.pull-left[

```r
ggplot(
  data=dat_spine,
  aes(x = Degree.spondylolisthesis))+
  geom_histogram(bins = 100) #<<
```

This gives a very different view of the data
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-23-1.png" width="672" />

]

### Density plots

.pull-left[

```r
ggplot(
  data=dat_spine,
  aes(x = Degree.spondylolisthesis))+
  geom_density() #<<
```
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-24-1.png" width="672" />

]


### Density plots

.pull-left[

```r
ggplot(
  data=dat_spine,
  aes(x = Degree.spondylolisthesis))+
  geom_density(adjust = 1/5) # Use 1/5 the bandwidth #<<
```
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-25-1.png" width="672" />

]


### Layering geometries

.pull-left[

```r
ggplot(
  data=dat_spine,
  aes(x = Degree.spondylolisthesis,
      y = stat(density)))+  # Re-scales histogram #<<
  geom_histogram(bins = 100, fill='yellow') +
  geom_density(adjust = 1/5, color = 'orange', size = 2)
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-26-1.png" width="672" />

]


### Bar plots (categorical variable)

.pull-left[

```r
dat_brca <- rio::import('data/clinical_data_breast_cancer_modified.csv', 
                   check.names = T)
ggplot(
  data=dat_brca,
  aes(x = Tumor))+
  geom_bar()
```
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-27-1.png" width="672" />

]


### Bar plots (categorical variable)

.pull-left[

```r
dat_brca <- import('data/clinical_data_breast_cancer_modified.csv', 
                   check.names = T)
ggplot(
  data=dat_brca,
  aes(x = Tumor,
      fill = ER.Status))+ #<<
  geom_bar()
```

Add additional information via mapping
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-28-1.png" width="672" />
]


### Bar plots (categorical variable)

.pull-left[

```r
dat_brca <- import('data/clinical_data_breast_cancer_modified.csv', 
                   check.names = T)
ggplot(
  data=dat_brca,
  aes(x = Tumor,
      fill = ER.Status))+ 
  geom_bar(position = 'dodge')  #<<
    # Default is position = "stack"
```

Change the nature of the geometry
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-29-1.png" width="672" />
]

???

It is not easy to do patterns in R. Its been considered a bug rather than a feature,
since you can induce cognitive problems using patterns. It is suggested to use 
different palettes for distinguishing groups


### Graphing tabulated data

.pull-left[

```r
tabulated <- dat_brca %>% count(Tumor)
tabulated
```

```
#>  # A tibble: 4 x 2
#>    Tumor     n
#>    <chr> <int>
#>  1 T1       15
#>  2 T2       65
#>  3 T3       19
#>  4 T4        6
```

```r
ggplot(
  data = tabulated,
  aes(x = Tumor, y = n)) +
  geom_bar()
```

```
#>  Error: stat_count() must not be used with a y aesthetic.
```

<img src="02-ggplot_files/figure-html/unnamed-chunk-30-1.png" width="672" />
]


### Graphing tabulated data

.pull-left[

```r
tabulated <- dat_brca %>% count(Tumor)
tabulated

ggplot(
  data = tabulated,
  aes(x = Tumor, y = n)) +
  geom_bar(stat = 'identity') #<<
```

Here we need to change the default computation    

The barplot usually computes the counts (`stat_count`)  

We suppress that here since we have already   
done the computation
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-31-1.png" width="672" />

]


### Peeking under the hood

.pull-left[

```r
plt <- ggplot(
  data = tabulated,
  aes(x = Tumor, y = n)) +
  geom_bar()

plt$layers
```

```
#>  [[1]]
#>  geom_bar: width = NULL, na.rm = FALSE
#>  stat_count: width = NULL, na.rm = FALSE
#>  position_stack
```

]
.pull-right[

```r
plt <- ggplot(
  data = tabulated,
  aes(x = Tumor, y = n)) +
  geom_bar(stat = 'identity')

plt$layers
```

```
#>  [[1]]
#>  geom_bar: width = NULL, na.rm = FALSE
#>  stat_identity: na.rm = FALSE
#>  position_stack
```

]

--

> Each layer has a geometry, statistic and position associated with it


## Bivariate plots


### Scatter plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = temperature))+
  geom_point()
```
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-34-1.png" width="672" />

]

### Scatter plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = temperature))+
  geom_line() #<<
```
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-35-1.png" width="672" />

]


### Scatter plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = temperature))+
  geom_point(color='black', size = 3) +
  geom_line(color='red',size=2)
```

Layer points and lines
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-36-1.png" width="672" />

]


### Scatter plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = temperature))+
  geom_line(color='red',size=2) + #<<
  geom_point(color='black', size = 3) #<<
```

Order of laying down geometries matters

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-37-1.png" width="672" />

]


### Doing some computations

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = temperature)) +
  geom_point() +
  geom_smooth() #<<
```

Averages over 75% of the data
]
.pull-right[

```
#>  `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

<img src="02-ggplot_files/figure-html/unnamed-chunk-38-1.png" width="672" />

]


### Doing some computations

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = temperature)) +
  geom_point() 
```

Averages over 10% of the data
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-39-1.png" width="672" />

]


### Computations over groups

.pull-left[

```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, 
      y = Degree.spondylolisthesis)) +
  geom_point() +
  geom_smooth()
```
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-40-1.png" width="672" />

]


### Computations over groups

.pull-left[

```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, 
      y = Degree.spondylolisthesis,
      color = Class.attribute)) + #<<
  geom_point() +
  geom_smooth()
```

Computation is done by groups
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-41-1.png" width="672" />

]


### Computations over groups

.pull-left[

```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, 
      y = Degree.spondylolisthesis,
      color = Class.attribute)) + 
  geom_point() +
  geom_smooth() +
  xlim(0, 100)#<<
```

Ignore the outlier for now
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-42-1.png" width="672" />

]


### Computations over groups

.pull-left[

```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, 
      y = Degree.spondylolisthesis)) +
  geom_point() +
  geom_smooth(aes(color = Class.attribute)) + #<<
  xlim(0, 100)
```

Only color-code the smoothers   

You can change the plot based on where you map the aesthetic
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-43-1.png" width="672" />

]


### Computations over groups

.pull-left[

```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, 
      y = Degree.spondylolisthesis)) +
  geom_point() +
  geom_smooth(aes(color = Class.attribute),
              se = F) + #<<
  xlim(0, 100)
```

Remove the confidence bands    

Maybe a cleaner look
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-44-1.png" width="672" />

]



### Box Plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_boxplot()
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-45-1.png" width="672" />
]


### Box Plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_boxplot()
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-47-1.png" width="672" />
]


### Violin plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_violin() #<<
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-48-1.png" width="672" />
]


### Strip plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_point()
```

Points are overlayed on each other
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-49-1.png" width="672" />
]


### Strip plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_jitter() #<<
```

Jittering allows all points to be seen

Maybe too much
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-50-1.png" width="672" />
]


### Strip plots

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_jitter(width = 0.2) #<<
```

Jittering allows all points to be seen

Maybe too much
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-51-1.png" width="672" />
]


### Layers, again

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_boxplot() + #<<
  geom_jitter(width = 0.2)
```


]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-52-1.png" width="672" />
]


### Layers, again

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = season_name, 
      y = temperature)) + 
  geom_violin() + #<<
  geom_jitter(width = 0.2)
```


]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-53-1.png" width="672" />
]



## Exploring grouped data


.pull-left[
#### Let's start here


```r
ggplot(
  data = beaches,
  aes(x = temperature,
      fill = season_name)) + 
  geom_density()
```

Not very useful
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-54-1.png" width="672" />

]


.pull-left[
#### Overlaying graphs


```r
ggplot(
  data = beaches,
  aes(x = temperature,
      fill = season_name)) + 
  geom_density(alpha = 0.4) #<<
```

Make graphs more transparent

Still pretty cluttered
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-55-1.png" width="672" />

]


.pull-left[
#### Exploding graphs


```r
ggplot(
  data = beaches,
  aes(x = temperature,
      fill = season_name)) + 
  geom_density() + 
  facet_wrap(~ season_name, ncol = 1) #<<
```

Let's explode these out

This is called "small multiples" (Tufte) or "trellis graphics" (Cleveland)
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-56-1.png" width="672" />

]

--

> Notice that all the graphs have the same x-axis. This is a good thing


.pull-left[
#### Exploding graphs


```r
ggplot(
  data = beaches,
  aes(x = temperature,
      fill = season_name)) + 
  geom_density() + 
  facet_wrap(~ season_name, nrow = 1) #<<
```

We can arrange them the other way too

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-57-1.png" width="672" />

]

--



.pull-left[
#### Re-arranging graphs


```r
ggplot(
  data = beaches,
  aes(x = temperature,
      fill = season_name)) + 
  geom_density() + 
  facet_wrap(~season_name, ncol = 2) #<<
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-58-1.png" width="672" />
]


.pull-left[
#### Creating a grid of graphs


```r
ggplot(
  data = beaches,
  aes(x = temperature)) +
  geom_density(aes(fill = season_name)) +
  facet_grid(rows = vars(season_name),#<<
             cols = vars(year))#<<
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-59-1.png" width="672" />

]


### Grids of graphs

.pull-left[
#### Start with a blank slate


```r
ggplot(
  data = beaches) +
  facet_grid(rows = vars(season_name),
             cols = vars(year))
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-60-1.png" width="672" />

]


### Grids of graphs

.pull-left[
#### Create geoms you want


```r
ggplot(
  data = beaches) +
  facet_grid(rows = vars(season_name),
             cols = vars(year))+
  geom_point(aes(x = temperature, y = rainfall)) #<<
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-61-1.png" width="672" />
]


## Scales


.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = enterococci)) + 
  geom_point()
```

All the action is happening in the bottom bit
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-62-1.png" width="672" />

]


.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = enterococci)) + 
  geom_point() + 
  scale_y_log10() #<<
```

Log-transforming an axis can make things easier to see
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-63-1.png" width="672" />

]


.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = enterococci)) + 
  geom_point() + 
  scale_y_log10( #<<
    labels = scales::number_format(digits=3)) #<<
```

Making the labels a bit easier to read
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-64-1.png" width="672" />

]

???

`scales::number_format` is calling the function `number_format` from the 
package `scales`


## Order and orientation


## Arrests in the USA in 1973

.pull-left[

```r
arrests <- import('data/USArrests.csv')
ggplot(
  data = arrests,
  aes(x = State, 
      y = Murder)) + 
  geom_bar(stat = 'identity')
```

This plot is very hard to read

There is no ordering, and states can't be read
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-65-1.png" width="672" />

]

## Arrests in the USA in 1973

.pull-left[

```r
arrests <- import('data/USArrests.csv')
ggplot(
  data = arrests,
  aes(x = fct_reorder(State, Murder), # Order by murder rate #<<
      y = Murder)) + 
  geom_bar(stat = 'identity')
```

We see the pattern, but its still unreadable
]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-66-1.png" width="672" />

]


## Arrests in the USA in 1973

.pull-left[

```r
arrests <- import('data/USArrests.csv')
ggplot(
  data = arrests,
  aes(x = fct_reorder(State, Murder), # Order by murder rate 
      y = Murder)) + 
  geom_bar(stat = 'identity') + 
  coord_flip() #<<
```

Flipping the axes makes the states readable

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-67-1.png" width="672" />

]


## Arrests in the USA in 1973

.pull-left[

```r
arrests <- import('data/USArrests.csv')
ggplot(
  data = arrests,
  aes(x = fct_reorder(State, Murder), # Order by murder rate 
      y = Murder)) + 
  geom_bar(stat = 'identity') + 
  labs(x = 'State', y = 'Murder rate') + #<<
  theme_bw() +#<<
  theme(panel.grid.major.y = element_blank(),#<<
        panel.grid.minor.y = element_blank()) + #<<
  coord_flip()
```

Cleaning it up a little


]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-68-1.png" width="672" />

]

???

Note that we flip after we've done all the manipulation


## Themes


## Color schemes

ggplot comes with a default color scheme. There are several other schemes available

- `scale_*_brewer` uses the [ColorBrewer](http://colorbrewer2.org) palettes
- `scale_*_gradient` uses gradients
- `scale_*_distill` uses the ColorBrewer palettes, for continuous outcomes

> Here * can be `color` or `fill`, depending on what you want to color
>
> Note `color` refers to the outline, and `fill` refers to the inside


.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = enterococci,
      color = temperature)) + 
  geom_point() +
  scale_y_log10(name = 'Enterococci',
                label = scales::number_format(digits=3))
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-69-1.png" width="672" />
]

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = enterococci,
      color = temperature)) + 
  geom_point() +
  scale_y_log10(name = 'Enterococci',
                label = scales::number_format(digits=3))+
  scale_color_gradient(low = 'white', high='red') + 
  theme_dark()
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-70-1.png" width="672" />
]

.pull-left[

```r
ggplot(
  data = beaches,
  aes(x = date, y = enterococci,
      color = temperature)) + 
  geom_point() +
  scale_y_log10(name = 'Enterococci',
                label = scales::number_format(digits=3))+
  scale_color_gradient(low = 'blue', high='red') + 
  theme_bw()
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-71-1.png" width="672" />
]

### Specifying colors

.pull-left[

```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, y = Degree.spondylolisthesis,
      color = Class.attribute)) +
  geom_point() + 
  geom_smooth(se = F) + 
  coord_cartesian(xlim = c(0, 100), ylim = c(0,200))
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-72-1.png" width="672" />

]


## Specifying colors

.pull-left[

```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, y = Degree.spondylolisthesis,
      color = Class.attribute)) +
  geom_point() + 
  geom_smooth(se = F) + 
  coord_cartesian(xlim = c(0, 100), ylim = c(0,200)) + 
  scale_color_manual(values = c("Normal"="blue", 'Abnormal' = 'red'))
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-73-1.png" width="672" />

]

### Themes

You can create your own custom themes to keep a unified look to your graphs

ggplot comes with

- theme_bw
- theme_void
- theme_dark
- theme_gray
- theme_light
- theme_minimal


### Themes

.pull-left[
#### Create your own


```r
ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, y = Degree.spondylolisthesis,
      color = Class.attribute)) +
  geom_point() + 
  geom_smooth(se = F) + 
  coord_cartesian(xlim = c(0, 100), 
                  ylim = c(0,200))
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-74-1.png" width="672" />
]


### Themes

.pull-left[
#### Create your own


```r
my_theme <- function(){
  theme_bw()
}

ggplot(
  data = dat_spine,
  aes(x = Sacral.slope, y = Degree.spondylolisthesis,
      color = Class.attribute)) +
  geom_point() + 
  geom_smooth(se = F) + 
  coord_cartesian(xlim = c(0, 100), 
                  ylim = c(0,200)) +
  my_theme() #<<
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-75-1.png" width="672" />
]



### Themes

.pull-left[
#### Create your own


```r
my_theme <- function(){
  theme_bw() +
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 16),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=14),
        strip.background = element_blank())
}

ggplot(
  data = dat_brca,
  aes(x = Tumor))+
  geom_bar() + 
  facet_grid(rows = vars(ER.Status),
             cols = vars(PR.Status))
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-76-1.png" width="672" />
]


### Themes

.pull-left[
#### Create your own


```r
my_theme <- function(){
  theme_bw() +
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 16),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=14),
        strip.background = element_blank())
}

ggplot(
  data = dat_brca,
  aes(x = Tumor))+
  geom_bar() + 
  facet_grid(rows = vars(ER.Status),
             cols = vars(PR.Status)) +
  my_theme() #<<
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-77-1.png" width="672" />
]


## Animations


### gganimate

The new `gganimate` package has made it very easy to create animations

It's literally a few lines


.pull-left[

```r
library(gganimate)
plt <- ggplot(beaches,
              aes(date, temperature))+
  geom_path(aes(color = season_name, group = 1))+
  geom_point()

plt
```

]
.pull-right[
<img src="02-ggplot_files/figure-html/unnamed-chunk-78-1.png" width="672" />

]


.pull-left[

```r
library(gganimate)
plt <- ggplot(beaches,
              aes(date, temperature))+
  geom_path(aes(color = season_name, group = 1))+
  geom_point()

plt + transition_reveal(date)
```

]
.pull-right[

![](img/anime-1.gif)
]
