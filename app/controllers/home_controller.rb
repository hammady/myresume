class HomeController < ApplicationController
  def index
    @skills_query = Skill.joins(:tasks).select("skills.name").group("skills.name").count
    @skills = @skills_query.map do |q|
      {:text => q[0], :weight => q[1]}
    end
    @skills_wordle = @skills_query.map do |q|
      { q[0] => q[1]}
    end
  end
  
  def print
    prepare_variables
    begin
      render formats: [:pdf]
    rescue => e
      self.content_type = 'text/html'
      matches = e.message.match('See (.*) for details')
      if matches and matches.length > 1
        File.open(matches[1]) do |io|
          render :text => "<h1>This is embarrasing!</h1><p>" \
            "An error occured during pdflatex compilation. " \
            "This should not happen, but if I were you, I would save this page " \
            "and email it to pdflatexerror {at} hammady [dot] net</p><pre>#{io.read}</pre>"
        end
      else
        raise e
      end
    end
  end
end
