/*:

 # Your shopping cart

 Now, it's your turn to create your shopping list.
 
 Assume that you want to buy following books:

 * "Digital Fortress" by "Dan Brown", $9.99
 * "Angels & Demons" by "Dan Brown", $17.00
 * "The Da Vinci Code" by "Dan Brown", $9.99
 * "Deception Point" by "Dan Brown", $17.00
 * "Harry Potter and the Goblet of Fire" by "J.K. Rowling", $12.99
 * "Harry Potter and the Half-Blood Prince" by "J.K. Rowling", $12.99
 * "Harry Potter and the Deathly Hallows" by "J.K. Rowling", $14.99
 * "旅行與讀書" by "詹宏志", $12.00
 * "國宴與家宴" by "王宣一", $7.99

 Then, let's create a book store first:
 
 */
let books: [[String: String]] = [
["author": "Dan Brown", "title": "Digital Fortress", "price": "9.99"],
["author": "Dan Brown", "title": "Angels & Demons", "price": "17.00"],
["author": "Dan Brown", "title": "The Da Vinci Code", "price": "9.99"],
["author": "Dan Brown", "title": "Deception Point", "price": "17.00"],
["author": "J.K. Rowling", "title": "Harry Potter and the Goblet of Fire", "price": "12.99"],
["author": "J.K. Rowling", "title": "Harry Potter and the Half-Blood Prince", "price": "12.99"],
["author": "J.K. Rowling", "title": "Harry Potter and the Deathly Hallows", "price": "14.99"],
["author": "詹宏志", "title": "旅行與讀書", "price": "12.00"],
["author": "王宣一", "title": "1國宴與家", "price": "7.99"],
]

/*:
 
 And, let's show the book store shopping cart:
 
 */

var bookStore = BookStore.from(books)

/*:
 
 Now start to feed data to the book store.
 
 You have to prepare following functions:
 1. A function which returns the name of authors in a set or a list. 
    _Note, you have to remove duplicated authors._
 2. A function which returns the totoal price of books to purchase
 3. A function which returns the number of books to buy
 4. A function which returns a book with its title, author, and price by a given index.
    If the index is out of bound, return `nil`.
 
 */

// Use this
//func distinctAuthors() -> Set<String> { ... }
// or this
//func distinctAuthors() -> [String] { ... }
// then
//bookStore.setDataSource(authorsGetter: distinctAuthors)

//func totalBookPrice() -> Double { ... }
//bookStore.setDataSource(priceCalculator: totalBookPrice)

//func getBook(at index: Int) -> (title: String, author: String, price: Double)? { return nil }
//bookStore.setDataSource(bookGetter: getBook(at:))
func distinctAuthors() -> Set<String> {
    var authorset :Set<String> = []
    for author in books{
    authorset.insert(author["author"]!)}
    return authorset
}
bookStore.setDataSource(authorsGetter: distinctAuthors)
func totalBookPrice() -> Double {
    var totalprice :Double = 0
    for price in books{
        totalprice += Double(price["price"]!)!}
    return totalprice
}
bookStore.setDataSource(priceCalculator: totalBookPrice)

func getBook(at index: Int) -> (title: String, author: String, price: Double)? {
    if index>=0 && index<books.count{
        var title :String = ""
        
        title = books[index]["title"]!
        var author :String = ""
        
            author = books[index]["author"]!
        var price :Double = 0
    
        price += Double(books[index]["price"]!)!
    
        return (title, author, price)
    }
    else{
        return nil} }
bookStore.setDataSource(bookGetter: getBook(at:))
/*:

 Finally, let's show the book store shopping cart:

 */

bookStore.showInPlayground()

//: ---
//: [<- Previous](@previous) | [Next ->](@next)
