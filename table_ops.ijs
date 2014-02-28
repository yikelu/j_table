NB. These utilities are for the JDB style tables
header =: 0 & {
body =: 1 & {

presel =: dyad define
    hy =. header y
    by =. body y
    col_take =. hy e. x
    taken =. col_take&# each (hy; < by)
)

sel =: dyad define
    > (x presel y)
)

exec =: dyad define
    > > body (x presel y)
)

perform =: dyad define
    (header y) =. (body y)
    ".x
)

filter =: dyad define
    (header y) =. (body y)
    row_take =. ".x
    > (header y) ; < (,row_take)&# each body y
)

where =: filter~

NB. These are to convert readcsv style tables to JDB style.
load 'tables/csv'

boxcols =: (< & |: & ,:)"1 & |:
boxstrcol =: <@:>
boxstrbody =: boxstrcol"1 @ |: @ }.

csv2table =:  header ,: boxstrbody NB. no parsing done

readcsvtab =: csv2table @ readcsv NB. same

NB. Need some type of parser extension here.

NB. Get some init methods ready for convenience
load 'data/jdb/northwind'
test_init =: monad define
    db_demo''
    db_init DBPATH
    cats =: Reads__D 'from Categories'
)
