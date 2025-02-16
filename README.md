# Book Lending Library

This is a simple book lending library application built with Ruby on Rails (version 8). The application allows users to manage books and track their lending history without requiring login or authentication.

## Features

- **Manage Books**: Users can create, view, update, and delete books.
- **Track Lending History**: The application records when a book is borrowed and returned, including the name of the borrower.
- **Borrowing and Returning Books**: Users can borrow and return books, prompting for the borrower's name.
- **View Borrowing History**: Users can view the borrowing history of a specific book and a specific borrower.

## Models

- **Book**: Represents a book in the library with attributes such as title and author. It includes validations to ensure data integrity and associations with borrowers to track lending history.
- **Borrower**: Represents a person who borrows books, with attributes such as name and validations for presence.

## Views

- **Books**: 
  - List all books
  - Show details of a single book, including its borrowing history
  - Forms for creating and editing books

- **Borrowers**: 
  - List all borrowers
  - Show details of a single borrower, including their borrowing history
  - Forms for creating and editing borrowers

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/Kamande14918/BookLendingLibrary
   cd book-lending-library
   ```

2. Install the required gems:
   ```
   bundle install
   ```

3. Set up the database:
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the Rails server:
   ```
   rails server
   ```

5. Open your browser and navigate to `http://localhost:3000`.

## Testing

The application includes model and controller tests to ensure functionality. You can run the tests using:
```
rails test
```

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements for the project.

## License

This project is open-source and available under the MIT License.