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
    # PREPARE variables here and use in app/views/home/print.pdf.erb
    # add supporting files
    LatexToPdf.config[:supporting] = %w(res.cls helvetica.sty)
    @hash = {}
    Metadata.find_all_by_standard(:t).each do |metadata|
      @hash[metadata.key] = metadata.value
    end
    @educations = Education.find_all_by_enabled(:t)
    @employers = Employer.where(:enabled => 't').order("id DESC")
    @freelancetasks = Task.where("employer_id is null").order("updated_at desc")
    @activities = Activity.find_all_by_enabled(:t)
    @publications = Publication.where(:enabled => :t).order("year DESC")
    @skills = Skill.find_all_by_enabled(:t)
    @personalinfo = Metadata.where(:enabled => :t, :standard => :f)
    begin
      render formats: [:pdf]
    rescue => e
      self.content_type = 'text/html'
      matches = e.message.match('See (.*) for details')
      if matches and matches.length > 1
      File.open(log) do |io|
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
  
  def print_as_string
    @pdf = render_to_string(action: 'print', formats: [:pdf])
    self.content_type = 'text/html'

    File.open(file="#{Rails.root}/tmp/a.pdf",'w:binary') do |io|
      io.write(@pdf)
    end

    render text: "wrote #{file}"
  end
end
