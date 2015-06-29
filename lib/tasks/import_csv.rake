namespace :db do
  namespace :seed do
    task :file, [:path] => :environment do |t, args|

      print "Parsing CSV: #{args[:path]}\n"
      STDOUT.flush
      csv_data = CSV.read args[:path]
      headers = csv_data.shift.map {|i| i.to_s.downcase.to_sym }
      string_data = csv_data.map {|row|
        row.map {|cell| cell.to_s }
      }
      array_of_hashes = string_data.map {|row|
        Hash[*headers.zip(row).flatten]
      }

      array_of_hashes.each_with_index { |item, index|
        print "(#{index+1}/#{array_of_hashes.length}) Adding #{item[:left]} by #{item[:right]}...\n"
        STDOUT.flush
        left_choice = item[:left].chomp("?")
        right_choice = item[:right].chomp("?")
        choice1 = Choice.where(text: left_choice).first_or_create
        choice2 = Choice.where(text: right_choice).first_or_create
        pair = Pair.where(left: choice1, right: choice2).first_or_create
      }

      print "Done!"
      STDOUT.flush
    end
  end
end