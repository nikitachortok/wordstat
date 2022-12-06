# there lived# not long\ since/ one of those gentlemen that keep a lance in the lance-rack. an old buckler, a lean hack, and a greyhound for coursing o'clock.
# Test #apple /apple \fork door, rock. apple... flour| sleep test

def getHashOfSeparateWords(str)
    uniquWords = Hash.new
    for w in str.split(/[#\\\/\|.,\s*]/).reject { |c| c.empty? }
        t = w.downcase
    
        uniquWords[t] += 1 if uniquWords.has_key? t
    
        uniquWords.store(t, 1) if !uniquWords.has_key? t
    end

    return uniquWords
end

def getWordStat(str)
    uniquWords = getHashOfSeparateWords(str).reject{|_key, value| value < 2}.sort_by {|_key, value| value}.reverse.to_h
    
    res = []
    i = 0
    while i < 3 do
        res[i] = uniquWords.keys[i] if !uniquWords.keys[i].nil?

        i += 1
    end

    return res
end

system("cls")
puts 'Введите предложение: '
str = gets.chomp
res = getWordStat(str)

puts "Length: #{res.length()}"
puts "Result: #{res}"