class UserMailer < ApplicationMailer
    def welcome_email(book)
        @book = book 
        mail(to: @book.email, subject: "NEW RELEASE BOOK")        
    end
end
