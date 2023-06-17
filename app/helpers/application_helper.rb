# frozen_string_literal: true

module ApplicationHelper
  def self.string_compare(string1, string2)
    I18n.transliterate(string1).downcase.gsub(' ', '') == I18n.transliterate(string2).downcase.gsub(' ', '')
  end
end
