class String
  PLURALS = [
    # Complete matches
    ["^loaf$","loaves"],
    ["^hoof$","hooves"],
    ["^man$","men"],
    ["^ox$","oxen"],
    ["^mouse$","mice"],
    ["^foot$","feet"],
    ["^goose$","geese"],
    ["^louse$","lice"],
    ["^tooth$","teeth"],
    ["^woman$","women"],
    # Partial matches
    ["person$","people"],
    ["child$","children"],
    ["ox$","oxes"],
    ["ife$","ives"],
    ["arf$","arves"],
    ["ero$","eroes"],
    ["ato$","atoes"],
    ["ano$","anoes"],
    ["y$","ies"],
    ["ss$","sses"],
    ["ch$","ches"],
    ["sh$","shes"],
    [ "s$","s" ],
    [ "$","s"]
  ]

  SINGULARS = [
    # Complete matches
    ["^loaves$","loaf"],
    ["^hooves$","hoof"],
    ["^men$","man"],
    ["^oxen$","ox"],
    ["^news$","news"],
    ["^mice$","mouse"],
    ["^feet$","foot"],
    ["^geese$","goose"],
    ["^lice$","louse"],
    ["^teeth$","tooth"],
    ["^women$","woman"],
    # Partial matches
    ["people$","person"],
    ["children$","child"],
    ["oxes$","ox"],
    ["ives$","ife"],
    ["arves$","arf"],
    ["eroes$","ero"],
    ["atoes$","ato"],
    ["anoes$","ano"],
    ["ies$","y"],
    ["sses$","ss"],
    ["ches$","ch"],
    ["shes$","sh"],
    ["s$",""]
  ]

  def camelize
    self.downcase.split("_").map(&:capitalize).join("")
  end

  def underscore
    self.gsub(/::/,'/').gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-","_").downcase
  end

  def pluralize
    plural = nil

    PLURALS.each do |match_exp, replacement_exp|
      if plural.nil?
        plural = self.gsub(Regexp.compile(match_exp), replacement_exp) unless match(Regexp.compile(match_exp)).nil?
      end
    end

    plural
  end

  def singularize
    singular = nil

    SINGULARS.each do |match_exp, replacement_exp|
      if singular.nil?
        singular = self.gsub(Regexp.compile(match_exp), replacement_exp) unless match(Regexp.compile(match_exp)).nil?
      end
    end

    return self.dup if singular.nil?
    singular
  end
end
