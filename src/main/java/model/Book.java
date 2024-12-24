package model;

public class Book {
    protected int id;
    protected String name;
    protected String isbn;

    public Book() {}

    public Book(String name, String isbn) {
        super();
        this.name = name;
        this.isbn = isbn;
    }

    public Book(int id, String name, String isbn) {
        super();
        this.id = id;
        this.name = name;
        this.isbn = isbn;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getIsbn() {
        return isbn;
    }
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

}
