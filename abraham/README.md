World Fact Book
================

This is a project that lets you traverse the World Fact Book xml and find facts that you might be looking for


#### To setup

```
$ git clone <repo>
$ cd <directory>
$ bundle install
```

You can run test with:

```
$ rspec
```
#### To find fact use the DSL

To start the program:

```
$ script/console
```

Than you can ask your question:

* available methods [greatest, smallest, list_countries]
* have you can pass options to the method
  * :inflation
  * :infant_mortality
  * :total_area
  * :population
  * limit as initeger
  * [:smallest, greatest]


### Examples:

Defaults to 1 result

```
WorldFactbook.greatest(:population)
```
or pass limit

```
WorldFactbook.smallest(:population, 5)
```

To get the country / continent list

defaults to A-Z

```
WorldFactbook.list_countries
```

to specify sort order

```
WorldFactbook.list_countries(:greatest)
```

or

```
WorldFactbook.list_countries(:smallest)
```
