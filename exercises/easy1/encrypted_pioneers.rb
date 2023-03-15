# LS solution less redundant than mine :'( :)

def rot13(text)
  text.split(//).map do |c|
    shift13(c)
  end.join('')
end

def shift13(c)
  val = c.ord
  case val
  when 97..122
    (val + 13 > 122 ? val - 13 : val + 13)
  when 65..90
    (val + 13 > 90 ? val - 13 : val + 13)
  else
    val
  end.chr
end

names = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

puts rot13(names)
