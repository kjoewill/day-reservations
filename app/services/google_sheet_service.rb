require 'roo-google'

class GoogleSheetService
    
    class GoogleSheetService
        @@url = 'https://docs.google.com/spreadsheets/d/1_NWv1apT0RxHGMFuiiFn9EVynhpiIO16y19ygDDlwUM'
      
        def self.fetch_data
          spreadsheet = Roo::Google.new(@@url)
          worksheet = spreadsheet.sheet(0)  # Assuming you want the first sheet
      
          data = []
      
          worksheet.each_row_streaming do |row|
            data << row.map(&:value)
          end
      
          data
        end
    end