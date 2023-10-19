# test/models/book_test.rb

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @author = Author.create(name: "Eko Prasetio")
  end

  test "validasi judul tidak boleh kosong" do
    book = Book.new(author: @author, tahun_terbit: Date.new(2023, 1, 1), email: "test@example.com")
    assert_not book.save, "Disimpan buku dengan judul kosong"
  end

  test "validasi judul harus unik (case insensitive)" do
    existing_book = Book.create(judul: "Contoh Judul", tahun_terbit: Date.new(2023, 10, 19), author: @author, email: "test@example.com")
    book = Book.new(judul: "Contoh Judul", tahun_terbit: Date.new(2023, 10, 19), author: @author, email: "test@example.com")
    assert_not book.save, "Disimpan buku dengan judul yang sudah ada (case insensitive)"
  end

  test "validasi tahun_terbit tidak boleh kosong" do
    book = Book.new(judul: "Contoh Judul", author: @author, email: "test@example.com")
    assert_not book.save, "Disimpan buku dengan tahun_terbit kosong"
  end

  test "validasi author_id tidak boleh kosong" do
    book = Book.new(judul: "Contoh Judul", tahun_terbit: Date.new(2023, 10, 19), email: "test@example.com")
    assert_not book.save, "Disimpan buku tanpa author_id"
  end

  test "validasi email harus sesuai format" do
    book = Book.new(judul: "Contoh Judul", tahun_terbit: Date.new(2023, 10, 19), author: @author, email: "email-tidak-valid")
    assert_not book.save, "Disimpan buku dengan alamat email yang tidak valid"
  end

  test "validasi email harus valid" do
    book = Book.new(judul: "Contoh Judul", tahun_terbit: Date.new(2023, 10, 19), author: @author, email: "invalidemail@.com")
    assert_not book.save, "Disimpan buku dengan alamat email yang tidak valid"
  end

  test "validasi email harus valid (2)" do
    book = Book.new(judul: "Contoh Judul", tahun_terbit: 2023, author: @author, email: "invalid.email.com")
    assert_not book.save, "Disimpan buku dengan alamat email yang tidak valid"
  end
end
