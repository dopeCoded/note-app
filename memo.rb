require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

if memo_type == 1
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
	file_name = gets.chomp

  puts "メモ内容を記載してください。Ctrl+Dで保存します。"
	memo = STDIN.read

	CSV.open("#{file_name}.csv", "w", quote_char: "") do |csv| # quote_charオプションを追加
  	csv << [memo]
end

elsif memo_type == 2
	puts "既存のメモを編集します。拡張子を除いた既存のファイル名を入力して下さい。"
	file_name = gets.chomp
	
	puts "メモしたい内容を入力して下さい。"
	puts "完了したらCtrl+Dをおします。"
	memo = STDIN.read
  
  CSV.open("#{file_name}.csv", "a", quote_char: "") do |csv| # quote_charオプションを追加
  	csv << [memo]
end

else

	puts "1か2を入力してください."
    
end
