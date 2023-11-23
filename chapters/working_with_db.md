# Working with the Raw Data

Neotoma is a Postgres database. The data is stored on a database server in the cloud and most people interact with the database indirectly, either through the [Neotoma Explorer](https://apps.neotomadb.org), the [`neotoma2` R package](gttps://github.com/NeotomaDB/neotoma2), [Range Mapper](https://open.neotomadb.org/RangeMapper) or other tools.  Much of this manual discusses the raw, underlying data that powers these tools. They all pull their data from the Neotoma API, which is an application that sends data from the database over the internet using specially constructed URLs.

An open API, like Neotoma's is useful because all you need to access the data is an internet connection and the ability to understand JSON (either by scanning it visually, or using a programming language like Python, R or JavaScript).  For example:

```
https://api.neotomadb.org/v2.0/data/sites?sitename=Marion Lake
```

returns a JSON object that provides metadata about the sites in Neotoma that use the name "Marion Lake". More details about the API can be obtained from the online help for the API at https://api.neotomadb.org.


## Using the Database Locally

Users who wish to gain more experience working directly with SQL, or who need to undertake specialized analysis that is not supported by the R package or available APIs may choose to use the database directly. This involves installing PostgreSQL and associated add-ons (PostGIS in particular). Users should be aware that the database is not a program that they are commonly familiar with. The database runs in the background and users will generally "connect" to the database from R, Python, or another programming language, or they may use a database tool such as pgAdmin or dBeaver. Postgres also comes with the commandline tool `psql`, where a user can connect directly to the database from the terminal and type their queries directly.

![Using the `psql` commandline utility is one way of directly interacting with the database if you have a connection to a database server with Neotoma data loaded.](assets/using_psql.webm)

