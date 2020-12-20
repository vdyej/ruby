
dict = %w[Paste in any lyrics you want here. 


]

def remove_punct(dict) 
    dict = dict.join(" ").gsub(/[[:punct:]]/,"")
    dict = dict.split
    return dict
end 


dict = remove_punct(dict)


def how_many_times(word, dict)
    tally = Hash.new(0)
    p tally
        for d in dict do
            if d =~ word
                p d
                tally[word] += 1
            end

        end

    if tally.empty?
        p "Sorry, the lyricist doesn't seem to like that."
    elsif tally[word] == 1
        p "Well, that's surprising. That word shows up only once."
    elsif tally[word] > 10 
        p "Yep, the lyricist is mighty fond of that word. #{tally[word]} times in August and Everything After."
    else
        p "Great guess! #{tally[word]} times."
    end
end

how_many_times(/^blue$|^gray$|^red$|orange|yellow|black|^purpl|pink|silver|gold|white/i, dict)
# how_many_times(/^you$|^your$|^yours$/i, dict)
# how_many_times(/^she$|^shes$|^her$|^hers$|^herself$/i, dict)
# how_many_times(/^he$|^hes$|^him$|^his$|^himself$/i, dict)
# how_many_times(/^girl/i, dict)
# how_many_times(/^do$/i, dict)
# how_many_times(/^up/i, dict)
# how_many_times(/^no$/i, dict)
# how_many_times(/^yes$/i, dict)



