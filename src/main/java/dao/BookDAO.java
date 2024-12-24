package dao;

import model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/bookDB";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_BOOKS_SQL = "INSERT INTO books" + "  (name, isbn) VALUES " +
            " (?, ?);";

    private static final String SELECT_BOOKS_BY_ID = "select id,name,isbn from books where id =?";
    private static final String SELECT_ALL_BOOKS = "select * from books";
    private static final String DELETE_BOOKS_SQL = "delete from books where id = ?";
    private static final String UPDATE_BOOKS_SQL = "update books set name = ?,isbn=? where id = ?";

    public BookDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertBook(Book book) throws SQLException {
        System.out.println(INSERT_BOOKS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOKS_SQL)) {
            preparedStatement.setString(1, book.getName());
            preparedStatement.setString(2, book.getIsbn());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Book selectBook(int id) {
        Book books = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKS_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String isbn = rs.getString("isbn");
                books = new Book(id, name, isbn);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;
    }

    public List< Book > selectAllBooks() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Book > books = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String isbn = rs.getString("isbn");
                books.add(new Book(id, name, isbn));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;
    }

    public boolean deleteBook(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_BOOKS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateBook(Book book) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_BOOKS_SQL);) {
            statement.setString(1, book.getName());
            statement.setString(2,book.getIsbn());
            statement.setInt(3, book.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }      }
}
