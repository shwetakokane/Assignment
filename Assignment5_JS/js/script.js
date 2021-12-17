class book {
    constructor(bookId, bookName, authorName) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.authorName = authorName;
        this.displayDetails = function () {
            return this.bookId + " " + this.bookName + " " + this.authorName;
        };
    }
}
    
    
    
    const book1=new book("1","Rich Dad, Poor Dad", "Robert Kiyosaki and Sharon Lechter" );
    const result=document.getElementById("result");
    result.innerHTML=book1.displayDetails();
