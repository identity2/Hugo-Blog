---
title: "SQLite Database Singleton Class for iOS in Swift 3"
date: 2017-06-25T10:50:00+08:00
thumbnail: ""
static_page: false
draft: false
---
Writing code for database querying or updating can be tedious, error-prone, and hard to manage. Therefore, abstracting the database operations into a globally accessible model class may be a nice solution. In this article, I will show you how to write a [singleton](https://en.wikipedia.org/wiki/Singleton_pattern) class which wraps the database operations. I will use [FMDB](https://github.com/ccgus/fmdb) (SQLite) with Swift 3 to demonstrate, but it is just about the same for every languages and frameworks.

## The Singleton Class
By using the singleton pattern, we can

1. Make sure only one object of the class is instantiated throughout the app.
2. Access the object of the class globally.

Since usually, we only have one database across the app, it is a good idea to ensure only one database accessing class is instanced. Not to mention that multiple instances of database accessing class would cause problematic inconsistencies. On top of that, by making the class accessible globally, we can fetch data from the database at ease in any part of the program.

<br />

Below is the outline of the database singleton class:

{{< highlight swift "linenos=table" >}}
class DatabaseAccessor {
    
    // The instance of DatabaseAccessor
    static let sharedInstance = DatabaseAccessor()
    
    // Private initializer to avoid instancing by other classes
    private init() {}

    /* ... */
}
{{< / highlight >}}

The member `sharedInstance` is assigned to `DatabaseAccessor`'s own initializer, so you will have an `DatabaseAccessor` object available. Furthermore, since `sharedInstance` is marked as `static`, it not only will be loaded before any access to `DatabaseAccessor` but also can be accessed globally by `DatabaseAccessor.sharedInstance`.

<br />

Lastly, the `init()` is declared as `private` so it can only be instanced in the scope of the `DatabaseAccessor` class, implying that only one instance is allowed in the entire program.

<br />

Before moving on to abstracting the operations, I have to warn you that though singletons are super convenient, it could cause inconsistency problems if the program is multi-threaded. So, use singletons with caution if your program consists of multiple threads.

## Opening and Closing the database
Carry on to implementing the abstraction of database operations. First, let us do the simplest, opening and closing the database (again, I will be using FMDB for simplicity, the syntax may differ for other database frameworks):

{{< highlight swift "linenos=table" >}}
class DatabaseAccessor {
    static let sharedInstance = DatabaseAccessor()
    private init() {}

    // The instance of the SQLite database
    private var mainDB: FMDatabase?

    public func initializeDatabase() {
        let databasePath = (dirPath as NSString).appendingPathComponent("database.sqlite") as NSString
        
        // Assign the instanced database.
        mainDB = FMDatabase(path: databasePath as String)
    }

    public func closeDatabase() {
        mainDB?.close()
    }
}
{{< / highlight >}}

In the beginning, we add a private `mainDB` variable to store the actual database instance. In `initializeDatabase()`, we store the database path in `databasePath`, instance a `FMDatabase` object (the main database instance), and assign it to `mainDB`.

<br />

For `closeDatabase()`, we simply call `mainDB?.close()` to close the database.

## SELECT, UPDATE, INSERT Operations
Now moving on to the most important part -- implementing the database operations. This includes `SELECT`, `UPDATE`, and the `INSERT` operations.

<br />

Suppose that we have the table `Contact` stored in the database, and it consists of the following columns and entries:

{{< highlight md >}}
    ID    |   Name   |   Phone    |   City
==============================================
    0     |   Alex   |  59301934  |    York
    1     |   Mark   |  29481048  |   London
    2     |   Kate   |  12490289  |   Sin City
    3     |   Bill   |  29849102  |   Seattle 
{{< / highlight >}}

The declaration of the table:

{{< highlight sql >}}
CREATE TABLE `Contact` (
	`ID`	INTEGER NOT NULL UNIQUE,
	`Name`	VARCHAR NOT NULL,
	`Phone`	INTEGER NOT NULL UNIQUE,
	`City`	VARCHAR NOT NULL,
	PRIMARY KEY(`ID`)
);
{{< / highlight >}}

#### Data Model
To interact with the database entries, it is essential to create a data model class for each entries so that the data could also be abstracted. Below is the data model class (structure).

{{< highlight swift "linenos=table" >}}
struct Contact {
    var id: Int
    var name: String
    var phoneNumber: Int
    var city: String
}
{{< / highlight >}}

#### addContact, updateContact, searchContact
After declaring the data model, interacting with the database becomes super easy. We'll have to add entries to the database first, so let's implement the `addContact(_:)` method.

{{< highlight swift "linenos=table" >}}
func addContact(_ contact: Contact) {
    let queryString = "INSERT INTO Contact (ID, Name, Phone, City) VALUES (\(contact.id), \(contact.name), \(contact.phoneNumber), \(contact.city))"
    mainDB!.executeUpdate(queryString, withArgumentsIn: nil)
}
{{< / highlight >}}

This inserts the new contact into the database by using the SQL syntax `INSERT INTO`-`VALUES`.

<br />

After adding entries to the database, updating an existing data is also essential. This is why we need the `updateContact(_:)` function.

{{< highlight swift "linenos=table" >}}
func updateContact(_ contact: Contact) {
    let queryString = "UPDATE Contact SET Name = \(Contact.name), Phone = \(Contact.phoneNumber), City = \(Contact.city) WHERE ID = \(Contact.id)"
    mainDB!.executeUpdate(queryString, withArgumentsIn: nil)
}
{{< / highlight >}}

We use `UPDATE`-`SET` and take `ID` as the key to update the database entry.

<br />

Lastly, the ultimate goal for creating database is to search entries efficiently. We will implement multiple "search" functions so that we can search contacts by different information.

{{< highlight swift "linenos=table" >}}
func searchContactByID(_ id: Int) -> Contact? {
    let queryString = "SELECT * FROM Contact WHERE ID = \(id)"
    
    // Execute query and save the results.
    let queryResults: FMResultSet? = mainDB?.executeQuery(queryString, withArgumentsIn: nil)

    // Check if there are results.
    if queryResults?.next() == true { 
        let contactName = queryResults!.string(forColumn: "Name")
        let contactPhone = Int(queryResults!.int(forColumn: "Phone"))
        let contactCity = queryResults!.string(forColumn: "City")

        return Contact(id: id, name: contactName, phoneNumber: contactPhone, city: contactCity)
    }
    
    // No matching results.
    return nil
}

func searchContactByName(_ name: String) -> [Contact] {
    let queryString = "SELECT * FROM Contact WHERE Name = \(name)"
    let queryResults: FMResultSet? = mainDB?.executeQuery(queryString, withArgumentsIn: nil)
    
    // Save the results into an array.
    var results = [Contact]()
    
    while queryResults?.next() == true { 
        let contactID = Int(queryResults!.int(forColumn: "ID"))
        let contactPhone = Int(queryResults!.int(forColumn: "Phone"))
        let contactCity = queryResults!.string(forColumn: "City")

        // Append the result to the results array.
        results.append(Contact(id: contactID, name: name, phoneNumber: contactPhone, city: contactCity))
    }
  
    return results
}
{{< / highlight >}}

Since `searchContactByPhone(_:)` and `searchContactByCity(_:)` are similar to `searchContactByID(_:)` and `searchContactByName(_:)` respectively, pardon me for omitting them.

<br />

We use `SELECT * FROM` to fetch the entire row and `WHERE` to limit the search results to certain conditions. Note that for `searchContactByID(_:)`, the return type is `Contact?`, however, for `searchContactByName(_:)`, the return type is `[Contact]`. This is because `ID` is a unique key, the result will be either **exactly one** or **none**. If none, we simply return `nil`. On the other hand, since `Name` is not a unique key (people may share the same name), we return an array of all matching contacts. If there are no matching results, we will return an empty `[Contact]`.

<br />

(Incidentally, because `queryResults!.int(forColumn:)` returns the type `Int32`, we should cast it to `Int` by `Int(...)`.)

## Conclusion
By wrapping the operations into a singleton class, accessing database could be made within a single line of code. For example, whenever I need to search for people named *Bill*, I just need to do a single function call:

{{< highlight swift "linenos=table" >}}
var peopleNamedBill = DatabaseAccessor.sharedInstance.searchContactByName("Bill")
{{< / highlight >}}

And we will get the results from the database. Simple and clear.

## P.S.
I am working on the [PowerUp-iOS](https://github.com/systers/powerup-iOS) project as a Google Summer of Code (GSoC) student from June to August. Since I am developing everything in Swift 3.0, I will (hopefully) be posting articles about Swift and iOS dev during these couple of months.