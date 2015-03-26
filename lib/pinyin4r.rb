require 'pinyin_resource'

module Pinyin4r
  class << self
    def str_tr str
      str.each_char.map do |ch|
        char_tr ch
      end
    end
    
    def char_tr char
      code = char.ord
      if PinyinResource.instance.dict.has_key? code
        PinyinResource.instance.dict[code].map{|p| p[0..-2]}.uniq
      else
        [char]
      end
    end
  end
end
