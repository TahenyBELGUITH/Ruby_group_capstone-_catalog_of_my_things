class Main
  def initialize
    @app = App.new
    @output = 0
  end

  def options
    print 'WELCOME TO THE CATALOGUE OF MY THINGS APP'
    while @output != 10
      print "\nPlease choose an option by entering a number \n\n"
      print "1 - List all books \n"
      print "2 - List all  music albums \n"
      print "3 - List ALL games \n"
      print "4 - List all genres (e.g 'Comedy', 'Thriller') \n"
      print "5 - List all labels (e.g. 'Gift', 'New') \n"
      print "6 - List all authors (e.g. 'Stephen King') \n"
      print "7 - Add a book \n"
      print "8 - Add a music album \n"
      print "9 - Add a game \n"
      print "10 - Quit \n"
      start_app
    end
  end
end

main = Main.new
main.options

# need add app class
