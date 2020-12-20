def make_cipher(str, shift)
    str = str.split(//)
    coded = []
    p shift
    for word in str
        if word.ord >= 65 && word.ord <= 90
            if word.ord + shift >90
                newnum = (word.ord + shift)-26
                coded.push(newnum.chr)
            else 
                coded.push((word.ord + shift).chr)
            end
        elsif word.ord >= 97 && word.ord <= 122
            if word.ord + shift >122
                newnum = (word.ord + shift)-26
                coded.push(newnum.chr)
            else 
                coded.push((word.ord + shift).chr)
            end
        else 
            coded.push(word)
        end
    end
    p coded.join
end

def decode_cipher(str, shift)
    str = str.split(//)
    coded = []
    for word in str
        if word.ord >= 65 && word.ord <= 90
            if word.ord - shift <65
                newnum = (word.ord - shift)+26
                coded.push(newnum.chr)
            else 
                coded.push((word.ord - shift).chr)
            end
        elsif word.ord >= 97 && word.ord <= 122
            if word.ord - shift <97
                newnum = (word.ord - shift)+26
                coded.push(newnum.chr)
            else 
                coded.push((word.ord - shift).chr)
            end
        else 
            coded.push(word)
        end
    end
    p coded.join
end

make_cipher("This is my first Caesar shift encrypter!", 6)
decode_cipher("Znoy oy se loxyz Igkygx ynolz ktixevzkx!", 6)
