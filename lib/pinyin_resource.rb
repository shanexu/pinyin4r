require "singleton"

class PinyinResource
  include Singleton
  attr_accessor :dict
  def initialize
    @dict = {  };
    File.open(File.join(File.dirname(__FILE__), "..", "asserts", "unicode_to_hanyu_pinyin.txt")).each_line do |line|
      code, pinyin_raw = line.split
      @dict[code.to_i(16)] = pinyin_raw[1..-2].split(",")
    end
  end
end
